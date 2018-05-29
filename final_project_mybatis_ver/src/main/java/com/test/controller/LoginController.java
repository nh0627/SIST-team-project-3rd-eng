package com.test.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.Login;
import com.test.service.LoginService;

@Controller
public class LoginController {
	
	@Inject
	LoginService loginService;
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		session.invalidate();
		return "/login/page-login";
	}	
	
	@RequestMapping("/login")
	public String login(Login login, HttpSession session) {

		//id, pw를 이용한 로그인 액션 처리
		//->성공한 경우 세션 객체 생성
		Login l = null;
		String uri = "redirect:/main?loginFail=1";

		l = this.loginService.login(login);

		if(l!=null) {
			
			if (l.getAccess_id().equals("LV001")) {
				session.setAttribute("managerLoginInfo", l);
				uri = "redirect:/manager/main";
			} else if (l.getAccess_id().equals("LV002")) {
				session.setAttribute("instructorLoginInfo", l);
				uri = "redirect:/instructor/main";
			} else if (l.getAccess_id().equals("LV003")) {
				session.setAttribute("studentLoginInfo", l);
				uri = "redirect:/student/main";
			}
			
		}	
		
		return uri;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping("/pwchange")
	public String pwchange(HttpSession session, RedirectAttributes rttr, String login_id, String current_pw, String new_pw) {
		Map<String, String> map = new HashedMap<>();
		map.put("login_id", login_id);
		map.put("current_pw", current_pw);
		map.put("new_pw", new_pw);
		
		int result = this.loginService.pwchange(map);
		rttr.addFlashAttribute("success", result);
		
		String uri = "";
		if(session.getAttribute("managerLoginInfo")!=null) {
			uri="redirect:/manager/main";
		} else if(session.getAttribute("instructorLoginInfo")!=null) {
			uri = "redirect:/instructor/main";
		} else if(session.getAttribute("studentLoginInfo")!=null) {
			uri = "redirect:/student/main";
		}
		return uri;
	}
	
}