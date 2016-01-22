package br.ufc.quixada.arquitetura.gvp.persistencia;

import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Papel;

public interface IPapelDao {

	public abstract void save(Papel c);

	public abstract List<Papel> findAll();
	
	public Papel findByName(String name);
	
	public void remove(Papel categoria);
	
}