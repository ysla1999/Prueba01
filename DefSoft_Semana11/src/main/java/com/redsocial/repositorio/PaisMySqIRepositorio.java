package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Pais;
@Repository
public class PaisMySqIRepositorio implements PaisRepositorio {
	 @Autowired
    private JdbcTemplate jdbcTemplate ;
	
		RowMapper<Pais> mapperPais = new RowMapper<Pais>() {
			@Override
			public Pais mapRow(ResultSet rs, int rowNum) throws SQLException {
				Pais obj = new Pais();
				obj.setIdPais(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				return obj;
			}
		};
	
	@Override
	public List<Pais> listaPais() {
		List<Pais> lista = jdbcTemplate.query("select * from pais", new Object[] {} ,mapperPais);
		return lista;
	}

}
