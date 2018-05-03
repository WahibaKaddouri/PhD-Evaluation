package com.evaluation.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
@Entity
public class Role {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String roleName;

	
	public Role(){}

	public Role(int id, String roleName) {
		super();
		this.id = id;
		this.roleName = roleName;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}


	
}
