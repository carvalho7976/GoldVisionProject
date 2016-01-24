package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Produto;

public interface IProdutoServico {
	public abstract void salvarProduto(Produto produto);

	public void deletarProduto(Integer idProduto);

	public Produto procurarPorId(Integer idProduto);

	public abstract List<Produto> listarProdutos();
}
