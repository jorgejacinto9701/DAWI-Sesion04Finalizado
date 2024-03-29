<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Ubigeo - Sede Norte - Jorge Jacinto</title>
</head>
<body>

<div class="container">
<h1>Ubigeo</h1>
	
		
	<form action="registraCompu" id="id_form">
		<div style="width: 20%"> 
			<div class="form-group">
				<label class="control-label" for="id_departamento">DEPARTAMENTO</label>
				<select id="id_departamento" name="" class='form-control' >
					<option value=" ">[Seleccione Departamento]</option>    
				</select>
		    </div>
		   	<div class="form-group">
				<label class="control-label" for="id_provincia">PROVINCIA</label>
				<select id="id_provincia" name="" class='form-control'>
					<option value=" ">[Seleccione Provincia]</option>    
				</select>
		    </div>
		   <div class="form-group">
				<label class="control-label" for="id_distrito">DISTRITO</label>
				<select id="id_distrito" name="" class='form-control'>
					<option value=" ">[Seleccione Distrito]</option>    
				</select>
		    </div>
		</div>
	</form>
</div>

<script type="text/javascript">
	$.getJSON("listaDepartamentos", {}, function(data){ 
		$.each(data, function(i, item){
			$("#id_departamento").append("<option value='"+ item +"'>"+ item +"</option>"); 
		});
	});

	$("#id_departamento").change(function(){
		var val_dep = $("#id_departamento").val();

		$("#id_provincia").empty();
		$("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

		$("#id_distrito").empty();
		$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

		$.getJSON("listaProvincias", {"departamento":val_dep}, function(data){ 
			$.each(data, function(i, item){
				$("#id_provincia").append("<option value='"+ item +"'>"+ item +"</option>"); 
			});
		});
		
	 });

	$("#id_provincia").change(function(){
		var val_dep = $("#id_departamento").val();
		var val_pro = $("#id_provincia").val();

		$("#id_distrito").empty();
		$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
		
		$.getJSON("listaDistritos", {"departamento":val_dep,"provincia":val_pro}, function(data){ 
			$.each(data, function(i, item){
				$("#id_distrito").append("<option value='"+ item.idUbigeo +"'>"+ item.distrito +"</option>"); 
			});
		});
		
	 });
	 

</script>	

</body>
</html>




