package br.ufc.quixada.arquitetura.gvp.controle;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.arquitetura.gvp.modelo.Marca;
import br.ufc.quixada.arquitetura.gvp.modelo.Modelo;
import br.ufc.quixada.arquitetura.gvp.servico.MarcaServico;
import br.ufc.quixada.arquitetura.gvp.servico.ModeloServico;

@Named
@Controller
@RequestMapping("modelo")
public class ModeloControle {
	@Inject
	private ModeloServico modeloServico;

	@Inject
	private MarcaServico marcaServico;

	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public ModelAndView adicionarGET(Model modelAtribute) {

		modelAtribute.addAttribute("modelo", new Modelo());
		modelAtribute.addAttribute("marca", marcaServico.listarMarcas());
		ModelAndView model = new ModelAndView("produto/marca/modelo/adicionar");

		return model;
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public ModelAndView adicionarPOST(String codigo, String nomeModelo, Integer marca,
			final RedirectAttributes redirectAttributes) {

		Modelo meuModelo = new Modelo();
		meuModelo.setNomeModelo(nomeModelo);
		meuModelo.setCodigo(codigo);
		meuModelo.setMarca(marcaServico.procurarPorId(marca));
		modeloServico.salvarModelo(meuModelo);

		ModelAndView model = new ModelAndView("redirect:/modelo/listar");
		return model;
	}

	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public ModelAndView listar(Model modelAtribute) {

		modelAtribute.addAttribute("listaModelos", modeloServico.listarModelos());
		ModelAndView model = new ModelAndView("produto/marca/modelo/listar");
		return model;
	}

	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public ModelAndView excluir(@PathVariable("id") Integer id) {
		if (modeloServico.procurarPorId(id) != null) {
			modeloServico.deletarModelo(id);
		}

		ModelAndView model = new ModelAndView("redirect:/modelo/listar");
		return model;
	}

	@RequestMapping(value = "/{id}/detalhes", method = RequestMethod.GET)
	public ModelAndView detalhes(@PathVariable("id") Integer id, Model modelAtribute) {
		modelAtribute.addAttribute("modelo", modeloServico.procurarPorId(id));
		ModelAndView model = new ModelAndView("/produto/marca/modelo/detalhes");
		return model;
	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public ModelAndView editarGET(@PathVariable("id") Integer id, Model modelAtribute) {
		modelAtribute.addAttribute("modelo", modeloServico.procurarPorId(id));
		modelAtribute.addAttribute("listaMarcas", marcaServico.find(Marca.class));

		ModelAndView model = new ModelAndView("/produto/marca/modelo/editar");
		return model;
	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public ModelAndView editarPOST(@PathVariable("id") Integer id, String nomeModelo, String codigo, Integer marca,
			final RedirectAttributes redirectAttributes) {
		
		Modelo meuModelo = modeloServico.procurarPorId(id);
		meuModelo.setNomeModelo(nomeModelo);
		meuModelo.setCodigo(codigo);
		meuModelo.setMarca(marcaServico.procurarPorId(marca));
		modeloServico.salvarModelo(meuModelo);

		ModelAndView model = new ModelAndView("redirect:/modelo/listar");
		return model;
	}
}
