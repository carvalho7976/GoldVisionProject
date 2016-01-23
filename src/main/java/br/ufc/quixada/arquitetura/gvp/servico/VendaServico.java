package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;
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
	public void save(Venda v) {
		VendaRepository.save(v);
	}

	@Override
	@Transactional
	public List<Venda> findAll() {
		List<Venda> l = VendaRepository.findAll();
		return l;
	}

	@Override
	@Transactional
	public Venda findById(Long id) {
		Venda g = VendaRepository.findById(id);
		return g;
	}

	@Override
	@Transactional
	public void remove(Venda g) {
		VendaRepository.remove(g);
	}
}
