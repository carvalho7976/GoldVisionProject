package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Produto;

public interface IProtudoDao {
	public abstract void salvar(Produto produto);
	public void apagar(Integer idProduto);
	public abstract  List<Produto> listar();
	public Produto buscarPorId(Integer idProduto);
}
