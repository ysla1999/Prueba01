package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.Modalidad;

public interface ModalidadRepositorio  {
	
	public Modalidad insertaActualizaModalidad(Modalidad obj);
	public void eliminaModalidad(int idModalidad);
	public List<Modalidad> listaModalidad();
	public List<Modalidad> listaModalidadPorNombre(String nom);
	public List<Modalidad> listaMoldalidad(int idDeporte, String nombre,int edad);
	
}
