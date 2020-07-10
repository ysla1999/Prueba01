package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Deporte;
import com.redsocial.entidad.Modalidad;

@Repository
public class ModalidadMySqlRepositorio implements ModalidadRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Modalidad> mapperModalidad = new RowMapper<Modalidad>() {
		@Override
		public Modalidad mapRow(ResultSet rs, int rowNum) throws SQLException {
			Modalidad obj = new Modalidad();
			obj.setIdModalidad(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setNumHombres(rs.getInt(3));
			obj.setNumMujeres(rs.getInt(4));
			obj.setEdadMaxima(rs.getInt(5));
			obj.setEdadMinima(rs.getInt(6));
			
			Deporte objDep = new Deporte();
			objDep.setIdDeporte(rs.getInt(7));
			objDep.setNombre(rs.getString(8));
		
			obj.setDeporte(objDep);
			
			return obj;
		}
	};
	
	@Override
	public Modalidad insertaActualizaModalidad(Modalidad obj) {
		Modalidad salida = null;
		if (obj.getIdModalidad() == 0) {
			jdbcTemplate.update("insert into modalidad values(null,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getNumHombres(), obj.getNumMujeres(), obj.getEdadMaxima(),obj.getEdadMinima(),obj.getDeporte().getIdDeporte()});	
			List<Modalidad> lista = jdbcTemplate.query("select m.*,d.nombre from modalidad m inner join deporte d on m.idDeporte = d.iddeporte order by m.idmodalidad desc limit 0, 1",new Object[] {} ,mapperModalidad);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update modalidad set nombre=?,numHombres=?,numMujeres=?,edadMaxima=?,edadMinima =?, idDeporte = ? where idmodalidad=?", new Object[] {obj.getNombre(), obj.getNumHombres(), obj.getNumMujeres(), obj.getEdadMaxima(),obj.getEdadMinima(), obj.getDeporte().getIdDeporte(), obj.getIdModalidad()});
			List<Modalidad> lista = jdbcTemplate.query("select m.*,d.nombre from modalidad m inner join deporte d on m.idDeporte = d.iddeporte where m.idmodalidad =?",new Object[] {obj.getIdModalidad()} ,mapperModalidad);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaModalidad(int idModalidad) {
		jdbcTemplate.update("delete from modalidad where idmodalidad = ?",new Object[] {idModalidad});		
	}

	@Override
	public List<Modalidad> listaModalidad() {
		List<Modalidad> lista = jdbcTemplate.query("select m.*,d.nombre from modalidad m inner join deporte d on m.idDeporte = d.iddeporte", new Object[] {} ,mapperModalidad);
		return lista;
	}

	@Override
	public List<Modalidad> listaModalidadPorNombre(String nom) {
		List<Modalidad> lista = jdbcTemplate.query("select m.*,d.nombre from modalidad m inner join deporte d on m.idDeporte = d.iddeporte where m.nombre like ?", new Object[] {nom} ,mapperModalidad);
		return lista;
	}

	@Override
	public List<Modalidad> listaMoldalidad(int idDeporte, String nombre, int edad) {
		List<Modalidad> lista = jdbcTemplate.query("select m.*,d.nombre from modalidad m inner join deporte d on m.idDeporte = d.iddeporte where m.idDeporte =? and m.nombre like ? and m.edadMinima<= ? and m.edadMaxima>= ? ", new Object[] {idDeporte, nombre, edad,edad} ,mapperModalidad);
		return lista;
	}

}
