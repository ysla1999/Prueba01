<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>

<body> 
<div class="container">
 <h2>Consulta de Modalidad</h2>
		 <div class="col-md-23" >  
		       <form accept-charset="UTF-8"  action="consultaModalidad" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
								<select id="id_deporte" name="idDeporte" class='form-control'>
										<option value=" "> [ Seleccione Deporte ]</option>    
								</select>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" type="text"/>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_edad" name="edad" placeholder="Ingrese la edad" type="text" maxlength="2"/>
						</div>
						<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>#Hombres</th>
												<th>#Mujeres</th>
												<th>Edad Máxima</th>
												<th>Edad Mínima</th>
												<th>Deporte</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${modalidades}" var="x">
													<tr>
														<td>${x.idModalidad}</td>
														<td>${x.nombre}</td>
														<td>${x.numHombres}</td>
														<td>${x.numMujeres}</td>
														<td>${x.edadMaxima}</td>
														<td>${x.edadMinima}</td>
														<td>${x.deporte.nombre}</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
 </div>

<script type="text/javascript">
$.getJSON("cargaDeporte", {}, function(data){
	$.each(data, function(index,item){
		$("#id_deporte").append("<option value="+item.idDeporte +">"+ item.nombre +"</option>");
	});
});
</script>
    
</body>
</html> 