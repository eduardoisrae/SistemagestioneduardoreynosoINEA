<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Usuario</title>
    <style>
        /* Estilos de Registro de Usuario */
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
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean operacionExitosa = false;
        String mensajeResultado = "";

        if (nombre != null && email != null && password != null && 
            !nombre.trim().isEmpty() && !email.trim().isEmpty() && !password.trim().isEmpty()) {
            Connection conexion = null;
            PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");
                
                // Validación de correo electrónico
                String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
                if (!email.matches(emailRegex)) {
                    throw new IllegalArgumentException("Formato de correo electrónico inválido");
                }

                // Verificar si el correo ya existe
                PreparedStatement checkEmail = conexion.prepareStatement("SELECT COUNT(*) FROM Usuario WHERE email = ?");
                checkEmail.setString(1, email);
                ResultSet rs = checkEmail.executeQuery();
                
                if (rs.next() && rs.getInt(1) > 0) {
                    throw new SQLException("El correo electrónico ya está registrado");
                }

                // Inserción segura de usuario
                ps = conexion.prepareStatement("INSERT INTO Usuario (nombre, email, contraseña) VALUES (?, ?, ?)");
                ps.setString(1, nombre);
                ps.setString(2, email);
                
                // En un escenario real, deberías usar hashing de contraseña
                ps.setString(3, password); 
                
                int filasAfectadas = ps.executeUpdate();
                
                if (filasAfectadas > 0) {
                    operacionExitosa = true;
                    mensajeResultado = "Usuario agregado exitosamente";
                } else {
                    mensajeResultado = "No se pudo agregar el usuario";
                }

            } catch (SQLException e) {
                operacionExitosa = false;
                mensajeResultado = "Error al agregar el usuario: " + e.getMessage();
            } catch (IllegalArgumentException e) {
                operacionExitosa = false;
                mensajeResultado = e.getMessage();
            } catch (Exception e) {
                operacionExitosa = false;
                mensajeResultado = "Error inesperado: " + e.getMessage();
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conexion != null) conexion.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            operacionExitosa = false;
            mensajeResultado = "Faltan parámetros para agregar el usuario";
        }
        %>

        <div class="container">
            <h2><%= operacionExitosa ? "Éxito" : "Error" %></h2>
            
            <% if (operacionExitosa) { %>
                <div class="success-message">
                    <%= mensajeResultado %>
                </div>
                <div class="user-details">
                    <p><strong>Nombre:</strong> <%= nombre %></p>
                    <p><strong>Email:</strong> <%= email %></p>
                </div>
                <div class="action-buttons">
                    <center><a href="dashboardmanager.jsp" class="dashboard-btn">Ir al Dashboard</a></center>
                    
                </div>
            <% } else { %>
                <div class="error-message">
                    <%= mensajeResultado %>
                </div>
                <div class="action-buttons">
                    <a href="javascript:history.back()" class="dashboard-btn">Volver</a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>