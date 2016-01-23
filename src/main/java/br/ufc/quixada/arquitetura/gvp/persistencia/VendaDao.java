package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;


@Named
public class VendaDao implements IVendaDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Venda g) {
		if (g.getId() == null) {
			em.persist(g);
		} else {
			em.merge(g);
		}
	}

	public List<Venda> findAll() {
		return em.createQuery("from Venda", Venda.class).getResultList();
	}

	@Override
	public Venda findById(Long id) {
		return em.find(Venda.class, id);
	}

	@Override
	public void remove(Venda Venda) {
		em.remove(em.merge(Venda));
	}

}