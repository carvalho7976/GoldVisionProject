package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.Date;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.servico.VendaServico;

@Named
@RequestMapping("venda")
public class VendaControle {

	@Inject
	private VendaServico vs;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model mod) {

		ModelAndView model = new ModelAndView("venda/venda");
		model.addObject("vendas", vs.findAll());
		
		// necessario para o formulario savePessoa
		mod.addAttribute("Venda", new Venda());
		
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String criarVenda(	

			@RequestParam(value = "valorVenda", required = true) float valorVenda,
			@RequestParam(value = "formaPagamento", required = true) String formaPagamento,
			@RequestParam(value = "diaVencimento", required = true) Integer diaVencimento,
			@RequestParam(value = "numParcelas", required = true) Integer numParcelas,
			@RequestParam(value = "numParcelasPagas", required = true) Integer numParcelasPagas,
			@RequestParam(value = "ultimoPagamento", required = true) Integer ultimoPagamento) {

		Venda venda = new Venda();
		venda.setDataVenda(new Date(System.currentTimeMillis()));

		venda.setValorVenda(valorVenda);
		venda.setFormaPagamento(formaPagamento);
		venda.setDiaVencimento(diaVencimento);
		venda.setNumParcelas(numParcelas);
		venda.setNumParcelasPagas(numParcelasPagas);
		venda.setUltimoPagamento(ultimoPagamento);

		vs.save(venda);

		return "redirect:/venda/";
	}


}
