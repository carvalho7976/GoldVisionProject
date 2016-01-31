package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;
import br.ufc.quixada.arquitetura.gvp.modelo.Produto;
import br.ufc.quixada.arquitetura.gvp.servico.MarcaServico;
import br.ufc.quixada.arquitetura.gvp.servico.ModeloServico;
import br.ufc.quixada.arquitetura.gvp.servico.ProdutoServico;

@Controller
@RequestMapping("produto")
public class ProdutoControle {
	@Inject
	private MarcaServico marcaServico;
	@Inject
	private ProdutoServico produtoServico;
	
	@Inject
	private ModeloServico ms;

	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public ModelAndView adicionarProduto(Model modelAtribute) {
		modelAtribute.addAttribute("produto", new Produto());
		modelAtribute.addAttribute("listaMarcas", marcaServico.find(Marca.class));
		ModelAndView model = new ModelAndView("produto/adicionar");
		return model;
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionarProduto(String codigo, Integer quantidade, Double valorCompra, Double valorVenda,
			Integer marca, Integer modelo, final RedirectAttributes redirectAttributes) {

		Produto p = new Produto();
		p.setCodigo(codigo);
		p.setQuantidade(quantidade);
		p.setValorCompra(valorCompra);
		p.setValorVenda(valorVenda);
		p.setMarca(marcaServico.procurarPorId(marca));
		System.out.println("modelo " + modelo);
		p.setModelo(ms.procurarPorId(modelo));

		produtoServico.salvarProduto(p);
		return "redirect:/produto/listar";
	}

	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {

		modelAtribute.addAttribute("listaProdutos", produtoServico.listarProdutos());
		ModelAndView model = new ModelAndView("produto/listar");
		return model;
	}

	@RequestMapping(value = "/{id}/detalhes", method = RequestMethod.GET)
	public ModelAndView detalhes(@PathVariable("id") Integer id, Model modelAtribute) {

		modelAtribute.addAttribute("produto", produtoServico.procurarPorId(id));
		
		ModelAndView model = new ModelAndView("produto/detalhes");
		return model;
	}
	
	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public ModelAndView excluir(@PathVariable("id") Integer id) {
		if(produtoServico.procurarPorId(id)!= null){
			produtoServico.deletarProduto(id);
		}
		
		ModelAndView model = new ModelAndView("redirect:/produto/listar");
		return model;
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public ModelAndView editarGET(@PathVariable("id") Integer id, Model modelAtribute) {
		modelAtribute.addAttribute("produto", produtoServico.procurarPorId(id));
		modelAtribute.addAttribute("listaMarcas", marcaServico.find(Marca.class));
		
		ModelAndView model = new ModelAndView("/produto/editar");	
		return model;
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public ModelAndView editarPOST(@PathVariable("id") Integer id, String codigo, Integer quantidade, Double valorCompra, Double valorVenda,
			Integer marca, final RedirectAttributes redirectAttributes) {
		Produto meuProduto = produtoServico.procurarPorId(id);
		meuProduto.setCodigo(codigo);
		meuProduto.setQuantidade(quantidade);
		meuProduto.setValorCompra(valorCompra);
		meuProduto.setValorVenda(valorVenda);
		meuProduto.setMarca(marcaServico.procurarPorId(marca));
		produtoServico.salvarProduto(meuProduto);
		
		ModelAndView model = new ModelAndView("redirect:/produto/listar");
		return model;
	}
	@RequestMapping(value = "/modelos", method = RequestMethod.GET)
	public @ResponseBody
	List<Modelo> modelosPorMarca(
			@RequestParam(value = "marcaId", required = true) String marca) {
		
		return marcaServico.procurarPorId(Integer.valueOf(marca)).getModelos();
	}

	@RequestMapping(value = "/marcas", method = RequestMethod.GET)
	public @ResponseBody
	List<String> listaMarcas() {
		List<Marca> lm = marcaServico.listarMarcas();	
		List<String> ls = new ArrayList<String>();
		for (Marca m : lm) {
			ls.add(m.getNomeMarca());
			
		}
		
		return ls;
	}
	
	@RequestMapping("/getModeloPorMarca")
	@ResponseBody
	public List<Modelo> printHello(@RequestParam int marcaId) {
	      
			
			List<Modelo> modelos = ms.buscarPorMarca(Integer.valueOf(marcaId));
			
			for (Modelo modelo : modelos) {
				System.out.println("modelo " + modelo.getNomeModelo());
			}
			
			
	      return modelos;
	   }
}
