package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Deporte;
import com.redsocial.entidad.Modalidad;
import com.redsocial.servicio.DeporteServicio;
import com.redsocial.servicio.ModalidadServicio;

@Controller
public class ModalidadController {

	@Autowired
	private ModalidadServicio modalidadServicio;
	
	@Autowired
	private DeporteServicio deporteServicio;

	@RequestMapping("/verModalidad")
	public String ver() {
		return "registraModalidad";
	}
	
	@RequestMapping("/cargaDeporte")
	@ResponseBody
	public List<Deporte> listaDeporte() {
		return deporteServicio.listaDeporte();
	}
	
	@RequestMapping("/registraModalidad")
	public String metRegistra(Modalidad obj,HttpSession session) {
		Modalidad aux = modalidadServicio.insertaActualizaModalidad(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verModalidad";
	}


	
	
}
