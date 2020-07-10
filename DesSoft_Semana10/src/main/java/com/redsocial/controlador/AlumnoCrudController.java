package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Alumno;
import com.redsocial.servicio.AlumnoServicio;

@Controller
public class AlumnoCrudController {


	@Autowired
	private AlumnoServicio servicio;
	
	@RequestMapping("/verCrudAlumno")
	public String ver() {
		return "crudAlumno";
	}
	
	@RequestMapping("/consultaCrudAlumno")
	public String lista(String filtro, Model m) {
		List<Alumno> lista =  servicio.listaAlumnoPorNombre(filtro+"%");
		m.addAttribute("alumnos", lista);
		return "crudAlumno";
	}
	
	@RequestMapping("/registraActualizaCrudAlumno")
	public String registraActualiza(Alumno obj, Model m) {
		servicio.insertaActualizaAlumno(obj);
		List<Alumno> lista =  servicio.listaAlumno();
		m.addAttribute("alumnos", lista);
		return "crudAlumno";
	}

	@RequestMapping("/eliminaCrudAlumno")
	public String elimina(int id, Model m) {
		servicio.eliminaAlumno(id);
		List<Alumno> lista =  servicio.listaAlumno();
		m.addAttribute("alumnos", lista);
		return "crudAlumno";
	}
}



