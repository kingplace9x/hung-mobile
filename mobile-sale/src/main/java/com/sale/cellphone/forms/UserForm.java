package com.sale.cellphone.forms;

import lombok.Data;

@Data
public class UserForm {
	@javax.validation.constraints.Email(message = "Email không đúng")
	private String email;
	private String adrress;
	private String name;
	private String providerId;
	private String phone;
}
