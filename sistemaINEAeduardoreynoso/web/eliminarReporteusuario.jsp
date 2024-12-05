<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Reporte</title>
    <style>
        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #6a11cb;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        }

        p {
            font-size: 16px;
            color: #333;
            margin: 20px 0;
        }

        /* Mensajes de éxito y error */
        .success-message {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .error-message {
            background: linear-gradient(135deg, #ff5f6d 0%, #ff4185 100%);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* Botón de retorno */
        a.return-btn {
            display: inline-block;
            padding: 12px 25px;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
        }

        a.return-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Eliminar Reporte</h2>
        <%
            String id = request.getParameter("id");
            if (id != null) {
                try {
                    // Cargar el driver de MySQL
                    Class.forName("com.mysql.jdbc.Driver");

                    // Conexión a la base de datos
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

                    // Preparar la consulta para eliminar el reporte
                    PreparedStatement ps = conexion.prepareStatement("DELETE FROM Reporte WHERE id = ?");
                    ps.setInt(1, Integer.parseInt(id));

                    // Ejecutar la consulta
                    int filasAfectadas = ps.executeUpdate();

                    if (filasAfectadas > 0) {
                        out.print("<div class='success-message'>Reporte eliminado correctamente.</div>");
                    } else {
                        out.print("<div class='error-message'>No se encontró el reporte con el ID proporcionado.</div>");
                    }

                    // Cerrar recursos
                    ps.close();
                    conexion.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                }
            } else {
                out.print("<div class='error-message'>No se proporcionó un ID válido.</div>");
            }
        %>
        <a href="dashboardmanager.jsp" class="return-btn">Volver al Inicio</a>
    </div>
</body>
</html>
