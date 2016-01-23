package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaServico {
	public abstract void salvar(Venda v);

	public abstract List<Venda> listar();

	public Venda buscarPorId(Long id);
	
	public void apagar(Venda Venda);
}
