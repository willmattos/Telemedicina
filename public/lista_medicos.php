<?php
    if(isset($_GET['especialidad'])){
        $cadena_conexion = 'mysql:dbname=telemedicina;host=127.0.0.1';
        $usuario = 'root';
        $clave = '';
        try {
            $bd = new PDO($cadena_conexion, $usuario, $clave);
            $sql = "select *  from medicos where especialidad = "+$_GET['especialidad'];
            $resul = $bd->query($sql);
            
            echo json_encode(iterator_to_array($resul));
        } catch (PDOException $e) {
            return false;
        }    

    }