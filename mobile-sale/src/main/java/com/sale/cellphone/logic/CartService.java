package com.sale.cellphone.logic;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.cellphone.dto.CartDTO;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.repository.SanPhamRepository;

@Service
public class CartService {

	@Autowired
	private SanPhamRepository sanPhamRepository;

	@Autowired
	private HttpSession session;

	@SuppressWarnings("unchecked")
	public ArrayList<CartDTO> addCart(Integer productId) {
		SanPham sp = sanPhamRepository.findById(productId).orElse(null);
		ArrayList<CartDTO> listCart = (ArrayList<CartDTO>) session.getAttribute("cart");

		if (sp != null) {
			if (listCart != null) {
				CartDTO cart = listCart.stream().filter(p -> productId == p.getIdSanPham()).findAny().orElse(null);
				if (cart != null) {
					cart.setSoLuong(cart.getSoLuong() + 1);
				} else {
					listCart.add(new CartDTO(sp.getIdSanPham(), sp.getName(), sp.getPrice(), 1, sp.getImage()));
				}
				session.setAttribute("cart", listCart);
			} else {
				listCart = new ArrayList<>();
				listCart.add(new CartDTO(sp.getIdSanPham(), sp.getName(), sp.getPrice(), 1, sp.getImage()));
				session.setAttribute("cart", listCart);
			}
		}

		return (ArrayList<CartDTO>) session.getAttribute("cart");
	}

	@SuppressWarnings("unchecked")
	public ArrayList<CartDTO> removeCart(Integer productId) {
		ArrayList<CartDTO> listCart = (ArrayList<CartDTO>) session.getAttribute("cart");

		if (listCart != null) {
			CartDTO cart = listCart.stream().filter(p -> productId == p.getIdSanPham()).findAny().orElse(null);
			if (cart != null) {
				if (cart.getSoLuong() == 1) {
					listCart.remove(cart);
				} else {
					cart.setSoLuong(cart.getSoLuong() - 1);

				}
			}
			session.setAttribute("cart", listCart);
		}
		return (ArrayList<CartDTO>) session.getAttribute("cart");
	}

	@SuppressWarnings("unchecked")
	public ArrayList<CartDTO> getCart() {
		return (ArrayList<CartDTO>) session.getAttribute("cart");
	}
}
