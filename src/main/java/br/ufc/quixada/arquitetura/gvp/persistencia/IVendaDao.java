package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;
import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;
import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaDao {

	public abstract void save(Venda v);

	public abstract List<Venda> findAll();
	
	public Venda findById(Long id);
	
	public void remove(Venda venda);
	
}