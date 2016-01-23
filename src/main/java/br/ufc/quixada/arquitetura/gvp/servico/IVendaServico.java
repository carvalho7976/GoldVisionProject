package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaServico {
	public abstract void save(Venda v);

	public abstract List<Venda> findAll();

	public Venda findById(Long id);
	
	public void remove(Venda Venda);
}
