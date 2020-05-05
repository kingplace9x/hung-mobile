package com.admin.mobile.sale.validator;

import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.web.multipart.MultipartFile;

public class ImageValidator implements ConstraintValidator<Image, MultipartFile>{

	@Override
	public boolean isValid(MultipartFile file, ConstraintValidatorContext context) {
		if(file==null || file.isEmpty())
			return true;
		try (InputStream input = file.getInputStream()) {
		    try {
		        ImageIO.read(input).toString();
		        // It's an image (only BMP, GIF, JPG and PNG are recognized).
		        return true;
		    } catch (Exception e) {
		    	// It's not an image.
		    	return false;
		    }
		} catch (IOException e1) {
			e1.printStackTrace();
			return false;
		}
	}

}
