package br.ufc.quixada.arquitetura.gvp.controle;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.servico.MarcaServico;

@Named
@Controller
@RequestMapping("marca")
public class MarcaControle {
	@Inject
	private MarcaServico servico;

	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public ModelAndView addMarcaGet(Model modelAtribute) {

		modelAtribute.addAttribute("marca", new Marca());
		ModelAndView model = new ModelAndView("produto/marca/adicionar");

		return model;
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public ModelAndView addMarcaPOST(@ModelAttribute("marca") Marca marca) {
		servico.salvarMarca(marca);
		ModelAndView model = new ModelAndView("redirect:/marca/listar");
		return model;
	}
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {

		modelAtribute.addAttribute("listaMarcas", servico.listarMarcas());
		ModelAndView model = new ModelAndView("/produto/marca/listar");

		return model;
	}
	
	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public ModelAndView excluir(@PathVariable("id") Integer id) {
		
		if(servico.procurarPorId(id) != null){
			servico.deletarMarca(id);
		}
		ModelAndView model = new ModelAndView("redirect:/marca/listar");
		return model;
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public ModelAndView editar(@PathVariable("id") Integer id, Model modelAtribute) {
		
		modelAtribute.addAttribute("marca", servico.procurarPorId(id));
		ModelAndView model = new ModelAndView("/produto/marca/editar");
		return model;
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public ModelAndView editar(@ModelAttribute("marca") Marca marca) {
		servico.salvarMarca(marca);
		ModelAndView model = new ModelAndView("redirect:/marca/listar");
		return model;
	}
	
	@RequestMapping(value = "/{id}/detalhes", method = RequestMethod.GET)
	public ModelAndView detalhes(@PathVariable("id") Integer id, Model modelAtribute) {
		modelAtribute.addAttribute("marca", servico.procurarPorId(id));
		ModelAndView model = new ModelAndView("/produto/marca/detalhes");
		return model;
	}

}

