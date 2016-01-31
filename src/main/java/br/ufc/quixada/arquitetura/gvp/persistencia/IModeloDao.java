package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;
import br.ufc.quixada.arquitetura.gvp.util.GenericRepository;

public interface IModeloDao extends GenericRepository<Modelo>{
	public abstract void salvar(Modelo modelo);
	public void apagar(Integer modelo);
	public abstract  List<Modelo> listar();
	public Modelo buscarPorId(Integer idModelo);
	public List<Modelo> buscarPorMarca(Integer idMarca);
}
