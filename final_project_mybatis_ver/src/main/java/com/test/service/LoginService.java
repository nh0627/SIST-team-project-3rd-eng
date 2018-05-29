package com.test.service;

import java.util.Map;

import com.test.domain.Login;

public interface LoginService {
	public Login login(Login login);

	public int pwchange(Map<String,String> map);
}
