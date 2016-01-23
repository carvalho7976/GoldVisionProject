package br.ufc.quixada.arquitetura.gvp.servico;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;

public interface IClienteServico {
	
	public void salvarCliente(Cliente cliente);
	public void editarCliente(Cliente cliente);
	public void deletarCliente(Integer idCliente);
	public Cliente procurarPorId(Integer idCliente);
}
