package com.scmaster.web2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class paramController {

	private static final Logger logger = LoggerFactory.getLogger(paramController.class);

	@RequestMapping(value = "param1", method = RequestMethod.GET)
	public String param1(String str, int num) {
		logger.info("전달된 문자열 : {}, 숫자 : {})", str, num);
		
		return "redirect:/";
	}

}
