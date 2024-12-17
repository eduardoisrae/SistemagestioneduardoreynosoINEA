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
    <title>Vista Mensajes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Estilos generales */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7f6;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
}

.respuesta-container {
    background-color: white;
    padding: 20px;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
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

table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    color: #6a11cb;
}

.form-container {
    margin-bottom: 20px;
    text-align: center;
}

.form-container label {
    font-weight: bold;
    color: #333;
}

.form-container input[type="text"] {
    padding: 10px;
    margin-right: 10px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    transition: all 0.3s ease;
}

.form-container input[type="text"]:focus {
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

.delete-btn {
    color: red;
    cursor: pointer;
    border: none;
    background: none;
    transition: color 0.3s ease;
}

.delete-btn:hover {
    color: #dc3545;
}

.alert {
    text-align: center;
    margin-top: 20px;
    padding: 15px;
    border-radius: 8px;
    font-size: 16px;
}

.alert.success {
    background: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert.error {
    background: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}
    </style>
</head>
<body>

    <!-- Formulario para ingresar el correo electrónico -->
    <div class="form-container">
        <form method="get">
            <label for="email">Ingrese el Correo Electrónico:</label>
            <input type="text" id="email" name="email" required>
            <button type="submit">Consultar</button>
        </form>
    </div>

<%
    String email = request.getParameter("email");
    String mensajeExito = "";
    String mensajeError = "";
    
    // Eliminar el registro
    String idEliminar = request.getParameter("idEliminar");
    if (idEliminar != null) {
        Connection conexion = null;
        PreparedStatement st = null;
        
        try {
            // Conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/sistemacontrolequipos"; 
            String usuario = "edu21"; 
            String contrasena = "87654321"; 
            conexion = DriverManager.getConnection(url, usuario, contrasena);

            // Eliminar la respuesta
            String consultaEliminar = "DELETE FROM respuesta WHERE id = ?";
            st = conexion.prepareStatement(consultaEliminar);
            st.setString(1, idEliminar);
            st.executeUpdate();

            mensajeExito = "Respuesta eliminada correctamente.";

        } catch (SQLException e) {
            mensajeError = "Error al eliminar la respuesta: " + e.getMessage();
        } finally {
            if (st != null) try { st.close(); } catch (SQLException e) {}
            if (conexion != null) try { conexion.close(); } catch (SQLException e) {}
        }
    }

    if (email != null && !email.isEmpty()) {
        Connection conexion = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        
        try {
            // Conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/sistemacontrolequipos"; 
            String usuario = "edu21"; 
            String contrasena = "87654321"; 
            conexion = DriverManager.getConnection(url, usuario, contrasena);

            // Consulta SQL para obtener las respuestas según el correo electrónico
            String consulta = "SELECT * FROM respuesta WHERE estado = ?";
            st = conexion.prepareStatement(consulta);
            st.setString(1, email);

            // Ejecutar la consulta
            rs = st.executeQuery();
            
            if (rs.next()) {
%>
                <div class="respuesta-container">
                    <h2>Respuestas de Usuario con Correo: <%= email %></h2>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Reporte ID</th>
                            <th>Mensaje</th>
                            <th>Fecha</th>
                            <th>Acción</th>
                        </tr>
<%
                // Mostrar las respuestas en una tabla
                do {
%>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getInt("reporteId") %></td>
                            <td><%= rs.getString("Mensaje") %></td>
                            <td><%= rs.getString("fecharespuesta") %></td>
                            <td>
                                <!-- Botón de eliminación -->
                                <form action="" method="get" style="display:inline;">
                                    <input type="hidden" name="idEliminar" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="delete-btn" title="Eliminar">
                                        <i class="fas fa-trash-alt"></i> <!-- Icono de basura -->
                                    </button>
                                </form>
                            </td>
                        </tr>
<%
                } while (rs.next());
%>
                    </table>
                </div>
<%
            } else {
                mensajeError = "No se encontraron respuestas para este correo electrónico.";
            }
        } catch (SQLException e) {
            mensajeError = "Error al obtener las respuestas: " + e.getMessage();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (st != null) try { st.close(); } catch (SQLException e) {}
            if (conexion != null) try { conexion.close(); } catch (SQLException e) {}
        }
    } else {
        mensajeError = "El parámetro 'email' no se ha proporcionado o está vacío.";
    }
    
    // Mostrar mensaje de éxito o error
    if (!mensajeExito.isEmpty()) {
%>
        <div class="alert" style="background-color: #d4edda; color: #155724;"><%= mensajeExito %></div>
<%
    }
    
    if (!mensajeError.isEmpty()) {
%>
        <div class="alert"><%= mensajeError %></div>
<%
    }
%>

<br><br><center>           
    <a href="dashboarduser.jsp" class="dashboard-btn">
        Salir
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
            <line x1="5" y1="12" x2="19" y2="12"></line>
            <polyline points="12 5 19 12 12 19"></polyline>
        </svg>
    </a>
</center>

</body>
</html>
