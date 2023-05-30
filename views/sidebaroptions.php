<?php

//1. Necesitamos saber qué NIVEL DE ACCESO tiene el usuario
//Revise controlador...
$permiso = $_SESSION['login']['nivelacceso'];

//2. Array con los permisos por cada NIVEL DE ACCESO
$opciones = [];

//ADM - SPV - AST
switch ($permiso){
  case "ADM":
    $opciones = [
      ["menu" => "Clientes", "url" => "index.php?view=clientes.php"],
      ["menu" => "Compras", "url" => "index.php?view=compras.php"],
      ["menu" => "Reportes", "url" => "index.php?view=reportes.php"],
      ["menu" => "Usuarios", "url" => "index.php?view=usuarios.php"],
      ["menu" => "Ventas", "url" => "index.php?view=ventas.php"]
    ];
  break;
  case "SPV":
    $opciones = [
      ["menu" => "Clientes", "url" => "index.php?view=clientes.php"],
      ["menu" => "Usuarios", "url" => "index.php?view=usuarios.php"],
      ["menu" => "Ventas", "url" => "index.php?view=ventas.php"]
    ];    
  break;
  case "AST":
    $opciones = [
      ["menu" => "Clientes", "url" => "index.php?view=clientes.php"],
      ["menu" => "Reportes", "url" => "index.php?view=reportes.php"]
    ];
  break;
}

//Renderizar los ítems del SIDEBAR
foreach($opciones as $item){
  echo "
    <li class='nav-item'>
      <a class='nav-link' href='{$item['url']}'>
          <i class='fas fa-fw fa-chart-area'></i>
          <span>{$item['menu']}</span></a>
    </li>
  ";
}