<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Procesar Respuesta</title>
    <!-- Estilos personalizados -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 50px auto;
            max-width: 800px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .alert {
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }
        .page-title {
            background-color: #007bff;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        .breadcrumb {
            background: none;
            padding: 0;
            margin: 0;
            list-style: none;
            text-align: center;
        }
        .breadcrumb li {
            display: inline;
            margin: 0 5px;
        }
        .breadcrumb a {
            color: #f8f9fa;
            text-decoration: none;
        }
        .breadcrumb .active {
            color: #ffc107;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .mt-30 {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<section class="page-title">
    <h2>Procesar Respuesta</h2>
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Procesar Respuesta</li>
    </ol>
</section>

<div class="container">
    <h3 style="text-align: center; text-transform: uppercase;">Resultado de la Operación</h3>

    <%
        // Capturar datos del formulario
        String reporteId = request.getParameter("reporteId");
        String mensaje = request.getParameter("mensaje");
        String fechaRespuesta = request.getParameter("fechaRespuesta");
        String estado = request.getParameter("estado");

        if (reporteId != null && mensaje != null && fechaRespuesta != null && estado != null) {
            try {
                // Cargar el driver de MySQL
                Class.forName("com.mysql.jdbc.Driver");

                // Conectar a la base de datos
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

                // Crear el statement para insertar datos
                String sql = "INSERT INTO respuesta (reporteId, mensaje, fechaRespuesta, estado) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = conexion.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(reporteId));
                ps.setString(2, mensaje);
                ps.setDate(3, Date.valueOf(fechaRespuesta)); // Convertir fecha
                ps.setString(4, estado);

                int filasAfectadas = ps.executeUpdate();

                if (filasAfectadas > 0) {
    %>
                    <div class="alert alert-success">
                        <strong>¡Éxito!</strong> Respuesta enviada correctamente.
                    </div>
    <%
                } else {
    %>
                    <div class="alert alert-error">
                        <strong>Error:</strong> No se pudo enviar la respuesta.
                    </div>
    <%
                }
                ps.close();
                conexion.close();
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <div class="alert alert-error">
                    <strong>Error:</strong> <%= e.getMessage() %>
                </div>
    <%
            }
        } else {
    %>
            <div class="alert alert-warning">
                <strong>Advertencia:</strong> Todos los campos son obligatorios.
            </div>
    <%
        }
    %>

    <div class="text-center mt-30">
        <a href="dashboardmanager.jsp" class="btn">Volver</a>
    </div>
</div>
</body>
</html>
