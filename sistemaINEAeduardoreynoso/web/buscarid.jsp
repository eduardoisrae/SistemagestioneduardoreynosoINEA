<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultado de la Búsqueda</title>
    <style>
        .container {
            margin: 50px auto;
            max-width: 400px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .result {
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
        }
        .error {
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Resultado de la Búsqueda</h3>

        <%
            // Obtener el nombre desde el formulario
            String nombre = request.getParameter("nombre");

            if (nombre != null && !nombre.isEmpty()) {
                try {
                    // Conectar a la base de datos
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");

                    // Consulta SQL para obtener el ID del usuario
                    String sql = "SELECT id FROM Usuario WHERE nombre = ?";
                    PreparedStatement ps = conexion.prepareStatement(sql);
                    ps.setString(1, nombre);

                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        // Si el usuario existe, mostrar el ID
                        int usuarioId = rs.getInt("id");
                        out.print("<div class='result'>El ID del Usuario es: " + usuarioId + "</div>");
                    } else {
                        // Si el usuario no existe
                        out.print("<div class='error'>No se encontró un usuario con el nombre: " + nombre + "</div>");
                    }

                    // Cerrar las conexiones
                    rs.close();
                    ps.close();
                    conexion.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("<div class='error'>Error al procesar los datos: " + e.getMessage() + "</div>");
                }
            } else {
                out.print("<div class='error'>Por favor, ingrese un nombre válido.</div>");
            }
        %>

        <div class="text-center mt-30">
            <a href="Formulario.jsp" class="btn btn-primary">Volver</a>
        </div>
    </div>
</body>
</html>
