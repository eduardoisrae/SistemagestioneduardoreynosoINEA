<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Usuario</title>
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

        p {
            color: #333;
            margin-bottom: 15px;
        }

        /* Botones */
        button {
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

        button:hover {
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
        
        
        
        
        
        /* Estilos generales del formulario */
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Estilos para los campos de texto */
input[type="text"],
input[type="email"] {
    width: 100%;
    padding: 12px;
    margin: 0;
    border: 2px solid #ccc;
    border-radius: 8px;
    font-size: 16px;
    box-sizing: border-box;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus {
    border-color: #6a11cb;
    outline: none;
}

/* Estilos para los labels */
label {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}

/* Estilos para el botón */
button[type="submit"] {
    padding: 12px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-transform: uppercase;
    font-weight: 600;
}

button[type="submit"]:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String nombre = "";
    String email = "";
    
    // Si se proporciona un ID, se obtiene la información del usuario
    if (id != null) {
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.jdbc.Driver");

            // Conexión a la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

            // Consulta SQL para obtener el usuario por ID
            ps = conexion.prepareStatement("SELECT nombre, email FROM Usuario WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();

            // Si el usuario existe, se cargan los datos
            if (rs.next()) {
                nombre = rs.getString("nombre");
                email = rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!-- Formulario de edición -->
<div class="container">
    <h2>Editar Usuario</h2>
    <form method="POST" action="modificarUsuario.jsp">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<%= nombre %>" required>

        <label for="email">Correo Electrónico:</label>
        <input type="email" name="email" value="<%= email %>" required>

        <button type="submit">Modificar Usuario</button>
    </form>
</div>

</body>
</html>
