package br.ufc.quixada.arquitetura.gvp.controle;

import javax.inject.Inject;
import javax.inject.Named;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

import br.ufc.quixada.arquitetura.gvp.modelo.Cliente;
import br.ufc.quixada.arquitetura.gvp.servico.ClienteServico;

@Named
@Controller
@RequestMapping("cliente")
public class ClienteControle {
	
	@Inject
	private ClienteServico clienteServico;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listar(){
		ModelAndView model = new ModelAndView("cliente/listar");
		List<Cliente> clientes = clienteServico.listarClientes(); 
		model.addObject("clientes",clientes);
		return model;
	}
	@RequestMapping(value = "/cadastrar/", method = RequestMethod.GET)
	public ModelAndView cadastrar(){
		ModelAndView model = new ModelAndView("cliente/cadastrar");
		return model;
	}

}
