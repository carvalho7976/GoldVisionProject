package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;
import br.ufc.quixada.arquitetura.gvp.persistencia.IPapelDao;

@Named
public class PapelServico implements IPapelServico {

	@Inject
	private IPapelDao papelRepository;

	public PapelServico() {
	}

	@Override
	@Transactional
	public void salvar(Papel c) {
		papelRepository.salvar(c);
	}

	@Override
	@Transactional
	public List<Papel> listar() {
		List<Papel> l = papelRepository.listar();
		return l;
	}

	@Override
	@Transactional
	public void apagar(Papel c) {
		papelRepository.apagar(c);
	}

	@Override
	public Papel buscarPorNome(String name) {
		return papelRepository.buscarPorNome(name);
	}

}
