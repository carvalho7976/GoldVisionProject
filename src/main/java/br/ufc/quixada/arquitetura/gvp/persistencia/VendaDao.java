	package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.util.JpaGenericRepositoryImpl;
import br.ufc.quixada.arquitetura.gvp.util.QueryType;


@Named
public class VendaDao extends JpaGenericRepositoryImpl<Venda> implements IVendaDao {

	@PersistenceContext
	private EntityManager em;

	public void salvar(Venda g) {
		if (g.getId() == null) {
			em.persist(g);
		} else {
			em.merge(g);
		}
	}

	public List<Venda> listar() {
		return em.createQuery("from Venda", Venda.class).getResultList();
	}

	@Override
	public Venda buscarPorId(Integer id) {
		return em.find(Venda.class, id);
	}

	@Override
	public void apagar(Venda Venda) {
		em.remove(em.merge(Venda));
	}

	@Override
	public List<Venda> listaCobrancas() {
		Map<String, Object> params = new HashMap<String, Object>();
		List<Venda> result = find(QueryType.JPQL, "from Venda where numParcelasPagas < numParcelas", params);
		Date dataAtual = new Date();
		Calendar temp = Calendar.getInstance();
		temp.setTime(dataAtual);
		
		int mesAtual = temp.get(Calendar.MONTH);
		int anoAtual = temp.get(Calendar.YEAR);
		
		List<Venda> cobrancasDoMes = new ArrayList<Venda>();
		
		for (Venda venda : result) {
			temp.setTime(venda.getUltimoPagamento());
			if(temp.get(Calendar.YEAR) < anoAtual){
				cobrancasDoMes.add(venda);
			}else{
				if(temp.get(Calendar.MONTH) < mesAtual){
					cobrancasDoMes.add(venda);
				}
			}
			
		}
		return cobrancasDoMes;
	}

}