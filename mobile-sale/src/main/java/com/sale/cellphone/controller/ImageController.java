package com.sale.cellphone.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sale.cellphone.service.ImageService;

@Controller
public class ImageController {
	
	@Autowired
	private ImageService imageService;
	
	@GetMapping(value="/assets/phone-image/{path}", produces = {MediaType.IMAGE_GIF_VALUE,MediaType.IMAGE_JPEG_VALUE,MediaType.IMAGE_PNG_VALUE})
	@ResponseBody
	public byte[] getImage(@PathVariable("path") String imageName, HttpServletResponse response) {
		
		try {
			return imageService.readFileFrom(ImageService.PHONE_PATH, imageName);
		} catch (IOException e) {
			e.printStackTrace();
			response.setStatus(404);
		}
		return null;
	}
}
