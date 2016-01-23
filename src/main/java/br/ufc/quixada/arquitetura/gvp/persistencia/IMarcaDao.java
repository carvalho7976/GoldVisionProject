package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.util.GenericRepository;

public interface IMarcaDao extends GenericRepository<Marca> {
	public abstract void salvar(Marca marca);
	public void apagar(Integer idMarca);
	public abstract  List<Marca> listar();
	public Marca buscarPorId(Integer idMarca);

}
