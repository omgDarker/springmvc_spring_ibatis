package com.ninemax.file.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Darker
 *
 */
@Controller
@RequestMapping("/file")
public class FileController {
	
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest req,HttpServletResponse rep){
		
		return "file/pdf";
	}
}
