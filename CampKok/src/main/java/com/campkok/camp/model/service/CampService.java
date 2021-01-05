package com.campkok.camp.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.camp.model.dao.CampDao;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

}
