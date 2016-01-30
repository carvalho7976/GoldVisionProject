package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.util.JpaGenericRepositoryImpl;
import br.ufc.quixada.arquitetura.gvp.util.QueryType;

@Named
public class MarcaDAO extends JpaGenericRepositoryImpl<Marca> implements IMarcaDao {
	@PersistenceContext
	private EntityManager em;

	public void salvar(Marca marca) {
		if (marca.getId() == null)
			em.persist(marca);
		else
			em.merge(marca);
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

	@Override
	public Marca buscaPorCodigo(String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		List<Marca> result = find(QueryType.JPQL, "from Marca where codigo = :codigo", params);
		if (result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Marca buscaPorNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		List<Marca> result = find(QueryType.JPQL, "from Marca where nomeMarca = :nome", params);
		if (result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

}
