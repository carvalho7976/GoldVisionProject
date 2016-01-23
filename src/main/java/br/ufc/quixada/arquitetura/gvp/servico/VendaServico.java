package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.persistencia.IVendaDao;

@Named
public class VendaServico implements IVendaServico {

	@Inject
	private IVendaDao VendaRepository;

	public VendaServico() {
	}


	@Override
	@Transactional
	public void salva(Venda v) {
		VendaRepository.salva(v);
	}

	@Override
	@Transactional
	public List<Venda> procuraTodos() {
		List<Venda> l = VendaRepository.procuraTodos();
		return l;
	}

	@Override
	@Transactional
	public Venda procuraPorId(Long id) {
		Venda g = VendaRepository.procuraPorId(id);
		return g;
	}

	@Override
	@Transactional
	public void remove(Venda g) {
		VendaRepository.remove(g);
	}
}
