package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaServico {
	public abstract void salva(Venda v);

	public abstract List<Venda> procuraTodos();

	public Venda procuraPorId(Long id);
	
	public void remove(Venda Venda);
}
