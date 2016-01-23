package br.ufc.quixada.arquitetura.gvp.controle;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

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

}
