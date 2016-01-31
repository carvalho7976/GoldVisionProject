package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaDao {

	public abstract void salvar(Venda v);

	public abstract List<Venda> listar();
	
	public Venda buscarPorId(Integer id);
	
	public void apagar(Venda venda);
	
}