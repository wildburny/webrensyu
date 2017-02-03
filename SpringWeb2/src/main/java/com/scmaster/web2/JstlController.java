package com.scmaster.web2;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JstlController {

	@RequestMapping(value = "jstl1", method = RequestMethod.GET)
	public String jstl1(Model model) {
		int number = 1;
		String str = "문자열";

		ArrayList<String> strlist = new ArrayList<>();
		strlist.add("가나다");
		strlist.add("라마바");
		strlist.add("사아자");

		String phone = "010-1234-1234";
		String data = "<marquee>문자열</marquee>";

		model.addAttribute("number", number);
		model.addAttribute("str", str);
		model.addAttribute("strlist", strlist);
		model.addAttribute("phone", phone);
		model.addAttribute("data", data);

		Date today = new Date();
		double num1 = 12345.6789;
		double num2 = 99.9;
		double num3 = 0.1;

		model.addAttribute("date", today);
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("num3", num3);
		
		String str2 = "abc ABC 가나다";
		model.addAttribute("str2", str2);
		
		return "jstl1";
	}
}
