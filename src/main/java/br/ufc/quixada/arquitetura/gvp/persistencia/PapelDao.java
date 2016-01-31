package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;

@Named
public class PapelDao implements
		IPapelDao {

	@PersistenceContext
	private EntityManager em;

	public void salvar(Papel c) {
		if (c.getId() == null) {
			em.persist(c);
		} else {
			em.merge(c);
		}
	}

	public List<Papel> listar() {
		return em.createQuery("from Papel", Papel.class)
				.getResultList();
	}

	@Override
	public void apagar(Papel categoria) {
		em.remove(em.merge(categoria));
	}

	@Override
	public Papel buscarPorNome(String name) {
		return em.createQuery("from Papel c where c.nome = '"+name+"'", Papel.class).getSingleResult();
	}

}
