package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;

public interface IMarcaDao {
	public abstract void salvar(Marca marca);
	public void apagar(Integer idMarca);
	public abstract  List<Marca> listar();
	public Marca buscarPorId(Integer idMarca);

}
