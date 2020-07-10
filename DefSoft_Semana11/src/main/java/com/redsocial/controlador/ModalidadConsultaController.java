package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Modalidad;
import com.redsocial.servicio.ModalidadServicio;

@Controller
public class ModalidadConsultaController {

	@Autowired
	private ModalidadServicio servicio;
	
	@RequestMapping("/verConsultaModalidad")
	public String ver() {
		return "consultaModalidad";
	}
	
	@RequestMapping("/consultaModalidad")
	public String lista(int idDeporte, String nombre, int edad, Model m) {
		List<Modalidad> lista =  servicio.listaMoldalidad(idDeporte, nombre+"%", edad);
		m.addAttribute("modalidades", lista);
		return "consultaModalidad";
	}
}
