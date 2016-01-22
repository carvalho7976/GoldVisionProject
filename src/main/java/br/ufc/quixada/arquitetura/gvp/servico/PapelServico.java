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
	public void save(Papel c) {
		papelRepository.save(c);
	}

	@Override
	@Transactional
	public List<Papel> findAll() {
		List<Papel> l = papelRepository.findAll();
		return l;
	}

	@Override
	@Transactional
	public void remove(Papel c) {
		papelRepository.remove(c);
	}

	@Override
	public Papel findByName(String name) {
		return papelRepository.findByName(name);
	}

}
