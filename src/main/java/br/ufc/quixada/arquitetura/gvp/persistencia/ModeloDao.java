package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;
import br.ufc.quixada.arquitetura.gvp.util.JpaGenericRepositoryImpl;

@Named
public class ModeloDao extends JpaGenericRepositoryImpl<Modelo> implements IModeloDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public void salvar(Modelo modelo) {
		if(modelo.getId() == null) em.persist(modelo);
		else em.merge(modelo);
	}

	@Override
	public void apagar(Integer idModelo) {
		Modelo modelo = buscarPorId(idModelo);
		em.remove(em.merge(modelo));
	}

	@Override
	public List<Modelo> listar() {
		return em.createQuery("from Modelo", Modelo.class).getResultList();
	}

	public Modelo buscarPorId(Integer idModelo) {
		return em.find(Modelo.class, idModelo);
	}
	
	@Override
	public List<Modelo> buscarPorMarca(Integer idMarca){
		
		return  em.createQuery("from Modelo m where m.marca.id = :id", Modelo.class).setParameter("id", idMarca).getResultList();
		
	}


}
