<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Reporte</title>
    <style>
           body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .title {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        .alert {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
        }
        .alert.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert.error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert.warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }
        .button {
            display: block;
            width: 100%;
            text-align: center;
            margin: 10px 0;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #0056b3;
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
    <div class="container">
        <h1 class="title">Eliminar Reporte</h1>
        <%
            // Recuperar el ID del reporte a eliminar
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            // Recuperar el usuario desde la sesión
            String usuario = (String) session.getAttribute("usuario");

            if (usuario == null || usuario.isEmpty()) {
                response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en la sesión
            }

            PreparedStatement statement = null;

            try {
                // Preparar la consulta SQL para eliminar el reporte
                String sql = "DELETE FROM Reporte WHERE id=?";
                statement = conexion.prepareStatement(sql);
                statement.setInt(1, id);

                // Ejecutar la consulta
                int filasAfectadas = statement.executeUpdate();

                if (filasAfectadas > 0) {
                    out.println("<div class='alert success'>Reporte eliminado correctamente.</div>");
                } else {
                    out.println("<div class='alert error'>Error al eliminar el reporte.</div>");
                }
            } catch (SQLException e) {
                out.println("<div class='alert error'>Error SQL: " + e.getMessage() + "</div>");
            } catch (Exception e) {
                out.println("<div class='alert error'>Error general: " + e.getMessage() + "</div>");
            } finally {
                // Cerrar recursos
                if (statement != null) statement.close();
                if (conexion != null) conexion.close();
            }
        %>
             <center>
             <button class="rectangular-button" onclick="window.location.href='dashboarduser.jsp'">
                 
                 Salir
        
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>
    </button>
        </center>
    </div>
</body>
</html>