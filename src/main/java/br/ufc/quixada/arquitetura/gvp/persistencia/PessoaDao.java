package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Pessoa;


@Named
public class PessoaDao implements IPessoaDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Pessoa g) {
		if (g.getId() == null) {
			em.persist(g);
		} else {
			em.merge(g);
		}
	}

	public List<Pessoa> findAll() {
		return em.createQuery("from Pessoa", Pessoa.class).getResultList();
	}

	@Override
	public Pessoa findById(Long id) {
		return em.find(Pessoa.class, id);
	}

	@Override
	public void remove(Pessoa Pessoa) {
		em.remove(em.merge(Pessoa));
	}

}
