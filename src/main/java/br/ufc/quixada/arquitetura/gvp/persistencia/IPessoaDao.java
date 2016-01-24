package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;

public interface IPessoaDao {

	public abstract void save(Pessoa g);

	public abstract List<Pessoa> findAll();

	public Pessoa findById(Long id);
	
	public void remove(Pessoa Pessoa);
	
}