package com.test.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.Login;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public Login login(Login login) {
				
		/*
		 CREATE OR REPLACE VIEW login_access_view
		 AS
		 SELECT name_, ssn, login_id, phone, pw, l.profile_img, initial_reg_date, l.access_id, access_name FROM login l, access_level al WHERE l.access_id = al.access_id;
		*/
		
		return this.sqlSession.selectOne("com.test.mapper.LoginMapper.login", login);
	}
	
	@Override
	public int pwchange(Map<String,String> map) {
		//String login_id, String current_pw, String new_pw
		return this.sqlSession.update("com.test.mapper.LoginMapper.pwchange", map);
	}
	
	
}
