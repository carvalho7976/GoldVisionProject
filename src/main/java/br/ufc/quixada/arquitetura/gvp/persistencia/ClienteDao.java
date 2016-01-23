package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;

@Named
public class ClienteDao implements IClienteDao{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public void salvar(Cliente cliente) {
		if(cliente.getId() != null) em.persist(cliente);
		else em.merge(cliente);
	}

	@Override
	public void apagar(Integer idCliente) {
		Cliente cliente = buscarPorId(idCliente);
		em.remove(em.merge(cliente));
	}

	@Override
	public List<Cliente> listar() {
		return em.createQuery("from Cliente", Cliente.class).getResultList();
	}

	@Override
	public Cliente buscarPorId(Integer idCliente) {
		return em.find(Cliente.class, idCliente);
	}
}
