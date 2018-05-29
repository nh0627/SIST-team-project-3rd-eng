package com.test.persistence;

import java.util.Map;

import com.test.domain.Login;

public interface LoginDAO {

	public Login login(Login login);

	public int pwchange(Map<String,String> map);
}
