package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;

public interface IPessoaServico {

	public abstract void save(Pessoa p);

	public abstract List<Pessoa> findAll();

	public Pessoa findById(Long id);
	
	public void remove(Pessoa Pessoa);

}