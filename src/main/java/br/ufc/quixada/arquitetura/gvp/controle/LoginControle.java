package br.ufc.quixada.arquitetura.gvp.controle;

import java.security.Principal;

import javax.inject.Named;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Named
@Controller
public class LoginControle {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		ModelAndView model = new ModelAndView("home/home");

		return model;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuário e/ou senha inválidos!");
		}

		if (logout != null) {
			model.addObject("msg", "Logado com sucesso!");
		}
		model.setViewName("login");

		return model;

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session) {
		session.invalidate();

		return "redirect:/login";

	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String acessoNegado(ModelMap model, Principal user) {
		if (user != null) {
			model.addAttribute("message", "Olá usuário " + user.getName() 
			+ ", você não tem permissão para acessar essa página!");
		} else {
			model.addAttribute("message", 
			"Você não tem permissão para acessar essa página!");
		}
		return "403";
	}
}