package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.arquitetura.gvp.modelo.Produto;
import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.servico.ClienteServico;
import br.ufc.quixada.arquitetura.gvp.servico.ProdutoServico;
import br.ufc.quixada.arquitetura.gvp.servico.VendaServico;


@Named
@RequestMapping("venda")
public class VendaControle {

	@Inject
	private VendaServico vs;
	
	@Inject
	private ClienteServico cs;
	
	@Inject
	private ProdutoServico ps;
	
	
	
	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public ModelAndView home(Model modelAtribute) {

		modelAtribute.addAttribute("venda", new Venda());
		modelAtribute.addAttribute("clientes", cs.listarClientes());
		List<Produto> produtos = ps.listarProdutos();
		modelAtribute.addAttribute("produtoLista", produtos);
		ModelAndView model = new ModelAndView("venda/adicionar");

		return model;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {
		
		List<Venda> vendas = vs.listar();
		modelAtribute.addAttribute("vendas",vendas);
		modelAtribute.addAttribute("clientes", cs.listarClientes());
		ModelAndView model = new ModelAndView("venda/listar");
		return model;
		
	}
	
	@RequestMapping(value = "/apagar/{id}", method = RequestMethod.GET)
	public ModelAndView apagar(@PathVariable("id") Integer id) {
		vs.apagar(vs.buscarPorId(id));
		
		String vendaEnd = "/venda/";
		return new ModelAndView("redirect:" +vendaEnd );
	}
	
	
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.GET)
	public ModelAndView editar(Model modelAtribute,@PathVariable("id") Integer id) {
		
		modelAtribute.addAttribute("venda", vs.buscarPorId(id));
		modelAtribute.addAttribute("clientes", cs.listarClientes());
		ModelAndView model = new ModelAndView("venda/editar");
		return model;
	}
	
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.POST)
	public ModelAndView editarSalvar(@PathVariable("id") Integer id, Integer cliente, Double valorVenda, String formaPagamento, Integer diaVencimento,
			Integer numParcelas, Integer numParcelasPagas, Integer ultimoPagamento,
			final RedirectAttributes redirectAttributes) {
		
		Venda venda = vs.buscarPorId(id);
		
		venda.setCliente(cs.procurarPorId(cliente));
		venda.setDataVenda(vs.buscarPorId(id).getDataVenda());
		venda.setValorVenda(valorVenda);
		venda.setFormaPagamento(formaPagamento);
		venda.setDiaVencimento(diaVencimento);
		venda.setNumParcelas(numParcelas);
		venda.setNumParcelasPagas(numParcelasPagas);
		venda.setUltimoPagamento(ultimoPagamento);
		
		vs.salvar(venda);

		ModelAndView model = new ModelAndView("redirect:/venda/");
		return model;
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public ModelAndView adicionarPOST(Integer cliente, Double valorVenda, String formaPagamento, Integer diaVencimento,
			Integer numParcelas, Integer numParcelasPagas, Integer ultimoPagamento, Integer produtos, final RedirectAttributes redirectAttributes) {
		
		
		System.out.println("produto " + produtos);
		
		List<Produto> produtosList = new ArrayList<Produto>();
		produtosList.add(ps.procurarPorId(produtos));
		
		Venda venda = new Venda();
		venda.setDataVenda(new Date(System.currentTimeMillis()));
		
		venda.setCliente(cs.procurarPorId(cliente));
		venda.setValorVenda(valorVenda);
		venda.setFormaPagamento(formaPagamento);
		venda.setDiaVencimento(diaVencimento);
		venda.setNumParcelas(numParcelas);
		venda.setNumParcelasPagas(numParcelasPagas);
		venda.setUltimoPagamento(ultimoPagamento);
		venda.setProdutos(produtosList);
		
		vs.salvar(venda);
		ModelAndView model = new ModelAndView("redirect:/venda/");
		return model;
	}
	
	
	
	


}
