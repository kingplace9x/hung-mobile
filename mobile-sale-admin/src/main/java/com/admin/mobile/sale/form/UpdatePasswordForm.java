package com.admin.mobile.sale.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class UpdatePasswordForm {
	
	@NotNull(message = "Mật khẩu hiện tại không được để trống")
	@NotBlank(message = "Mật khẩu hiện tại không được để trống")
	private String currentPassword;
	
	@NotNull(message = "Mật khẩu hiện tại không được để trống")
	@NotBlank(message = "Mật khẩu mới không được để trống")
	private String newPassword;
	
	private String confirmPassword;
	
}
