package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;

public interface IVendaServico {
	public abstract void salvar(Venda v);

	public abstract List<Venda> listar();

	public Venda buscarPorId(Integer id);
	
	public void apagar(Venda Venda);
	
	public abstract List<Venda> listaCobrancas();
	
	public double montanteMes(List<Venda> cobrancas);
}
