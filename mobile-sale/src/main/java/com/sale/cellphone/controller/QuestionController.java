package com.sale.cellphone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sale.cellphone.service.HoiDapService;

@Controller
public class QuestionController {

	@Autowired
	private HoiDapService hoiDapService;

	@PostMapping("/question")
	@ResponseBody
	public ResponseEntity<?> cauHoi(Integer idSanPham, String question) {
		return hoiDapService.newQuestion(idSanPham, question) ? ResponseEntity.ok("OK")
				: ResponseEntity.badRequest().body("Bad request");
	}
}
