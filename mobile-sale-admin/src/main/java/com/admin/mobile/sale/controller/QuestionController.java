package com.admin.mobile.sale.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.admin.mobile.sale.entities.HoiDap;
import com.admin.mobile.sale.repository.HoiDapRepository;
import com.admin.mobile.sale.service.HoidapService;


@Controller
public class QuestionController {

	@Autowired
	private HoiDapRepository hoiDapRepository;

	@Autowired
	private HoidapService hoidapService;

	@GetMapping({ "/admin/question/{status}", "/admin/question" })
	public String question(Model model, @PathVariable(required = false) String status, Integer idSP) {

		System.out.println("idsp=" + idSP);
		List<HoiDap> listHoiDap = null;

//		status = "all" : status;

		switch (status) {
		case "replied":
			listHoiDap = hoiDapRepository.findAllReplied();
			break;
		case "noreply":
			listHoiDap = hoiDapRepository.findAllNoReply();
			break;
		default:
			if(idSP==null) {
				listHoiDap = hoiDapRepository.findAll(Sort.by("createAt").descending());
				
			}else {
				listHoiDap = hoiDapRepository.findByIdSanPham(idSP,Sort.by("createAt").descending());
			}
			break;
		}
		model.addAttribute("listHoiDap", listHoiDap);

		return "admin/question";
	}

	@PostMapping("/admin/rep-question")
	public String replyQuestion(Integer idQuestion, String question) {

		hoidapService.reply(idQuestion, question);

		return "redirect:/admin/question/replied";
	}
	
	@PostMapping("/admin/del-question")
	public String deleteQuestion(Integer idHoiDap) {
		if(idHoiDap!=null)
			hoidapService.delete(idHoiDap);
		return "redirect:/admin/question/replied";
	}
}
