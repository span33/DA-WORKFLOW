package com.da.activiti.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.activiti.engine.identity.User;
import org.hibernate.validator.constraints.Email;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.base.Objects;

/**
 \* @author Santosh Pandey
 \* Date: 5/24/17
 */
public class UserForm implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 251046264223565292L;

	@NotNull
    @Size(min = 5, max = 15)
    private String userName;

   
    @NotNull
    @Size(min = 5, max = 15)
    private String password;

    @NotNull
    @Email
    private String email;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;
    
    @NotNull
    private String department;
    
    @NotNull
    private String role;

    public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}

	

    public UserForm() {
    }

    

    public UserForm(String userName, String password, String email, String firstName, String lastName, String role,String department) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.department = department;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserForm)) return false;

        UserForm userForm = (UserForm) o;

        if (userName != null ? !userName.equals(userForm.userName) : userForm.userName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return userName != null ? userName.hashCode() : 0;
    }

   

    @Override
	public String toString() {
		return "UserForm [userName=" + userName + ", password=" + password + ", email=" + email + ", firstName="
				+ firstName + ", lastName=" + lastName + ", department=" + department + ", role=" + role + "]";
	}



	public static UserForm fromUser(User user) {
        UserForm userForm = new UserForm();
        userForm.setUserName(user.getId());
        userForm.setPassword(user.getPassword());
        userForm.setFirstName(user.getFirstName());
        userForm.setLastName(user.getLastName());
        userForm.setEmail(user.getEmail());
       
        return userForm;

    }
    
 public static User fromUser(User user ,UserForm userForm) {
    	
        user.setFirstName(userForm.getFirstName());
        user.setLastName(userForm.getLastName());
        user.setPassword(userForm.getPassword());
        user.setEmail(userForm.getEmail());
        return user;

    }
}
