package com.sap;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

class test implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public test(String name) {
		super();
		this.name = name;
	}
}

public class SerializationDeserialzationDemo {

	public static List<Employee> populateEmployeeList() throws CloneNotSupportedException {
		Employee emp = new Employee();
		emp.setEmpId(1);
		emp.setFirstName("Emp1");
		emp.setLastName("Pandey");
		Department dept1 = new Department();
		dept1.setDeptId(1);
		dept1.setDeptName("Dept1");
		Department dept2 = new Department();
		dept2.setDeptId(2);
		dept2.setDeptName("Dept2");
		emp.getDept().add(dept1);
		emp.getDept().add(dept2);
		List<Employee> al = new ArrayList<Employee>();
		al.add(emp);
		return al;

	}

	public static void main(String[] args) throws CloneNotSupportedException {

		ObjectMapper mapper = new ObjectMapper();

		try {

			List<test> empList1 = new ArrayList<test>();
			empList1.add(new test("santosh"));
			String jsonInString = mapper.writeValueAsString(populateEmployeeList());
			System.out.println(jsonInString);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
