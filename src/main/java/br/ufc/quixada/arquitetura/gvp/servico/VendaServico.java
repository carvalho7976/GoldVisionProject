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
	public void salvar(Venda v) {
		VendaRepository.salvar(v);
	}

	@Override
	@Transactional
	public List<Venda> listar() {
		List<Venda> l = VendaRepository.listar();
		return l;
	}

	@Override
	@Transactional
	public Venda buscarPorId(Integer id) {
		Venda g = VendaRepository.buscarPorId(id);
		return g;
	}

	@Override
	@Transactional
	public void apagar(Venda g) {
		VendaRepository.apagar(g);
	}
}
