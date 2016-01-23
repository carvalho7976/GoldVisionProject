package br.ufc.quixada.arquitetura.gvp.controle;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.modelo.Produto;
import br.ufc.quixada.arquitetura.gvp.servico.MarcaServico;
import br.ufc.quixada.arquitetura.gvp.servico.ProdutoServico;



@Controller
@RequestMapping("produto")
public class ProdutoControle {
	@Inject
	private MarcaServico marcaServico;
	@Inject
	private ProdutoServico produtoServico;
	
		
	@RequestMapping(value="/listar", method = RequestMethod.GET)
	public ModelAndView listaProdutos(){
		
		ModelAndView model = new ModelAndView("produto/listar");
		
		return model;
	}
	
	@RequestMapping(value="/adicionar", method = RequestMethod.GET)
	public ModelAndView adicionarProduto(Model modelAtribute){
		modelAtribute.addAttribute("produto", new Produto());
		modelAtribute.addAttribute("listaMarcas", marcaServico.find(Marca.class));
		ModelAndView model = new ModelAndView("produto/adicionar");

		return model;
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionarProduto(String codigo, Integer quantidade, Double valorCompra, Double valorVenda, Integer marca, final RedirectAttributes redirectAttributes){
		
		Produto p = new Produto();
		p.setCodigo(codigo);
		p.setQuantidade(quantidade);
		p.setValorCompra(valorCompra);
		p.setValorVenda(valorVenda);
		p.setMarca(marcaServico.procurarPorId(marca));
		
		produtoServico.salvarProduto(p);
		
		return "redirect:/produto/listar";
	}
	
	
}
