package com.test.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.Login;
import com.test.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO loginDAO;
	
	@Override
	public Login login(Login login) {
		
		return this.loginDAO.login(login);
	}

	@Override
	public int pwchange(Map<String, String> map) {
		
		return this.loginDAO.pwchange(map);
	}

}
