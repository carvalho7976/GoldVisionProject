package br.ufc.quixada.arquitetura.gvp.servico;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.transaction.Transactional;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;
import br.ufc.quixada.arquitetura.gvp.persistencia.ClienteDao;

@Named
public class ClienteServico implements IClienteServico{

	@Inject
	private ClienteDao clienteDao;
	
	@Override
	@Transactional
	public void salvarCliente(Cliente cliente) {
		clienteDao.salvar(cliente);
		
	}

	@Override
	@Transactional
	public void editarCliente(Cliente cliente) {
		clienteDao.salvar(cliente);
		
	}

	@Override
	@Transactional
	public void deletarCliente(Integer idCliente) {
		clienteDao.apagar(idCliente);
		
	}

	@Override
	@Transactional
	public Cliente procurarPorId(Integer idCliente) {
		return clienteDao.buscarPorId(idCliente);
	}

	@Override
	@Transactional
	public List<Cliente> listarClientes() {
		// TODO Auto-generated method stub
		return clienteDao.listar();
	}

	@Override
	public List<Cliente> listaAniversarios() {
		return clienteDao.listaAniversariantes();
	}

}
