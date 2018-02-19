<%-- 
    Document   : registrarse
    Created on : 19-feb-2018, 18:36:00
    Author     : Adhuna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Régistrate</h1>
        <form action="Controller?opID=NuevoCliente" method="POST">
        <h4><b>Informacion personal</b></h4>
        <label for="DNI">DNI: </label>
        <input type="text" name="DNi" id="DNI" value="" /><br>
        <label for="Nombre">Nombre: </label>
        <input type="text" name="Nombre" id="Nombre" value="" /><br>
        <label for="Nombre">Primer Apellido: </label>
        <input type="text" name="Ape1" id="Ape1" value="" /><br>
        <label for="Nombre">Segundo Apellido: </label>
        <input type="text" name="Ape2" id="Ape2" value="" /><br><br>

        <h4><b>Datos de acceso</b></h4>
        <label for="Nombre">Nick: </label>
        <input type="text" name="Nick" id="Nick" value="" /><br>
        <label for="Nombre">Password: </label>
        <input type="text" name="Passwd" id="Passwd" value="" /><br>

        <input type="submit" name="" value="Registrarse">
        </form>
    </body>
</html>
