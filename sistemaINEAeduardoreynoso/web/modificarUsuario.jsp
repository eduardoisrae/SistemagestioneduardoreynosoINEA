<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Usuario</title>
    <style>
        /* Estilos Generales */
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
            box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
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

        /* Alerta de Éxito */
        .success-message {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-message::before {
            content: '✓';
            margin-right: 10px;
            font-size: 24px;
            opacity: 0.8;
        }

        /* Alerta de Error */
        .error-message {
            background: linear-gradient(135deg, #ff5f6d 0%, #ff4185 100%);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* Botón de Retorno */
        .return-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
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
            margin-top: 20px;
        }

        .return-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 0 10px;
            }
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String nuevoNombre = request.getParameter("nombre");
    String nuevoEmail = request.getParameter("email");
    String mensaje = "";
    String claseMensaje = "";
    
    // Si se envían datos desde el formulario, se actualizan en la base de datos
    if (id != null && nuevoNombre != null && nuevoEmail != null) {
        Connection conexion = null;
        PreparedStatement ps = null;

        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.jdbc.Driver");

            // Conexión a la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

            // Actualizar la información del usuario
            ps = conexion.prepareStatement("UPDATE Usuario SET nombre = ?, email = ? WHERE id = ?");
            ps.setString(1, nuevoNombre);
            ps.setString(2, nuevoEmail);
            ps.setInt(3, Integer.parseInt(id));

            int filasActualizadas = ps.executeUpdate();

            if (filasActualizadas > 0) {
                mensaje = "Usuario modificado exitosamente.";
                claseMensaje = "success-message";
            } else {
                mensaje = "Error al modificar el usuario. Inténtalo de nuevo.";
                claseMensaje = "error-message";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            mensaje = "Error al modificar el usuario. Inténtalo de nuevo.";
            claseMensaje = "error-message";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            mensaje = "Error al modificar el usuario. Inténtalo de nuevo.";
            claseMensaje = "error-message";
        } finally {
            try {
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!-- Contenedor -->
<div class="container">
    <h2>Resultado de la Modificación</h2>

    <% if (!mensaje.isEmpty()) { %>
        <div class="<%= claseMensaje %>">
            <%= mensaje %>
        </div>
    <% } %>

    <a href="dashboardmanager.jsp?id=<%= id %>" class="return-btn">Regresar</a>
</div>

</body>
</html>
