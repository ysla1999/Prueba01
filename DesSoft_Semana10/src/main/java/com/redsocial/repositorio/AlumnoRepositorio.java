package com.redsocial.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.redsocial.entidad.Alumno;

/*
 * Los JPQL(Java Persistence Query Language) son con clases y atributos
 */
public interface AlumnoRepositorio extends JpaRepository<Alumno, Integer> {

	
	@Query("Select x from Alumno x where x.nombre like :var_nombre")
	public abstract List<Alumno> buscaPorNombre(@Param("var_nombre") String nom);
	
	
	
}
