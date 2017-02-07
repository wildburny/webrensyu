package com.scmaster.web2;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SessionController {

    @RequestMapping(value = "sessionTest", method = RequestMethod.GET)
    public String sessionTest(HttpSession session) {
        session.setAttribute("value1", "1번에서 저장한 세션값");
        return "redirect:/";
    }

    @RequestMapping(value = "sessionTest2", method = RequestMethod.GET)
    public String sessionTest2(HttpSession session) {
        session.removeAttribute("value1");
        // session.invalidate(); //세션의 모든 정보를 지움
        return "redirect:/";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String id, String pw, HttpSession session) {
        session.setAttribute("id", id);
        return "redirect:/";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("id");
        return "redirect:/";
    }
}
