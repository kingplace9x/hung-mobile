package com.admin.mobile.sale.bean;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import com.admin.mobile.sale.entities.NhanVien;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class LoginUserDetails implements UserDetails{

	private static final long serialVersionUID = -6285250757789615744L;
	
	private final NhanVien nhanVien;
	private final String role;
	public LoginUserDetails(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
		role = nhanVien.getRole().toString();
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return AuthorityUtils.createAuthorityList(nhanVien.getRole().toString());
	}

	@Override
	public String getPassword() {
		return nhanVien.getPassword();
	}

	@Override
	public String getUsername() {
		return nhanVien.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return nhanVien.isStatus();
	}

}
