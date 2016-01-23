package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.transaction.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Produto;
import br.ufc.quixada.arquitetura.gvp.persistencia.IProtudoDao;


@Named
public class ProdutoServico implements IProdutoServico{
	@Inject
	private IProtudoDao produtoDao;
	
	@Override
	@Transactional
	public Produto procurarPorId(Integer idProduto) {
		return produtoDao.buscarPorId(idProduto);
	}

	@Override
	@Transactional
	public List<Produto> listarMarcas() {
		return produtoDao.listar();
	}

	@Override
	@Transactional
	public void salvarProduto(Produto produto) {
		produtoDao.salvar(produto);
		
	}

	@Override
	@Transactional
	public void deletarProduto(Integer idProduto) {
		produtoDao.apagar(idProduto);
	}

}
