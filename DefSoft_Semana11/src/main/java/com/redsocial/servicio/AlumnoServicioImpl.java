package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Alumno;
import com.redsocial.repositorio.AlumnoRepositorio;

@Service
public class AlumnoServicioImpl implements AlumnoServicio{

	@Autowired
	private AlumnoRepositorio repositorio; 
	
	@Override
	public Alumno insertaActualizaAlumno(Alumno obj) {
		return repositorio.insertaActualizaAlumno(obj);
	}


	@Override
	public void eliminaAlumno(int idAlumno) {
		repositorio.eliminaAlumno(idAlumno);
	}

	@Override
	public List<Alumno> listaAlumno() {
		return repositorio.listaAlumno();
	}

	@Override
	public List<Alumno> listaAlumnoPorNombre(String nom) {
		return repositorio.listaAlumnoPorNombre(nom);
	}


}


