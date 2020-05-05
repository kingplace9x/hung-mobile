package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.admin.mobile.sale.entities.NhanVien;
import com.admin.mobile.sale.form.UpdatePasswordForm;
import com.admin.mobile.sale.service.AccountService;
import com.admin.mobile.sale.validator.UpdatePasswordValidator;

@Controller
public class AccountController {
	@Autowired
	private UpdatePasswordValidator updatePasswordValidator;
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/admin/account")
	public String account(Model model) {
		model.addAttribute("updatePasswordForm", new UpdatePasswordForm());
		return "admin/account";
	}
	
	@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
	@GetMapping("/admin/accounts")
	public String accounts(Model model, Pageable pageable) {
		Page<NhanVien> page = accountService.findAll(PageRequest.of(pageable.getPageNumber(), 7));
		model.addAttribute("page", page);
		return "admin/accounts";
	}
	
	@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
	@PostMapping("/admin/accounts/delete")
	public String accountsDelete(Integer accountId) {
		if(!accountService.delete(accountId)) {
			return "redirect:/admin/accounts?deleteError";			
		}
		return "redirect:/admin/accounts?deleteSuccess";		
	}
	
	@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
	@GetMapping("/admin/accounts/edit/{accountId}")
	public String accountsEdit(Model model,@PathVariable Integer accountId) {
		
		NhanVien account = accountService.findById(accountId);
		model.addAttribute("account", account);
		
		return "admin/editAccount";		
	}
	
	@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
	@PostMapping("/admin/accounts/save")
	public String accountsSave(Model model, NhanVien nhanVien) {
		
		if(!accountService.save(nhanVien)) {
			model.addAttribute("error", true);
			model.addAttribute("account", nhanVien);
			return "admin/editAccount";
		}
		return "redirect:/admin/accounts?saveSuccess";
	}
	
	@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
	@GetMapping("/admin/accounts/new")
	public String accountsNew(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("account", new NhanVien());
		return "admin/editAccount";
	}
	
	@PostMapping("/admin/account/change-password")
	public String accountChangePassword(Model model, @Validated UpdatePasswordForm updatePasswordForm, BindingResult errors) {
		updatePasswordValidator.validate(updatePasswordForm, errors);
		if(errors.hasErrors()) {
			model.addAttribute("updatePasswordForm", updatePasswordForm);
			model.addAttribute("err", true);
			return "admin/account";
		}
		accountService.changePassword(updatePasswordForm.getNewPassword());
		return "redirect:/admin/account?success";
	}
	
}
