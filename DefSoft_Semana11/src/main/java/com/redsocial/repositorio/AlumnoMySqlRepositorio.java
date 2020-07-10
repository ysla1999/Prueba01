package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Alumno;

@Repository
public class AlumnoMySqlRepositorio implements AlumnoRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	RowMapper<Alumno> mapperAlumno = new RowMapper<Alumno>() {
		@Override
		public Alumno mapRow(ResultSet rs, int rowNum) throws SQLException {
			Alumno obj = new Alumno();
			obj.setIdAlumno(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setDni(rs.getString(3));
			obj.setCorreo(rs.getString(4));
			obj.setFechaNacimiento(rs.getDate(5));
			return obj;
		}
	};
	
	@Override
	public Alumno insertaActualizaAlumno(Alumno obj) {
		Alumno salida = null;
		if (obj.getIdAlumno() == 0) {
			jdbcTemplate.update("insert into alumno values(null,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getDni(), obj.getCorreo(),obj.getFechaNacimiento()});	
			List<Alumno> lista = jdbcTemplate.query("select * from alumno order by idalumno desc limit 0, 1",new Object[] {} ,mapperAlumno);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update alumno set nombre=?,dni=?,correo=?,fechaNacimiento=? where idAlumno=?", new Object[] {obj.getNombre(), obj.getDni(), obj.getCorreo(),obj.getFechaNacimiento(), obj.getIdAlumno()});
			List<Alumno> lista = jdbcTemplate.query("select * from alumno where idAlumno =?",new Object[] {obj.getIdAlumno()} ,mapperAlumno);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaAlumno(int idAlumno) {
		jdbcTemplate.update("delete from alumno where idalumno = ?",new Object[] {idAlumno});		
	}
	
	@Override
	public List<Alumno> listaAlumno() {
		List<Alumno> lista = jdbcTemplate.query("select * from alumno", new Object[] {} ,mapperAlumno);
		return lista;
	}

	@Override
	public List<Alumno> listaAlumnoPorNombre(String nom) {
		List<Alumno> lista = jdbcTemplate.query("select * from alumno where nombre like ?", new Object[] {nom} ,mapperAlumno);
		return lista;
	}

}
