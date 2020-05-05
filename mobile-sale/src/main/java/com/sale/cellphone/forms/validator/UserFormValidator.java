package com.sale.cellphone.forms.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sale.cellphone.forms.UserForm;

@Service
public class UserFormValidator implements Validator{
	private final String PHONE_PATTERN = "^[(+84)0][0-9]{7,12}";
	
	@Override
	public boolean supports(Class<?> clazz) {
		return UserForm.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		UserForm form = (UserForm) target;
		form.setPhone(form.getPhone().replace(" ", ""));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "", "Bạn cần nhập tên");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "", "Vui lòng nhập số điện thoại");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adrress", "", "Vui lòng nhập địa chỉ");
		if(errors.hasErrors()) {
			return;
		}
		if(!form.getPhone().matches(PHONE_PATTERN)) {
			errors.rejectValue("phone", "", "Số điên thoại không đúng");
			return;
		}
	}

}
