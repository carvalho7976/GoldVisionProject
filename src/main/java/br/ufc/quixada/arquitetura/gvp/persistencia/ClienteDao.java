package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;

@Named
public class ClienteDao implements IClienteDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void salvar(Cliente cliente) {
		try {
			if (cliente.getId() == null)
				em.persist(cliente);
			else
				em.merge(cliente);
		} catch (Exception e) {
			e.printStackTrace();
		}

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

	@Override
	public List<Cliente> listaAniversariantes() {
		List<Cliente> temp = new ArrayList<>();
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int mesAtual = calendar.get(Calendar.MONTH);

		for (Cliente meuCliente : listar()) {
			try {
				if (meuCliente.getDataNasc() != null) {
					calendar.setTime(meuCliente.getDataNasc());
					if (calendar.get(Calendar.MONTH) == mesAtual) {
						temp.add(meuCliente);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return temp;
	}
}
