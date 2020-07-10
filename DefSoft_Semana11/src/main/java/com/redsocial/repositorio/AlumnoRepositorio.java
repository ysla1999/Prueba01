package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.Alumno;

/*
 * Los JPQL(Java Persistence Query Language) son con clases y atributos
 */
public interface AlumnoRepositorio  {

	public Alumno insertaActualizaAlumno(Alumno obj);
	public void eliminaAlumno(int idAlumno);
	public List<Alumno> listaAlumno();
	public List<Alumno> listaAlumnoPorNombre(String nom);
	
	
}
