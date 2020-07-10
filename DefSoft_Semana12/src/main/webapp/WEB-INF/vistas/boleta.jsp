<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Ejemplos LPII CIBERTEC - Jorge Jacinto Gutarra</title>
</head>
<body>
<div class="container">
	<h3>BOLETA - JORGE JACINTO</h3>	
	
	<form id="id_form" accept-charset="UTF-8" action="boleta" class="form-horizontal" method="post">
			<div class="panel-group" id="steps">
				<div class="panel panel-default">
					<div class="panel-heading">SELECCIONE CLIENTE</div>
						<div class="panel-body">
							<div class="form-group col-md-4">
								<div class="col-lg-4">
									<button type="button" id="id_btnCliente" data-toggle='modal' class='btn btn-primary' >....</button>
									<input type="hidden" name="idCliente" id="id_cliente_id" class="form-control" value="-1"/>
								</div>
							</div> 
							<div class="form-group  col-md-4" >
								<label class="col-lg-2 control-label">Apellido</label>
								<div class="col-lg-8" >
									<input type="text"  id="id_cliente_apellido" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label class="col-lg-2 control-label">Nombre</label>
								<div class="col-lg-8">
									<input type="text"id="id_cliente_nombre"  class="form-control"	readonly="readonly"/>
								</div>
							</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">SELECCIONE PRODUCTO</div>
						<div class="panel-body">
							<div class="form-group  col-md-4" >
								<div class="col-lg-2">
									<button type="button" id="id_btnProducto" data-toggle='modal' class='btn btn-primary' >....</button>
									<input type="hidden" name="idProducto" id="id_producto_id" class="form-control" value="-1"/>									
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Nombre</label>
								<div class="col-lg-8">
									<input type="text" name="nombreProducto" id="id_producto_nombre" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Precio</label>
								<div class="col-lg-8">
									<input type="text" name="precio" id="id_producto_precio" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Stock</label>
								<div class="col-lg-8">
									<input type="text" name="stock" id="id_producto_stock" class="form-control" readonly="readonly"/>
								</div>
							</div>							
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label" for="id_reg_estado">Cantidad</label>
								<div class="col-lg-8">
									<input type="text" name="cantidad" id="id_producto_cantidad"  class="form-control"	placeholder="Ingrese la cantidad" onkeypress="return validarSoloNumerosEnteros(event);"  />
								</div>
							</div>
						</div>
				</div>
			</div>
			
			
			<div class="panel panel-default">
					<div class="panel-heading">DETALLE DE BOLETA</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" id="id_btnAgregar" class="btn btn-primary">AGREGA PRODUCTO</button>
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary">REGISTRA BOLETA</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table_boleta" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Cantidad</th>
												<th>Subtotal</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="id_table_boleta_body">
												
										</tbody>
										
									</table>
								</div>
							</div>
					</div>
				</div>


<!-- El formulario de busqueda de Cliente (Modal) -->

  	 <div class="modal fade" id="idBuscaCliente" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Cliente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Cliente 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtCliente" class="form-control" name="cliente" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_cliente" class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 40%">Nombre</th>
																<th style="width: 35%">Apellido</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
			                        </div>
		                    </div>
					</div>
			</div>
			</div>
		</div>

<!-- El formulario de busqueda de Producto (Modal) -->

  	 <div class="modal fade" id="idBuscaProducto" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Producto 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtProducto" class="form-control" name="producto" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_producto" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 45%">Nombre</th>
																<th style="width: 15%">Precio</th>
																<th style="width: 15%">Stock</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
		                        </div>
		                    </div>
				</div>
			</div>
			</div>
		</div>
		
		
	<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 20px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					
			    </div>
			</div>
			</div>
		</div>
		
</form>
</div>
<script type="text/javascript">

	$(document).ready(function() {

		//Se a�ade los clientes a la tabla
		$.getJSON("listaSeleccion",{}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idProducto +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");                     
			});
		});
		
	});

	//Al pulsar el bot�n cliente
	$("#id_btnCliente").click(function (){
		muestraCliente();
		$("#idBuscaCliente").modal("show");
	});

	//Al pulsar el bot�n producto
	$("#id_btnProducto").click(function (){
		muestraProducto();
		$("#idBuscaProducto").modal("show");
	});
	
	//Al escribir en la caja de texto del cliente
	$("#id_txtCliente").keyup( function (e){
		muestraCliente();
	});
	
	//Al escribir en la caja de texto del cliente
	$("#id_txtProducto").keyup( function (e){
		muestraProducto();
	});
	
	//Se anula el enter
	$(document).on("keypress", "form", function(event) { 
	    return event.keyCode != 13;
	});

	
	//Al pulsar el bot�n agregar
	$("#id_btnAgregar").click(function (){
		var var_pro = $("#id_producto_id").val();
		var var_can = $("#id_producto_cantidad").val();
		var var_stk = $("#id_producto_stock").val();
		
		//Validar duplicados
		var yaExiste = false;
		$("#id_table_boleta_body tr").each(function() {
			if($(this).find('td:eq(0)').html() == var_pro){
				yaExiste = true;
			}
		});
		
		if ( var_pro == '-1' ){
			$("#idMensajeTexto").text("Seleccione un Producto");
			$("#idMensaje").modal("show");
		}else if ( var_can == '' ){
			$("#idMensajeTexto").text("Agrege una cantidad");
			$("#idMensaje").modal("show");
		}else if ( $.isNumeric( var_can ) == false ){
			$("#idMensajeTexto").text("La cantidad debe ser n�merico");
			$("#idMensaje").modal("show");
		}else if (parseInt(var_can) <= 0 ){
			$("#idMensajeTexto").text("La cantidad debe ser postivo");
			$("#idMensaje").modal("show");
		}else if (parseInt(var_can)> parseInt(var_stk)){
			$("#idMensajeTexto").text("La cantidad no puede ser superior al Stock");
			$("#idMensaje").modal("show");
		}else if (yaExiste){
			$("#idMensajeTexto").text("Existe el producto elegido");
			$("#idMensaje").modal("show");
		}else{
			
			var var_nom = $("#id_producto_nombre").val();
			var var_pre = $("#id_producto_precio").val();
					
			//limpiar la tabla
			$("#id_table_boleta_body").empty();
				
			//Se a�ade los clientes a la tabla
			$.getJSON("agregarSeleccion",{"idProducto":var_pro,"nombre":var_nom,"precio":var_pre,"cantidad":var_can}, function (data){
				$.each(data, function(index, item){
					$('#id_table_boleta_body').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idProducto +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
				});
			});
				
			//limpia las cajas de texto
			$("#id_producto_id").val("-1");
			$("#id_producto_nombre").val("");
			$("#id_producto_precio").val("");
			$("#id_producto_stock").val("");
			$("#id_producto_cantidad").val("");
		}
	});
	
	
	//Al pulsar el bot�n agregar
	$("#id_btnRegistrar").click(function (){
		var var_cli = $("#id_cliente_id").val();
		var var_ape = $("#id_cliente_apellido").val();
		var var_nom = $("#id_cliente_nombre").val();
		var var_nom_com = var_ape + ' ' + var_nom;
		
		var var_count = 0;
		$("#id_table_boleta_body tr").each(function() {
			var_count = var_count + 1;
		});
		
		if (var_cli == "-1"){
			$("#idMensajeTexto").text("Seleccione un cliente");
			$("#idMensaje").modal("show");
		}else if (var_count < 1){
			$("#idMensajeTexto").text("Seleccione un producto");
			$("#idMensaje").modal("show");
		}else{
			$.getJSON("registra",{"cliente.idCliente":var_cli,"cliente.nombre":var_nom_com}, function (data){
				console.log(data.texto);
				$("#idMensajeTexto").html(data.texto);
				$("#idMensaje").modal("show");
				$("#id_table_boleta_body").empty();
				$("#id_cliente_id").val("-1");
				$("#id_cliente_nombre").val("");
				$("#id_cliente_apellido").val("");
			});
		}
	});
	
	
	function muestraCliente(){
		var var_cliente = $("#id_txtCliente").val();

		//limpiar la tabla
		$("#id_table_cliente tbody").empty();
		
		//Se a�ade los clientes a la tabla
		$.getJSON("cargaCliente",{"filtro":var_cliente}, function (data){
			$.each(data, function(index, item){
				$('#id_table_cliente').append("<tr><td>" +item.idCliente + "</td><td>" +item.nombre + "</td><td>" +item.apellido + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_cliente('"+ item.idCliente+"','"+ item.nombre+"','"+ item.apellido+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}

	function muestraProducto(){
		var var_producto = $("#id_txtProducto").val();

		//limpiar la tabla
		$("#id_table_producto tbody").empty();
		
		//Se a�ade los clientes a la tabla
		$.getJSON("cargaProducto",{"filtro":var_producto}, function (data){
			$.each(data, function(index, item){
				$('#id_table_producto').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.stock + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_producto('"+ item.idProducto+"','"+ item.nombre+"','"+ item.precio+"','"+ item.stock+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}

	//Al pulsar selecciona cliente
	function f_seleccione_cliente(id,nombre,apellido){
		$("#id_cliente_id").val(id);
		$("#id_cliente_nombre").val(nombre);
		$("#id_cliente_apellido").val(apellido);
		$("#idBuscaCliente").modal("hide");
	}
	
	//Al pulsar selecciona producto
	function f_seleccione_producto(id,nombre,precio,stock){
		$("#id_producto_id").val(id);
		$("#id_producto_nombre").val(nombre);
		$("#id_producto_precio").val(precio);
		$("#id_producto_stock").val(stock);
		$("#idBuscaProducto").modal("hide");
	}
	
	//Al pulsar el bot�n eliminar
	function f_elimina_seleccion(id){	
		//limpiar la tabla
		$("#id_table_boleta_body").empty();
			
		//Se a�ade los clientes a la tabla
		$.getJSON("eliminaSeleccion",{"idProducto":id}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idProducto + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idProducto +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
			});
		});

		//limpia las cajas de texto
		$("#id_producto_id").val("-1");
		$("#id_producto_nombre").val("");
		$("#id_producto_precio").val("");
		$("#id_producto_stock").val("");
		$("#id_producto_cantidad").val("");
	}
		
	//Solo numeros en caja de texto
	function validarSoloNumerosEnteros(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla == 8)	return true; // 3
		patron = /[0-9]/;// Solo acepta n�meros
		te = String.fromCharCode(tecla); // 5
		return patron.test(te); // 6
	}
	

	
</script>
</body>
</html>



