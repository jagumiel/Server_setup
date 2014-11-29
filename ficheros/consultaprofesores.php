<?php include 'datosBD.php' ?>
<html>
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="content-type">
		<title>Consulta Profesores</title>
	</head>
	<body>
<?php 
	$cxn = new mysqli("127.0.0.1",$mysqluser,$mysqlpass,"web");
	$res = $cxn->query("select nombre,apellidos from profesores");
	$c=1;
	while ($row = $res->fetch_array(MYSQLI_ASSOC)) {
		echo $c.' '.$row[nombre].' '.$row[apellidos];
		echo '<br>';
		$c++;  
	}
?>
	</body>
</html>
