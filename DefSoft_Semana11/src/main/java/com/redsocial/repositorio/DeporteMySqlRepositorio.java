package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Deporte;

@Repository
public class DeporteMySqlRepositorio implements DeporteRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Deporte> mapperDeporte = new RowMapper<Deporte>() {
		@Override
		public Deporte mapRow(ResultSet rs, int rowNum) throws SQLException {
			Deporte obj = new Deporte();
			obj.setIdDeporte(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			return obj;
		}
	};
	
	@Override
	public List<Deporte> listaDeporte() {
		List<Deporte> lista = jdbcTemplate.query("select * from deporte", new Object[] {} ,mapperDeporte);
		return lista;
	}

}
