package com.ninemax.birthday.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ninemax.birthday.model.Birthday;

@Service
public interface BirthdayService {
	
	public List<Birthday> getAll();
}
