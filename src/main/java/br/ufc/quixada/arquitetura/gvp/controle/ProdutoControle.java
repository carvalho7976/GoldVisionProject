package br.ufc.quixada.arquitetura.gvp.controle;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("produto")
public class ProdutoControle {
	
	@RequestMapping(value="/listar", method = RequestMethod.GET)
	public ModelAndView listaProdutos(){
		
		ModelAndView model = new ModelAndView("produto/listarProdutos");
		
		return model;
	}
	
	@RequestMapping(value="/adicionar", method = RequestMethod.GET)
	public ModelAndView adicionarProdutoGET(){
		ModelAndView model = new ModelAndView("produto/addProduto");

		return model;
	}
	
	@RequestMapping(value="/adicionar", method = RequestMethod.POST)
	public ModelAndView adicionarProdutoPOST(){
		ModelAndView model = new ModelAndView("produto/addProduto");

		return model;
	}

}
