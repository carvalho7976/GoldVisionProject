package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.util.JpaGenericRepositoryImpl;

@Named
public class MarcaDAO extends JpaGenericRepositoryImpl<Marca> implements IMarcaDao{
	@PersistenceContext
	private EntityManager em;

	public void salvar(Marca marca) {
		if(marca.getId() == null) em.persist(marca);
		else em.merge(marca);
	}

	@Override
	public void apagar(Integer idMarca) {
		Marca marca = buscarPorId(idMarca);
		em.remove(em.merge(marca));
	}

	@Override
	public List<Marca> listar() {
		return em.createQuery("from Marca", Marca.class).getResultList();
	}

	public Marca buscarPorId(Integer idMarca) {
		return em.find(Marca.class, idMarca);
	}

}

