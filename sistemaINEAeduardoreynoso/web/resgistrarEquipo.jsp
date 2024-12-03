<%-- 
    Document   : resgistrarEquipo
    Created on : 2/12/2024, 06:16:37 PM
    Author     : cantt
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrar Equipo</title>
    <style>
        body {
            font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
        }

        h1.title {
            text-align: center;
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn-primary {
            display: block;
            width: 100%;
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        .alert-success, .alert-error {
            text-align: center;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .alert-success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }

        .alert-error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
        
        
        
                       .rectangular-button {
            background-color: black;
            color: white;
            border: none;
            width: 170px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-family: Arial, sans-serif;
        }

        .rectangular-button svg {
            width: 24px;
            height: 24px;
            stroke: white;
            stroke-width: 2;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <%
        String usuario = (String) session.getAttribute("usuario");

        if (usuario == null || usuario.isEmpty()) {
            response.sendRedirect("login.jsp");
        }

        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
            String fechaRegistro = request.getParameter("fechaRegistro");
            String estado = request.getParameter("estado");
            String area = request.getParameter("area");
            String usuarioIdStr = request.getParameter("usuarioId");
            String tipoEquipo = request.getParameter("tipoEquipo");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String numeroSerie = request.getParameter("numeroSerie");
            String fechaUltimaActualizacion = request.getParameter("fechaUltimaActualizacion");

            if (fechaRegistro == null || fechaRegistro.isEmpty() ||
                estado == null || estado.isEmpty() ||
                area == null || area.isEmpty() ||
                usuarioIdStr == null || usuarioIdStr.isEmpty() ||
                tipoEquipo == null || tipoEquipo.isEmpty() ||
                marca == null || marca.isEmpty() ||
                modelo == null || modelo.isEmpty() ||
                numeroSerie == null || numeroSerie.isEmpty() ||
                fechaUltimaActualizacion == null || fechaUltimaActualizacion.isEmpty()) {
    %>
        <div class="container">
            <div class="alert-error">Error: Todos los campos son obligatorios.</div>
            <a href="resgistrarEquipo.jsp" class="btn-primary">Volver al formulario</a>
        </div>
    <%
                return;
            }

            int usuarioId = 0;
            try {
                usuarioId = Integer.parseInt(usuarioIdStr);
            } catch (NumberFormatException e) {
    %>
        <div class="container">
            <div class="alert-error">Error: El campo 'ID de Usuario' debe ser un número entero.</div>
            <a href="resgistrarEquipo.jsp" class="btn-primary">Volver al formulario</a>
        </div>
    <%
                return;
            }

            PreparedStatement statement = null;
            try {
                String sql = "INSERT INTO Equipo (fechaRegistro, estado, area, usuarioId, tipoEquipo, marca, modelo, numeroSerie, fechaUltimaActualizacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                statement = conexion.prepareStatement(sql);
                statement.setString(1, fechaRegistro);
                statement.setString(2, estado);
                statement.setString(3, area);
                statement.setInt(4, usuarioId);
                statement.setString(5, tipoEquipo);
                statement.setString(6, marca);
                statement.setString(7, modelo);
                statement.setString(8, numeroSerie);
                statement.setString(9, fechaUltimaActualizacion);

                int filasAfectadas = statement.executeUpdate();

                if (filasAfectadas > 0) {
    %>
        <div class="container">
            <div class="alert-success">Equipo registrado correctamente.</div>
            
            <a href="dashboarduser.jsp" class="btn-primary" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Salir</a>
        </div>
    <%
                } else {
    %>
        <div class="container">
            <div class="alert-error">Error al registrar el equipo.</div>
            <a href="resgistrarEquipo.jsp" class="btn-primary" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Volver al formulario</a>
        </div>
    <%
                }
            } catch (SQLException e) {
    %>
        <div class="container">
            <div class="alert-error">Error SQL: <%= e.getMessage() %></div>
            <a href="resgistrarEquipo.jsp" class="btn-primary">Volver al formulario</a>
        </div>
    <%
            }
        } else {
    %>
    <div class="container">
        <h1 class="title">Registrar Equipo</h1>
        <form method="POST" action="resgistrarEquipo.jsp">
            <input type="hidden" name="submit" value="true">
            <label for="fechaRegistro">Fecha de Registro:</label>
            <input type="date" id="fechaRegistro" name="fechaRegistro" required>
            <label for="estado">Estado:</label>
            <input type="text" id="estado" name="estado" required>
            <label for="area">Área:</label>
            <input type="text" id="area" name="area" required>
            <label for="usuarioId">ID de Usuario:</label>
            <input type="number" id="usuarioId" name="usuarioId" required>
            <label for="tipoEquipo">Tipo de Equipo:</label>
            <input type="text" id="tipoEquipo" name="tipoEquipo" required>
            <label for="marca">Marca:</label>
            <input type="text" id="marca" name="marca" required>
            <label for="modelo">Modelo:</label>
            <input type="text" id="modelo" name="modelo" required>
            <label for="numeroSerie">Número de Serie:</label>
            <input type="text" id="numeroSerie" name="numeroSerie" required>
            <label for="fechaUltimaActualizacion">Fecha de Última Actualización:</label>
            <input type="date" id="fechaUltimaActualizacion" name="fechaUltimaActualizacion" required>
            <button type="submit" class="btn-primary">Guardar y Enviar</button><br><br>
            <center>
             <button class="rectangular-button" onclick="window.location.href='dashboarduser.jsp'">
                 
                 Regresar
        
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>
    </button>
        </form>
    </div>
    
        </center>
    <%
        }
    %>
</body>
</html>
