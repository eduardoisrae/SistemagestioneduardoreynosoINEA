<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.regex.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insertar Respuesta</title>
    <style>
        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
        }

        h2, h3 {
            color: #6a11cb;
            text-align: center;
            margin-bottom: 20px;
        }

        h3::after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 10px auto;
            border-radius: 2px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="number"],
        input[type="date"],
        input[type="email"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .btn-primary {
            display: inline-block;
            width: 100%;
            padding: 12px 20px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(106, 17, 203, 0.3);
        }

        .message {
            text-align: center;
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            font-size: 16px;
        }

        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

<section class="container">
    <h3>Enviar Respuesta</h3>
    <form method="post" action="insertarRespuesta.jsp">
        <label for="reporteId">ID Reporte</label>
        <input type="number" id="reporteId" name="reporteId" required placeholder="Ingrese el ID del Reporte">
        
        <label for="mensaje">Mensaje</label>
        <textarea id="mensaje" name="mensaje" required placeholder="Escribe tu mensaje aquí"></textarea>
        
        <label for="fechaRespuesta">Fecha</label>
        <input type="date" id="fechaRespuesta" name="fechaRespuesta" required>
        
<label for="estado">Correo Electrónico</label>
<input type="email" id="estado" name="estado" required 
    pattern=".+@(gmail\.com|udlondres\.com)" 
    placeholder="Introduce tu correo (@gmail.com o @udlondres.com)">



        
        
        <button type="submit" class="btn-primary">Enviar Respuesta</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String reporteId = request.getParameter("reporteId");
            String mensaje = request.getParameter("mensaje");
            String fechaRespuesta = request.getParameter("fechaRespuesta");
            String estado = request.getParameter("estado");
            String email = request.getParameter("email");

            // Validación de correo electrónico usando una expresión regular
            String emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
            if (!email.matches(emailPattern)) {
                out.print("<div class='message error'>El correo electrónico no es válido.</div>");
            } else {
                Connection conexion = null;
                PreparedStatement ps = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Driver actualizado para MySQL 8+
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");
                    String sql = "INSERT INTO respuesta (reporteId, mensaje, fechaRespuesta, estado, email) VALUES (?, ?, ?, ?, ?)";
                    ps = conexion.prepareStatement(sql);
                    ps.setInt(1, Integer.parseInt(reporteId));
                    ps.setString(2, mensaje);
                    ps.setDate(3, Date.valueOf(fechaRespuesta));
                    ps.setString(4, estado);
                    ps.setString(5, email);

                    int filasAfectadas = ps.executeUpdate();
                    if (filasAfectadas > 0) {
                        out.print("<div class='message success'>Respuesta enviada correctamente.</div>");
                    } else {
                        out.print("<div class='message error'>No se pudo enviar la respuesta.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("<div class='message error'>Error: " + e.getMessage() + "</div>");
                } finally {
                    // Cierre manual de recursos
                    if (ps != null) {
                        try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                    if (conexion != null) {
                        try { conexion.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        }
    %>
</section>

</body>
</html>
