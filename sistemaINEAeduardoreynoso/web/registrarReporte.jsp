<%-- 
    Document   : registrarReporte
    Created on : 1/12/2024, 09:45:03 PM
    Author     : cantt
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>


<%@include file="conexion.jsp"%>

<%
    // Recuperar el usuario desde la sesión
    String usuario = (String) session.getAttribute("usuario");

    if (usuario == null || usuario.isEmpty()) {
        response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en la sesión
        return;
    }

    // Recuperar los datos del formulario
    String tipoEquipo = request.getParameter("tipoEquipo");
    String marca = request.getParameter("marca");
    String modelo = request.getParameter("modelo");
    String numeroSerie = request.getParameter("numeroSerie");
    String area = request.getParameter("area");
    String descripcion = request.getParameter("descripcion");
    String titulo = request.getParameter("titulo");

    // Validación de los campos requeridos
    if (area == null || area.isEmpty()) {
        out.println("<h3>Error: El campo 'Área' es obligatorio.</h3>");
        return; // Detener ejecución
    }
    if (descripcion == null || descripcion.isEmpty()) {
        out.println("<h3>Error: El campo 'Descripción' es obligatorio.</h3>");
        return;
    }
    if (titulo == null || titulo.isEmpty()) {
        out.println("<h3>Error: El campo 'Título' es obligatorio.</h3>");
        return;
    }

    // Consulta SQL para insertar el reporte
    String sql = "INSERT INTO Reporte (fechaRegistro, area, usuarioId, equipoId, descripcion, titulo) " +
                 "VALUES (?, ?, (SELECT id FROM Usuario WHERE email = ?), (SELECT id FROM Equipo WHERE numeroSerie = ?), ?, ?)";

    try {
        // Usando conexión previamente configurada
        PreparedStatement pst = conexion.prepareStatement(sql); 
        pst.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now())); // Fecha actual
        pst.setString(2, area);
        pst.setString(3, usuario); // Email del usuario
        pst.setString(4, numeroSerie); // Número de serie del equipo
        pst.setString(5, descripcion);
        pst.setString(6, titulo);

        int result = pst.executeUpdate();
        if (result > 0) {
%>
            <h3>Reporte registrado con éxito!</h3>
            <script>
                setTimeout(function () {
                    window.location.href = "dashboarduser.jsp"; // Redirigir al panel del usuario
                }, 3000); // Redirige después de 3 segundos
            </script>
<%
        } else {
%>
            <h3>Error al registrar el reporte.</h3>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
%>
        <h3>Error de base de datos: <%= e.getMessage() %></h3>
<%
    }
%>

