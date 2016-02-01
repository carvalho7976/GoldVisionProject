package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		modelAtribute.addAttribute("produtos", ps.listarProdutos());
		ModelAndView model = new ModelAndView("venda/editar");
		return model;
	}
	
	
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.POST)
	public ModelAndView editarSalvar(@ModelAttribute("venda") Venda venda, @PathVariable("id") Integer id) {
		venda.setId(id);
		venda.setDataVenda(vs.buscarPorId(id).getDataVenda());
		vs.salvar(venda);
		String vendaEnd = "/venda/";
		return new ModelAndView("redirect:" + vendaEnd);
	}
	@RequestMapping(value = "/editar2/{id}", method = RequestMethod.POST)
	public ModelAndView adicionar2POST(Integer cliente, Integer produto,Double valorVenda, String formaPagamento, Integer diaVencimento,
			Integer numParcelas, Integer numParcelasPagas,@PathVariable("id") Integer id, Date ultimoPagamento, final RedirectAttributes redirectAttributes) {
		
		
		Venda venda = vs.buscarPorId(id);
		venda.setDataVenda(new Date(System.currentTimeMillis()));
		
		venda.setProduto(ps.procurarPorId(produto));
		venda.setCliente(cs.procurarPorId(cliente));
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
			Integer numParcelas, Integer numParcelasPagas, Integer produto, final RedirectAttributes redirectAttributes) {
		
		Venda venda = new Venda();
		venda.setDataVenda(new Date(System.currentTimeMillis()));
		
		venda.setCliente(cs.procurarPorId(cliente));
		venda.setValorVenda(valorVenda);
		venda.setFormaPagamento(formaPagamento);
		venda.setDiaVencimento(diaVencimento);
		venda.setNumParcelas(numParcelas);
		venda.setNumParcelasPagas(numParcelasPagas);
		venda.setProduto(ps.procurarPorId(produto));
		venda.setUltimoPagamento(venda.getDataVenda());
		
		vs.salvar(venda);
		ModelAndView model = new ModelAndView("redirect:/venda/");
		return model;
	}
	@RequestMapping(value = "/cobrancas/", method = RequestMethod.GET)
	public ModelAndView cobrancas(Model modelAtribute) {

		modelAtribute.addAttribute("cobrancas", vs.listaCobrancas());
		modelAtribute.addAttribute("montante", vs.montanteMes(vs.listaCobrancas()));
		ModelAndView model = new ModelAndView("venda/cobrancas");
		return model;
	}
	@RequestMapping(value = "/pagamento/{id}/", method = RequestMethod.GET)
	public ModelAndView pagamento(Model modelAtribute, @PathVariable("id") Integer id) {
		modelAtribute.addAttribute("venda", vs.buscarPorId(id));
		modelAtribute.addAttribute("numeroParcelasPagamento",
				vs.buscarPorId(id).getNumParcelas() - vs.buscarPorId(id).getNumParcelasPagas());
		ModelAndView model = new ModelAndView("venda/pagamento");
		return model;
	}

	@RequestMapping(value = "/pagamento/{id}/", method = RequestMethod.POST)
	public ModelAndView pagamento(@ModelAttribute("venda") Venda venda, @PathVariable("id") Integer id) {
		Venda minhaVenda = vs.buscarPorId(id);
		minhaVenda.setNumParcelasPagas(minhaVenda.getNumParcelasPagas() + venda.getNumParcelas());
		minhaVenda.setUltimoPagamento(new Date());
		vs.salvar(minhaVenda);
		return new ModelAndView("redirect:/venda/");
	}

	@RequestMapping(value = "/atrasado/", method = RequestMethod.GET)
	public ModelAndView vencimentos(Model modelAtribute) {

		modelAtribute.addAttribute("cobrancas", vs.listaCobrancasAtrasadas());
		modelAtribute.addAttribute("montante", vs.montanteMes(vs.listaCobrancasAtrasadas()));
		ModelAndView model = new ModelAndView("venda/atrasado");
		return model;
	}
	
	@RequestMapping(value = "/detalhes/{id}/", method = RequestMethod.GET)
	public ModelAndView detalhes(Model modelAtribute, @PathVariable("id") Integer id) {

		modelAtribute.addAttribute("venda", vs.buscarPorId(id));
		ModelAndView model = new ModelAndView("venda/detalhes");
		return model;
	}
	
}