package com.ninemax.birthday.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ninemax.birthday.model.Birthday;
import com.ninemax.birthday.service.BirthdayService;

@Repository
public class BirthdayServiceImpl implements BirthdayService {

	@Resource
	private SqlMapClient sqlMapClient;

	@SuppressWarnings("unchecked")
	@Override
	public List<Birthday> getAll() {
		
		List<Birthday> list = null;
		
		try {
			
			list = sqlMapClient.queryForList("selBirthday");
			return list;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return list;

	}

}
