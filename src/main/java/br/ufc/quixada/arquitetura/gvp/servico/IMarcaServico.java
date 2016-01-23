package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;

public interface IMarcaServico {
	public abstract void salvarMarca(Marca marca);

	public void deletarMarca(Integer idMarca);

	public Marca procurarPorId(Integer idMarca);

	public abstract List<Marca> listarMarcas();
}
