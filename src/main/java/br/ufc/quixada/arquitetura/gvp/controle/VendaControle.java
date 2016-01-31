package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;
import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.servico.VendaServico;

@Named
@RequestMapping("venda")
public class VendaControle {

	@Inject
	private VendaServico vs;
	
	
	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public ModelAndView home(Model mod) {

		ModelAndView model = new ModelAndView("venda/venda");
		model.addObject("vendas", vs.listar());
		
		// necessario para o formulario saveVenda
		mod.addAttribute("Venda", new Venda());
		
		return model;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {
		
		List<Venda> vendas = vs.listar();
		modelAtribute.addAttribute("vendas",vendas);
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
		ModelAndView model = new ModelAndView("venda/editar");
		return model;
	}
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.POST)
	public ModelAndView editarSalvar(@ModelAttribute("venda") Venda venda,@PathVariable("id") Integer id) {
		venda.setId(id);
		venda.setDataVenda(vs.buscarPorId(id).getDataVenda());
		vs.salvar(venda);
		String vendaEnd = "/venda/";
		return new ModelAndView("redirect:" +vendaEnd );
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String criarVenda(	

			@RequestParam(value = "valorVenda", required = true) float valorVenda,
			@RequestParam(value = "formaPagamento", required = true) String formaPagamento,
			@RequestParam(value = "diaVencimento", required = true) Integer diaVencimento,
			@RequestParam(value = "numParcelas", required = true) Integer numParcelas,
			@RequestParam(value = "numParcelasPagas", required = true) Integer numParcelasPagas) {

		Venda venda = new Venda();
		venda.setDataVenda(new Date(System.currentTimeMillis()));

		venda.setValorVenda(valorVenda);
		venda.setFormaPagamento(formaPagamento);
		venda.setDiaVencimento(diaVencimento);
		venda.setNumParcelas(numParcelas);
		venda.setNumParcelasPagas(numParcelasPagas);
		venda.setUltimoPagamento(venda.getDataVenda());

		vs.salvar(venda);

		return "redirect:/venda/";
	}
	
	@RequestMapping(value = "/cobrancas/", method = RequestMethod.GET)
	public ModelAndView cobrancas(Model modelAtribute) {
		
		modelAtribute.addAttribute("cobrancas", vs.listaCobrancas());
		ModelAndView model = new ModelAndView("venda/cobrancas");
		return model;
	}
	
	@RequestMapping(value = "/pagamento/{id}/", method = RequestMethod.GET)
	public ModelAndView pagamento(Model modelAtribute, @PathVariable("id") Integer id) {
		modelAtribute.addAttribute("venda", vs.buscarPorId(id));
		modelAtribute.addAttribute("numeroParcelasPagamento", vs.buscarPorId(id).getNumParcelas() - vs.buscarPorId(id).getNumParcelasPagas());
		ModelAndView model = new ModelAndView("venda/pagamento");
		return model;
	}
	

}
