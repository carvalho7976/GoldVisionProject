package br.ufc.quixada.arquitetura.gvp.persistencia;


import java.util.List;
import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;

public interface IClienteDao {
	void salvar(Cliente cliente);
	void apagar(Integer idCliente);
	List<Cliente> listar();
	Cliente buscarPorId(Integer idCliente);
}
