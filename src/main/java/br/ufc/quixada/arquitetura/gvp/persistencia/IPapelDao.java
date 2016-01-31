package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;

public interface IPapelDao {

	public abstract void salvar(Papel c);

	public abstract List<Papel> listar();
	
	public Papel buscarPorNome(String name);
	
	public void apagar(Papel categoria);
	
}