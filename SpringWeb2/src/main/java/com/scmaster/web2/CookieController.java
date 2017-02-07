package com.scmaster.web2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CookieController {

	@RequestMapping(value = "cookie1", method = RequestMethod.GET)
	public String cookie1(HttpServletResponse response) {
		// 쿠키 생성
		Cookie cookie1 = new Cookie("id", "abc");
		Cookie cookie2 = new Cookie("num", "123");
		// 클라이언트로 쿠키 저장
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		return "redirect:/";
	}

	@RequestMapping(value = "cookie2", method = RequestMethod.GET)
	public String cookie2(HttpServletResponse response) {
		// 쿠키 생성
		Cookie cookie1 = new Cookie("id", null);
		cookie1.setMaxAge(0); // 쿠키가 살아있는 시간을 0으로
		Cookie cookie2 = new Cookie("num", null);
		cookie2.setMaxAge(0);
		// 클라이언트로 쿠키 저장
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		return "redirect:/";
	}

	@RequestMapping(value = "cookie3", method = RequestMethod.GET)
	public String cookie3(HttpServletRequest request) {
		Cookie cks[] = request.getCookies();
		for (Cookie c : cks) {
			System.out.println("이름 : " + c.getName() + " 값 : " + c.getValue());
		}
		return "redirect:/";
	}

	@RequestMapping(value = "cookie4", method = RequestMethod.GET)
	public String cookie4(@CookieValue(value = "id", defaultValue = "none") String id,
			@CookieValue(value = "num", defaultValue = "0") int num) {
		System.out.println("id = " + id);
		System.out.println("num = " + num);
		return "redirect:/";
	}
}
