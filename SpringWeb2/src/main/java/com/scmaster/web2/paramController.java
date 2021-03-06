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

	@RequestMapping(value = "param2", method = RequestMethod.GET)
	public String param2() {
		return "param2";
	}

	@RequestMapping(value = "param2", method = RequestMethod.POST)
	public String param2(String name, String phone, String address) {
		logger.info("name : {}", name);
		logger.info("phone : {}", phone);
		logger.info("address : {}", address);
		return "redirect:/";
	}

	@RequestMapping(value = "param3", method = RequestMethod.GET)
	public String param3() {
		return "param3";
	}

	@RequestMapping(value = "param3", method = RequestMethod.POST)
	public String param3(Person person, String etc) {
						// @requestParam 이라는 파라메터가 사실 앞에 붙어 있어야함.
		logger.info("person : {}", person);
		logger.info("etc : {}", etc);
		return "redirect:/";
	}
}
