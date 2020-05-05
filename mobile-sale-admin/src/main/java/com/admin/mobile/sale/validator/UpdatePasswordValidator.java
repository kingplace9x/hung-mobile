package com.admin.mobile.sale.validator;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.admin.mobile.sale.bean.LoginUserDetails;
import com.admin.mobile.sale.form.UpdatePasswordForm;

@Component
public class UpdatePasswordValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UpdatePasswordForm.class.equals(clazz);
	}
	
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Override
	public void validate(Object target, Errors errors) {
		UpdatePasswordForm form = (UpdatePasswordForm) target;
		
		LoginUserDetails loginUser = (LoginUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(!errors.hasFieldErrors("currentPassword")) {
			
			if(!passwordEncoder.matches(form.getCurrentPassword(), loginUser.getPassword())) {
				errors.rejectValue("currentPassword", "custom.currentPassword.message", new Object[] {}, "Mật khẩu hiện tại không đúng");
			}
		}

		if(!errors.hasFieldErrors("newPassword")) {
			
			if(form.getNewPassword().equals(form.getCurrentPassword())) {
				errors.rejectValue("newPassword", "custom.newPassword.message", new Object[] {}, "Không được trùng với mật khẩu hiện tại");
			}
			
		}
		
		if(!errors.hasFieldErrors("confirmPassword")){
			if(!form.getNewPassword().equals(form.getConfirmPassword())) {
				errors.rejectValue("confirmPassword", "custom.confirmPassword.message", new Object[] {}, "Mật khẩu mới không trùng khớp");
			}
		}
	}

}
