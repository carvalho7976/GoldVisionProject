package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;
import br.ufc.quixada.arquitetura.gvp.servico.ClienteServico;

@Named
@Controller
@RequestMapping("cliente")
public class ClienteControle {

	@Inject
	private ClienteServico clienteServico;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {
		
		List<Cliente> clientes = clienteServico.listarClientes();
		modelAtribute.addAttribute("clientes",clientes);
		ModelAndView model = new ModelAndView("cliente/listar");
		return model;
		
	}

	@RequestMapping(value = "/cadastrar/", method = RequestMethod.GET)
	public ModelAndView cadastrar(Model modelAtribute) {
		modelAtribute.addAttribute("cliente", new Cliente());
		ModelAndView model = new ModelAndView("cliente/cadastrar");
		return model;
	}

	@RequestMapping(value = "/cadastrar/", method = RequestMethod.POST)
	public ModelAndView salvarCliente(@ModelAttribute("cliente") Cliente cliente) {
		
		clienteServico.salvarCliente(cliente);
		String clienteEnd = "/cliente/";
		return new ModelAndView("redirect:" +clienteEnd );
	}
	
	@RequestMapping(value = "/apagar/{id}", method = RequestMethod.GET)
	public ModelAndView apagar(@PathVariable("id") Integer id) {
		clienteServico.deletarCliente(id);
		
		String clienteEnd = "/cliente/";
		return new ModelAndView("redirect:" +clienteEnd );
	}
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.GET)
	public ModelAndView editar(Model modelAtribute,@PathVariable("id") Integer id) {
		
		modelAtribute.addAttribute("cliente", clienteServico.procurarPorId(id));
		ModelAndView model = new ModelAndView("cliente/editar");
		return model;
	}
	@RequestMapping(value = "/editar/{id}/", method = RequestMethod.POST)
	public ModelAndView editarSalvar(@ModelAttribute("cliente") Cliente cliente,@PathVariable("id") Integer id) {
		cliente.setId(id);
		clienteServico.salvarCliente(cliente);
		String clienteEnd = "/cliente/";
		return new ModelAndView("redirect:" +clienteEnd );
	}
	@RequestMapping(value = "/detalhes/{id}", method = RequestMethod.GET)
	public ModelAndView detalhes(Model modelAtribute,@PathVariable("id") Integer id) {
		
		modelAtribute.addAttribute("cliente", clienteServico.procurarPorId(id));
		ModelAndView model = new ModelAndView("cliente/detalhes");
		return model;
	}
}
