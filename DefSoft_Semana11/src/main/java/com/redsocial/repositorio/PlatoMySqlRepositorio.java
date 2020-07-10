package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Pais;
import com.redsocial.entidad.Plato;
;
@Repository
public class PlatoMySqlRepositorio implements  PlatoRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Plato> mapperPlato = new RowMapper<Plato>() {
		@Override
		public Plato mapRow(ResultSet rs, int rowNum) throws SQLException {
			Plato obj = new Plato();
			obj.setIdPlato(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setPrecio(rs.getDouble(3));
			obj.setStock(rs.getInt(4));
			obj.setRestaurant(rs.getString(5));
			obj.setFechaVencimiento(rs.getString(6));
			obj.setIngredientes(rs.getString(7));
			
			Pais objDep = new Pais();
			objDep.setIdPais(rs.getInt(8));
			objDep.setNombre(rs.getString(9));
		
			obj.setPais(objDep);
			
			return obj;
		}
	};
	
	
	
	
	
	
	
	@Override
	public Plato insertaActualizaPlato(Plato obj) {
		Plato salida = null;
		if (obj.getIdPlato() == 0) {
			jdbcTemplate.update("insert into plato values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getPrecio(), obj.getStock(), obj.getRestaurant(),obj.getFechaVencimiento(),obj.getIngredientes(),obj.getPais().getIdPais()});	
			List<Plato> lista = jdbcTemplate.query("select pl.*,p.nombre from plato pl inner join pais p on pl.idPais = p.idpais order by pl.idplato desc limit 0, 1",new Object[] {} ,mapperPlato);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update plato set nombre=?,precio=?,stock=?,restaurant=?,fechaVencimiento=?,ingredientes=?, idPais = ? where idplato=?", new Object[] {obj.getNombre(), obj.getPrecio(), obj.getStock(), obj.getRestaurant(),obj.getFechaVencimiento(),obj.getIngredientes(), obj.getPais().getIdPais(), obj.getIdPlato()});
			List<Plato> lista = jdbcTemplate.query("select pl.*,p.nombre from plato pl inner join pais p on pl.idPais = p.idpais where pl.idplato =?",new Object[] {obj.getIdPlato()} ,mapperPlato);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaPlato(int idPlato) {
		jdbcTemplate.update("delete from plato where idplato = ?",new Object[] {idPlato});
		
	}

	@Override
	public List<Plato> listaPlato() {
		List<Plato> lista = jdbcTemplate.query("select pl.*,p.nombre from plato pl inner join pais p on pl.idPais = p.idpais", new Object[] {} ,mapperPlato);
		return lista;
	}

	@Override
	public List<Plato> listaPlatoPorNombre(String nom) {
		List<Plato> lista = jdbcTemplate.query("select pl.*,p.nombre from plato pl inner join pais p on pl.idPais = d.idpais where pl.nombre like ?", new Object[] {nom} ,mapperPlato);
		return lista;
	}

	@Override
	public List<Plato> listaPlato(int idPais, String nombre) {
		List<Plato> lista = jdbcTemplate.query("select pl.*,p.nombre from plato pl inner join pais p on pl.idPais = p.idpais where pl.idPais =? and pl.nombre like ? ", new Object[] {idPais, nombre} ,mapperPlato);
		return lista;
	}

}
