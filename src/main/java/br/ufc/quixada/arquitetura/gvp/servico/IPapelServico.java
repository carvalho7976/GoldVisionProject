package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;

public interface IPapelServico {

	public abstract void salvar(Papel c);

	public abstract List<Papel> listar();
	
	public Papel buscarPorNome(String name);
	
	public void apagar(Papel categoria);
	

}