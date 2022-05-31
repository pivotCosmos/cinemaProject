package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		System.out.println("test");
		return "cinema/main";
	}
	
	@RequestMapping("/ticketing")
	public String ticketing() {
		return "cinema/ticketing";
	}
	
}
