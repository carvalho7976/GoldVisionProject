package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;

public interface IModeloServico {
	public abstract void salvarModelo(Modelo modelo);

	public void deletarModelo(Integer idModelo);

	public Modelo procurarPorId(Integer idModelo);

	public abstract List<Modelo> listarModelos();

}
