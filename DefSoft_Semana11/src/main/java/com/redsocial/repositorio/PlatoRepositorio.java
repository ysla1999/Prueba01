package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.Plato;

public interface PlatoRepositorio {

	public Plato insertaActualizaPlato(Plato obj);
	public void eliminaPlato(int idPlato);
	public List<Plato> listaPlato();
	public List<Plato> listaPlatoPorNombre(String nom);
	public List<Plato> listaPlato(int idPais, String nombre);
	

}
