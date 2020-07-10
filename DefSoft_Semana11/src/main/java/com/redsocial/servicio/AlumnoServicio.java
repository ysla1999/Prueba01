package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.Alumno;

public interface AlumnoServicio {

	public Alumno insertaActualizaAlumno(Alumno obj);
	public void eliminaAlumno(int idAlumno);
	public List<Alumno> listaAlumno();
	public List<Alumno> listaAlumnoPorNombre(String nom);

}
