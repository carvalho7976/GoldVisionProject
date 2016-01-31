package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;
import br.ufc.quixada.arquitetura.gvp.persistencia.IPessoaDao;

@Named
public class PessoaServico implements IPessoaServico {

	@Inject
	private IPessoaDao PessoaRepository;

	public PessoaServico() {
	}

	@Override
	@Transactional
	public void save(Pessoa p) {
		PessoaRepository.save(p);
	}

	@Override
	@Transactional
	public List<Pessoa> findAll() {
		List<Pessoa> l = PessoaRepository.findAll();
		return l;
	}

	@Override
	@Transactional
	public Pessoa findById(Long id) {
		Pessoa g = PessoaRepository.findById(id);
		return g;
	}

	@Override
	@Transactional
	public void remove(Pessoa g) {
		PessoaRepository.remove(g);
	}

}
