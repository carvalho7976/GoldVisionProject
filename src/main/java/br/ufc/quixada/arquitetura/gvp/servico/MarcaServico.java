package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.transaction.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.persistencia.IMarcaDao;
import br.ufc.quixada.arquitetura.gvp.util.GenericServiceImpl;

@Named
public class MarcaServico extends GenericServiceImpl<Marca> implements IMarcaServico  {
	
	@Inject
	private IMarcaDao marcaRepositorio;

	public MarcaServico() {
	}

	@Override
	@Transactional
	public void salvarMarca(Marca marca) {
		marcaRepositorio.salvar(marca);
	}

	@Override
	@Transactional
	public Marca procurarPorId(Integer idMarca) {
		Marca minhaMarca = marcaRepositorio.buscarPorId(idMarca);
		return minhaMarca;
	}

	@Override
	@Transactional
	public List<Marca> listarMarcas() {
		List<Marca> listaDeMarcas = marcaRepositorio.listar();
		return listaDeMarcas;
	}

	@Override
	@Transactional
	public void deletarMarca(Integer idMarca) {
		marcaRepositorio.apagar(idMarca);
	}

}
