package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Produto;

@Named
public class ProdutoDao implements IProtudoDao{
	@PersistenceContext
	private EntityManager em;

	@Override
	public void salvar(Produto produto) {
		if(produto.getId() == null) em.persist(produto);
		else em.merge(produto);
	}

	@Override
	public void apagar(Integer idProduto) {
		Produto produto = buscarPorId(idProduto);
		em.remove(em.merge(produto));
		
	}

	@Override
	public List<Produto> listar() {
		return em.createQuery("from Produto", Produto.class).getResultList();
	}

	@Override
	public Produto buscarPorId(Integer idProduto) {
		return em.find(Produto.class, idProduto);
	}

}
