package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Venda;
import br.ufc.quixada.arquitetura.gvp.persistencia.IVendaDao;

@Named
public class VendaServico implements IVendaServico {

	@Inject
	private IVendaDao VendaRepository;
	
	public VendaServico() {
	}


	@Override
	@Transactional
	public void salvar(Venda v) {

		Integer i =v.getProduto().getQuantidade().intValue();
		if(i.intValue()>1){
			v.getProduto().setQuantidade(i -= 1);
			VendaRepository.salvar(v);
		}
		
	}

	@Override
	@Transactional
	public List<Venda> listar() {
		List<Venda> l = VendaRepository.listar();
		return l;
	}

	@Override
	@Transactional
	public Venda buscarPorId(Integer id) {
		Venda g = VendaRepository.buscarPorId(id);
		return g;
	}

	@Override
	@Transactional
	public void apagar(Venda g) {
		VendaRepository.apagar(g);
	}


	@Override
	@Transactional
	public List<Venda> listaCobrancas() {
		return VendaRepository.listaCobrancas();
	}


	@Override
	public double montanteMes(List<Venda> cobrancas) {
		double montante = 0;
		for (Venda venda : cobrancas) {
			montante += venda.getValorParcela();
		}
		return montante;
	}


	@Override
	public List<Venda> listaCobrancasAtrasadas() {
		List<Venda> pagamentosAtrasados = new ArrayList<Venda>();
		Date dataAtual = new Date();
		Calendar temp = Calendar.getInstance();
		temp.setTime(dataAtual);
		int dia = temp.get(Calendar.DAY_OF_MONTH);
		int mes = temp.get(Calendar.MONTH);
		int ano = temp.get(Calendar.YEAR);
		for (Venda venda : listaCobrancas()) {
			temp.setTime(venda.getUltimoPagamento());
			if(temp.get(Calendar.YEAR)<ano){
				if(mes > temp.get(Calendar.JANUARY)){
					pagamentosAtrasados.add(venda);
					System.out.println("olha aqui " + venda.getId());
				}else if(dia < venda.getDiaVencimento().intValue()){
					pagamentosAtrasados.add(venda);
				}
			}else if(mes > temp.get(Calendar.MONTH)&& dia > venda.getDiaVencimento().intValue()){
				pagamentosAtrasados.add(venda);
			}
			
		}
		
		return pagamentosAtrasados;
	}
}
