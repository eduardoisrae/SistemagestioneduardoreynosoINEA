<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Usuario</title>
    <style>
        body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7f6;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    padding: 20px;
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

.user-details {
    background-color: #f9f9f9;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
}

.user-details p {
    margin: 10px 0;
    color: #333;
}

.action-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.dashboard-btn, .secondary-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 12px 25px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
}

.dashboard-btn {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
}

.secondary-btn {
    background: #f1f3f5;
    color: #6a11cb;
    border: 1px solid #6a11cb;
}

.dashboard-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

.secondary-btn:hover {
    background: #f8f9fa;
}

@media (max-width: 600px) {
    .container {
        padding: 20px;
        margin: 0 10px;
    }
    
    .action-buttons {
        flex-direction: column;
        gap: 10px;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <%
            String id = request.getParameter("id");

            if (id != null && !id.isEmpty()) {
                Connection conexion = null;
                PreparedStatement ps = null;

                try {
                    // Cargar el driver de MySQL
                    Class.forName("com.mysql.jdbc.Driver");

                    // Conexión a la base de datos
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

                    // Consulta SQL para eliminar al usuario
                    ps = conexion.prepareStatement("DELETE FROM Usuario WHERE id = ?");
                    ps.setInt(1, Integer.parseInt(id));
                    int filasAfectadas = ps.executeUpdate();

                    if (filasAfectadas > 0) {
        %>
                        <h2>Usuario Eliminado</h2>
                        <div class="success-message">
                            El usuario con ID <%=id%> ha sido eliminado exitosamente.
                        </div>
                         <div class="action-buttons">
                    <center><a href="dashboardmanager.jsp" class="dashboard-btn">Ir al Dashboard</a></center>
                    
                </div>
        <%
                    } else {
        %>
                        <h2>Error</h2>
                        <div class="error-message">
                            No se encontró ningún usuario con el ID proporcionado.
                        </div>
                        <a href="index.jsp" class="return-btn">Volver</a>
        <%
                    }
                } catch (SQLException e) {
        %>
                    <h2>Error al procesar la solicitud</h2>
                    <div class="error-message">
                        <%=e.getMessage()%>
                    </div>
                    <a href="index.jsp" class="return-btn">Volver</a>
        <%
                } finally {
                    try {
                        if (ps != null) ps.close();
                        if (conexion != null) conexion.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
        %>
                <h2>ID no proporcionado</h2>
                <div class="error-message">
                    No se ha especificado un ID para eliminar al usuario.
                </div>
                <a href="index.jsp" class="return-btn">Volver</a>
        <%
            }
        %>
    </div>
</body>
</html>
