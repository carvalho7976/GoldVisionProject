package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;
import br.ufc.quixada.arquitetura.gvp.persistencia.IModeloDao;
import br.ufc.quixada.arquitetura.gvp.util.GenericServiceImpl;

@Named
public class ModeloServico extends GenericServiceImpl<Modelo> implements IModeloServico{

	@Inject
	private IModeloDao modeloRepositorio;
	
	@Override
	@Transactional
	public void salvarModelo(Modelo modelo) {
		modeloRepositorio.salvar(modelo);
	}

	@Override
	@Transactional
	public void deletarModelo(Modelo modelo) {
		modeloRepositorio.apagar(modelo);
	}

	@Override
	@Transactional
	public Modelo procurarPorId(Integer idModelo) {
		Modelo meuModelo = modeloRepositorio.buscarPorId(idModelo);
		return meuModelo;
	}

	@Override
	@Transactional
	public List<Modelo> listarModelos() {
		List<Modelo> listaDeModelos = modeloRepositorio.listar();
		return listaDeModelos;
	}

}
