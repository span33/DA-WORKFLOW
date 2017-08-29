package com.da.activiti.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.FormBuilder.UserDao;
import com.da.activiti.model.UserForm;
import com.da.activiti.workflow.WFConstants;
import com.da.activiti.workflow.WorkflowService;
import com.da.util.ServiceHelper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * \* @author Santosh Pandey Date: 5/18/14
 */
@Service("userService")
public class UserService {
	public static final String SYSTEM_USER = "SYSTEM";
	private static final Logger LOG = LoggerFactory.getLogger(UserService.class);

	@Autowired
	protected IdentityService identityService;
	@Autowired
	protected RuntimeService runtimeService;
	@Autowired
	protected TaskService taskService;
	@Autowired
	protected WorkflowService workflowService;
	@Autowired
	protected UserDao userDao;

	/**
	 * @return a
	 *         {@link org.springframework.security.core.userdetails.UserDetails}
	 *         using Spring Security. Note that this method will return null if
	 *         called outside of a HTTP request (e.g. from within a task
	 *         thread}.
	 */
	public UserDetails currentUser() {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userDetails;
	}

	@Transactional
	public void submitForApproval(UserForm userForm) {
		User user = identityService.createUserQuery().userId(userForm.getUserName()).memberOfGroup("").singleResult();
		if (user != null) {
			throw new IllegalArgumentException("User with name: " + userForm.getUserName() + " already exists");
		}
		Map<String, Object> processVariables = Maps.newHashMap();
		processVariables.put("approved", Boolean.FALSE);
		processVariables.put("userForm", userForm);
		ProcessInstance pi = runtimeService.startProcessInstanceByKey(WFConstants.PROCESS_ID_USER_APPROVAL,
				processVariables);
		Task task = taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult();
		// taskService.addCandidateGroup(task.getId(), userForm.getGroup());

		LOG.debug("beginning user registration workflow with instance id: " + pi.getId());
	}

	@Transactional
	public boolean createUser(UserForm userForm) {
		boolean status = false;
		if (identityService.createUserQuery().userId(userForm.getUserName()).count() == 0) {

			// Following data can already be set by demo setup script

			User user = identityService.newUser(userForm.getUserName());

			UserForm.fromUser(user, userForm);
			identityService.saveUser(user);
			List<String> groups = getGroupByUserForm(userForm);

			if (groups != null) {
				for (String group : groups) {
					identityService.createMembership(user.getId(), group);
				}
			}
			status = true;
		} else {
			LOG.debug("User {} already exists - not creating.", userForm.getUserName());
		}

		return status;

	}

	@Transactional
	public void deleteUser(String userId) {
		identityService.deleteUser(userId);
	}

	@Transactional
	public void updateUser(UserForm userForm) {
		User user = identityService.createUserQuery().userId(userForm.getUserName()).singleResult();
		userForm.setPassword(user.getPassword());
		UserForm.fromUser(user, userForm);
		identityService.saveUser(user);
		System.out.println(user.getId());
		List<String> groups = getGroupByUserForm(userForm);
		this.identityService.createGroupQuery().groupMember(userForm.getUserName()).groupType("SECURITY-ROLE").list()
				.forEach(index -> {
					System.out.println("index.getId()::::" + index.getId());
					identityService.deleteMembership(user.getId(), index.getId());
				});
		this.identityService.createGroupQuery().groupMember(userForm.getUserName()).groupType("ASSIGNMENT").list()
				.forEach(index -> identityService.deleteMembership(user.getId(), index.getId()));
		if (groups != null) {
			for (String group : groups) {
				identityService.createMembership(user.getId(), group);
			}
		}

	}

	@Transactional
	public void saveGroup(String groupId, String type) {
		if (identityService.createGroupQuery().groupId(groupId).count() == 0) {
			Group newGroup = identityService.newGroup(groupId);
			newGroup.setName(groupId.substring(0, 1).toUpperCase() + groupId.substring(1));
			newGroup.setType(type);
			identityService.saveGroup(newGroup);
		} else {
			LOG.debug("Demo group: {} already exists - not creating", groupId);
		}
	}

	@Transactional
	public void deleteGroup(String groupId) {
		if (identityService.createGroupQuery().groupId(groupId).count() != 0) {
			identityService.deleteGroup(groupId);
		} else {
			LOG.debug("Demo group: {} not exists - not creating", groupId);
		}
	}
	/*
	 * @Transactional public void submitForApproval(DocDetails docDetails) {
	 * Map<String, Object> processVariables = Maps.newHashMap();
	 * processVariables.put("approved", Boolean.FALSE);
	 * processVariables.put("docDetails", docDetails);
	 * 
	 * 
	 * 
	 * ProcessInstance pi =
	 * runtimeService.startProcessInstanceByKey(WFConstants.
	 * PROCESS_ID_USER_APPROVAL, processVariables); Task task =
	 * taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()
	 * ).singleResult(); taskService.setAssignee(task.getId(),
	 * docDetails.getUserName()); List <DocType> docType =
	 * workflowService.findExistingBaseDocTypes();
	 * taskService.setVariableLocal(task.getId(), "taskOutcome", "Submitted");
	 * taskService.setVariables(task.getId(), processVariables);
	 * taskService.complete(task.getId()); LOG.debug(
	 * "beginning user registration workflow with instance id: " + pi.getId());
	 * }
	 */

	/**
	 * @return a Map keyed by {@code UserId (e.g. kermit, gonzo, etc.}
	 *         associated with a List of {@code assignemnt}
	 *         {@link org.activiti.engine.identity.Group Groups}.
	 * @see UserService#userWithAssignmentGroups()
	 */
	public Map<String, List<Group>> userWithAssignmentGroups() {
		Map<String, List<Group>> userMap = Maps.newHashMap();
		List<User> users = identityService.createUserQuery().list();
		for (User currUser : users) {
			LOG.debug(currUser.getId());
			List<Group> groups = this.identityService.createGroupQuery().groupMember(currUser.getId())
					.groupType("ASSIGNMENT").list();
			List<Group> currentGroups = Lists.newArrayList();
			for (Group group : groups) {
				LOG.debug("    " + group.getId() + " - " + group.getType());
				currentGroups.add(group);
			}
			userMap.put(currUser.getId(), currentGroups);
		}
		return userMap;
	}

	/**
	 * @return a Map keyed by {@code UserId (e.g. kermit, gonzo, etc.}
	 *         associated with a List of {@code assignemnt} groups as Strings
	 *         (e.g. {engineering, management, etc.}.
	 */
	public Map<String, List<String>> userWithAssignmentGroupStr() {
		Map<String, List<String>> userMap = Maps.newHashMap();
		List<User> users = identityService.createUserQuery().list();
		for (User currUser : users) {
			LOG.debug(currUser.getId());
			List<Group> groups = this.identityService.createGroupQuery().groupMember(currUser.getId())
					.groupType("ASSIGNMENT").list();
			List<String> currentGroups = Lists.newArrayList();
			for (Group group : groups) {
				LOG.debug("    " + group.getId() + " - " + group.getType());
				currentGroups.add(group.getId());
			}
			userMap.put(currUser.getId(), currentGroups);
		}
		return userMap;
	}

	/**
	 * @param userId
	 * @return List of all {@link org.activiti.engine.identity.Group Groups} of
	 *         type {@code ASSIGNMENT} to which the given user belongs.
	 */
	public List<Group> getAssignmentGroups(String userId) {
		List<Group> groups = identityService.createGroupQuery().groupMember(userId).groupType("ASSIGNMENT")
				.orderByGroupId().asc().list();
		return groups;
	}

	public List<Group> getRoles() {
	List<Group> securityGroups = identityService.createGroupQuery().groupType("SECURITY-ROLE").orderByGroupId()
			.asc().list();
	return securityGroups ;
}

	/**
	 * @return List of all {@link org.activiti.engine.identity.User Users}
	 *         converted to {@link com.da.activiti.model.UserForm UserForms}
	 */
	public List<UserForm> getAllUsers() {
		List<User> users = this.identityService.createUserQuery().orderByUserId().asc().list();
		List<UserForm> userForms = Lists.newArrayList();
		for (User user : users) {
			UserForm userForm = UserForm.fromUser(user);
			List<Group> department = identityService.createGroupQuery().groupMember(userForm.getUserName())
					.groupType(WFConstants.ASSIGNMENT).list();
			List<Group> securityRoles = identityService.createGroupQuery().groupMember(userForm.getUserName())
					.groupType(WFConstants.SECURITY_ROLE).list();

			final List<String> departmentNames = new ArrayList<>();
			department.forEach(index -> {
				departmentNames.add(index.getId());
			});
			userForm.setDepartment(ServiceHelper.convertListToCommaSepratedString(departmentNames));
			List<String> groupNames = new ArrayList<>();
			securityRoles.forEach(index -> {
				groupNames.add(index.getId());
			});
			userForm.setRole(ServiceHelper.convertListToCommaSepratedString(groupNames));
			userForms.add(userForm);
		}
		userForms.forEach(index -> index.setPassword("XXXXXXXXXX"));
		return userForms;
	}

	/**
	 * @return List of {@link o dzrg.activiti.engine.identity.Group Groups} with
	 *         type of {@code ASSIGNMENT}.
	 */
	public List<Group> getAllAssignmentGroups() {
		List<Group> groups = identityService.createGroupQuery().groupType("ASSIGNMENT").orderByGroupId().asc().list();
		return groups;
	}

	/**
	 * @return List of {@link o dzrg.activiti.engine.identity.Group Groups} with
	 *         type of {@code ASSIGNMENT}.
	 */
	public Map<String, List<Group>> getAllGroups() {
		Map<String, List<Group>> groupMap = new HashMap<>();
		List<Group> assigmentGroups = identityService.createGroupQuery().groupType("ASSIGNMENT").orderByGroupId().asc()
				.list();
		List<Group> securityGroups = identityService.createGroupQuery().groupType("SECURITY-ROLE").orderByGroupId()
				.asc().list();
		groupMap.put(WFConstants.ASSIGNMENT, assigmentGroups);
		groupMap.put("ROLES", securityGroups);

		return groupMap;
	}

	/**
	 * @return List of {@link o dzrg.activiti.engine.identity.Group Groups} with
	 *         type of {@code ASSIGNMENT}.
	 */
	public List<Group> getAllRoles() {
		List<Group> securityGroups = identityService.createGroupQuery().groupType("SECURITY-ROLE").orderByGroupId()
				.asc().list();
		identityService.createGroupQuery().groupType("ASSIGNMENT").orderByGroupId().asc().list()
				.forEach(index -> securityGroups.add(index));
		return securityGroups;
	}

	public List<UserForm> getUserByAmountToApprove(final int amount) {

		List<User> users = identityService.createUserQuery().memberOfGroup("Approver").list();
		Stream<User> stream = users.stream();
		List<UserForm> userForms = Lists.newArrayList();
		stream.filter(
				user -> (Integer.parseInt(identityService.getUserInfo(user.getId(), "LIMIT_TO_APPROVE")) >= amount))
				.collect(Collectors.toList()).forEach(user -> {
					userForms.add(UserForm.fromUser(user));
				});
		return userForms;
	}

	public List<UserForm> getUserListByRole(String role) {
		List<User> users = identityService.createUserQuery().memberOfGroup(role).list();
		List<UserForm> userForms = Lists.newArrayList();
		users.forEach(user -> {
			userForms.add(UserForm.fromUser(user));
		});
		return userForms;

	}

	public List<String> fetchUserByDepartments(String departments) {
		List<String> group = ServiceHelper.convertCommaSepratedStringToList(departments);
		List<String> users = new ArrayList<String>();
		group.forEach(index -> identityService.createUserQuery().memberOfGroup(index).list()
				.forEach(user -> users.add(user.getId())));

		return users;
	}

	private List<String> getGroupByUserForm(UserForm userForm) {
		List<String> groups = ServiceHelper.convertCommaSepratedStringToList(userForm.getRole());
		ServiceHelper.convertCommaSepratedStringToList(userForm.getDepartment()).forEach(index -> groups.add(index));
		return groups;
	}
}
