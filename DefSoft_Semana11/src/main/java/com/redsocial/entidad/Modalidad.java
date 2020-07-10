package com.redsocial.entidad;

public class Modalidad {

	private int idModalidad;

	private String nombre;

	private int numHombres;

	private int numMujeres;

	private int edadMaxima;

	private int edadMinima;

	private Deporte deporte;

	public int getIdModalidad() {
		return idModalidad;
	}

	public void setIdModalidad(int idModalidad) {
		this.idModalidad = idModalidad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getNumHombres() {
		return numHombres;
	}

	public void setNumHombres(int numHombres) {
		this.numHombres = numHombres;
	}

	public int getNumMujeres() {
		return numMujeres;
	}

	public void setNumMujeres(int numMujeres) {
		this.numMujeres = numMujeres;
	}

	public int getEdadMaxima() {
		return edadMaxima;
	}

	public void setEdadMaxima(int edadMaxima) {
		this.edadMaxima = edadMaxima;
	}

	public int getEdadMinima() {
		return edadMinima;
	}

	public void setEdadMinima(int edadMinima) {
		this.edadMinima = edadMinima;
	}

	public Deporte getDeporte() {
		return deporte;
	}

	public void setDeporte(Deporte deporte) {
		this.deporte = deporte;
	}

}
