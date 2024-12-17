<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
    <style>
/* Estilos generales */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7f6;
    margin: 0;
    padding: 20px;
}

.perfil-container {
    background-color: white;
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
    max-width: 600px;
    margin: auto;
}

h2 {
    color: #6a11cb;
    text-align: center;
    margin-bottom: 20px;
}

h2::after {
    content: '';
    display: block;
    width: 80px;
    height: 4px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    margin: 10px auto;
    border-radius: 2px;
}

.form-container {
    margin-bottom: 20px;
    text-align: center;
}

.form-container label {
    font-weight: bold;
    color: #333;
    display: block;
    margin-bottom: 10px;
}

.form-container input[type="email"] {
    padding: 10px;
    width: 250px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    transition: all 0.3s ease;
}

.form-container input[type="email"]:focus {
    border-color: #6a11cb;
    box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
    outline: none;
}

.form-container button {
    padding: 12px 20px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    transition: all 0.3s ease;
}

.form-container button:hover {
    background: linear-gradient(135deg, #2575fc, #6a11cb);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(106, 17, 203, 0.3);
}

.user-info {
    margin-top: 20px;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    border: 1px solid #e9ecef;
}

.user-info h3 {
    color: #6a11cb;
    border-bottom: 2px solid #6a11cb;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

.user-info p {
    margin: 10px 0;
    padding: 8px;
    background-color: #fff;
    border-radius: 4px;
}

.alert {
    text-align: center;
    margin-top: 20px;
    padding: 15px;
    border-radius: 8px;
    font-size: 16px;
    background: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.exit-container {
    text-align: center;
    margin-top: 20px;
}

.btn-salir {
    display: inline-block;
    padding: 10px 20px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    text-transform: uppercase;
    transition: all 0.3s ease;
}

.btn-salir:hover {
    background: linear-gradient(135deg, #2575fc, #6a11cb);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(106, 17, 203, 0.3);
}

.btn-salir i {
    margin-right: 8px;
}
    </style>
</head>
<body>

    <!-- Formulario para consultar los datos por correo electrónico -->
    <div class="perfil-container">
        <h2>Consultar Perfil</h2>
        <div class="form-container">
            <form method="get">
                <label for="email">Ingrese su correo electrónico:</label>
                <input type="email" id="email" name="email" required>
                <button type="submit">Consultar</button>
            </form>
        </div>

<%
    String email = request.getParameter("email");
    String mensajeError = "";
    String id = "";
    String nombre = "";
    String contrasena = "";
    
    if (email != null && !email.isEmpty()) {
        Connection conexion = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        
        try {
            // Conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/sistemacontrolequipos"; 
            String usuario = "edu21"; 
            String contrasenaDB = "87654321"; 
            conexion = DriverManager.getConnection(url, usuario, contrasenaDB);

            // Consulta SQL para obtener los datos del usuario por correo electrónico
            String consulta = "SELECT * FROM usuario WHERE email = ?";
            st = conexion.prepareStatement(consulta);
            st.setString(1, email);

            // Ejecutar la consulta
            rs = st.executeQuery();
            
            if (rs.next()) {
                id = String.valueOf(rs.getInt("id"));
                nombre = rs.getString("nombre");
                contrasena = rs.getString("contraseña");  // Corregido aquí
            } else {
                mensajeError = "No se encontró un usuario con ese correo electrónico.";
            }
        } catch (SQLException e) {
            mensajeError = "Error al consultar los datos: " + e.getMessage();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (st != null) try { st.close(); } catch (SQLException e) {}
            if (conexion != null) try { conexion.close(); } catch (SQLException e) {}
        }
    } else {
        mensajeError = "Por favor, ingrese un correo electrónico.";
    }
    
    // Mostrar mensaje de error si ocurre alguno
    if (!mensajeError.isEmpty()) {
%>
        <div class="alert"><%= mensajeError %></div>
<%
    } else if (!id.isEmpty()) {
%>
        <!-- Mostrar los datos del usuario -->
        <div class="user-info">
            <h3>Datos de Perfil</h3>
            <p><strong>ID:</strong> <%= id %></p>
            <p><strong>Nombre:</strong> <%= nombre %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Contraseña:</strong> <%= contrasena %></p> <!-- Corregido aquí -->
        </div>
<%
    }
%>
    </div><br><br>
    
    
      <div class="exit-container">
        <a href="dashboarduser.jsp" class="btn-salir">
            <i class="fas fa-sign-out-alt"></i> Salir
        </a>
    </div>

</body>
</html>
