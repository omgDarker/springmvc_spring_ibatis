package com.ninemax.birthday.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ninemax.birthday.model.Birthday;
import com.ninemax.birthday.service.BirthdayService;

/**
 * 生日Controller
 * 
 * @author Darker
 * 
 */
@Controller
@RequestMapping("/birthday")
public class BirthdayController {

	@Resource
	BirthdayService birthdayService;

	@RequestMapping("/birthday")
	public String getAll(HttpServletRequest req) {

		List<Birthday> list = birthdayService.getAll();

		int count = list.size();

		req.setAttribute("list", list);
		req.setAttribute("sumPage", count / 4 == 0 ? 1 : (count / 4) + 1);
		req.setAttribute("sumTotal", count);

		return "birthday/birthday";
	}
}
