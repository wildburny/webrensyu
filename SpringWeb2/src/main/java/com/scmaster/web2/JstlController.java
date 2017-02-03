package com.scmaster.web2;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class JstlController {
	
	public String jstl1(Model model){
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
		
		return "";
	}
}
