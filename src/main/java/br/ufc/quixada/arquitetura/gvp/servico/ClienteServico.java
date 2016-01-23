package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;
import br.ufc.quixada.arquitetura.gvp.persistencia.ClienteDao;

@Named
public class ClienteServico implements IClienteServico{

	@Inject
	private ClienteDao clienteDao;
	
	@Override
	public void salvarCliente(Cliente cliente) {
		clienteDao.salvar(cliente);
		
	}

	@Override
	public void editarCliente(Cliente cliente) {
		clienteDao.salvar(cliente);
		
	}

	@Override
	public void deletarCliente(Integer idCliente) {
		clienteDao.apagar(idCliente);
		
	}

	@Override
	public Cliente procurarPorId(Integer idCliente) {
		return clienteDao.buscarPorId(idCliente);
	}

	@Override
	public List<Cliente> listarClientes() {
		// TODO Auto-generated method stub
		return clienteDao.listar();
	}

}
