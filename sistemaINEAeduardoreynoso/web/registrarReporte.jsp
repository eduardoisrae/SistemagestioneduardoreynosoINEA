<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrar Reporte</title>
    <style>
body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background-color: #f4f6f9;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    line-height: 1.6;
}

.register-container {
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 450px;
    animation: fadeIn 0.5s ease-out;
}

.register-container h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-weight: 600;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
    color: #34495e;
    font-weight: 500;
}

input {
    padding: 12px 15px;
    margin-bottom: 20px;
    border: 1.5px solid #e0e6ed;
    border-radius: 8px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

input:focus {
    outline: none;
    border-color: #3498db;
    box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

.register-btn {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 14px 20px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.1s ease;
    margin-top: 10px;
}

.register-btn:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.register-btn:active {
    transform: translateY(1px);
    box-shadow: none;
}

.alert {
    padding: 12px 15px;
    margin-bottom: 20px;
    border-radius: 8px;
    text-align: center;
}

.alert-danger {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.alert-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive adjustments */
@media screen and (max-width: 480px) {
    .register-container {
        width: 90%;
        padding: 20px;
    }
}







                .rectangular-button {
            background-color: black;
            color: white;
            border: none;
            width: 170px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-family: Arial, sans-serif;
        }

        .rectangular-button svg {
            width: 24px;
            height: 24px;
            stroke: white;
            stroke-width: 2;
            margin-left: 10px;
        }

    </style>
</head>
<body>
        
     
        
   
   

       
   
    <div class="register-container">
              
        <h1 class="title">Registrar Reporte</h1>
     
        <% 
            String usuario = (String) session.getAttribute("usuario");

            if (usuario == null || usuario.isEmpty()) {
                response.sendRedirect("login.jsp");
            }

            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
                String fechaRegistro = request.getParameter("fechaRegistro");
                String area = request.getParameter("area");
                String usuarioIdStr = request.getParameter("usuarioId");
                String equipoIdStr = request.getParameter("equipoId");
                String descripcion = request.getParameter("descripcion");
                String titulo = request.getParameter("titulo");

                if (fechaRegistro.isEmpty() || area.isEmpty() || usuarioIdStr.isEmpty() || 
                    equipoIdStr.isEmpty() || descripcion.isEmpty()) {
        %>
                    <div class="alert alert-danger">
                        <p>Error: Todos los campos son obligatorios.</p>
                    </div>
                    <a href="registrarReporte.jsp">Volver al formulario</a>
                <% return; } %>
                <% try { 
                    String sql = "INSERT INTO Reporte (fechaRegistro, area, usuarioId, equipoId, descripcion, titulo) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conexion.prepareStatement(sql);
                    statement.setString(1, fechaRegistro);
                    statement.setString(2, area);
                    statement.setInt(3, Integer.parseInt(usuarioIdStr));
                    statement.setInt(4, Integer.parseInt(equipoIdStr));
                    statement.setString(5, descripcion);
                    statement.setString(6, titulo);
                    int filasAfectadas = statement.executeUpdate();

                    if (filasAfectadas > 0) {
                %>
                        <div class="alert alert-success">
                            <p>Reporte registrado correctamente.</p>
                        </div>
                         <center>
        <button onclick="location.href='dashboarduser.jsp'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Salir</button>
        </center>
                <% } else { %>
                        <div class="alert alert-danger">
                            <p>Error al registrar el reporte.</p>
                        </div>
                <% }
                    statement.close();
                    conexion.close();
                } catch (Exception e) { %>
                    <div class="alert alert-danger">
                        <p>Error: <%= e.getMessage() %></p>
                    </div>
                <% } 
                return;
            } else { %>
            
       
        <form method="POST" action="registrarReporte.jsp">
            <input type="hidden" name="submit" value="true" />
            <label for="fechaRegistro">Fecha de Registro:</label>
            <input type="date" id="fechaRegistro" name="fechaRegistro" required>
            <label for="area">Área:</label>
            <input type="text" id="area" name="area" required>
            <label for="usuarioId">ID de Usuario:</label>
            <input type="number" id="usuarioId" name="usuarioId" required>
            <label for="equipoId">ID de Equipo:</label>
            <input type="number" id="equipoId" name="equipoId" required>
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" required></textarea>
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo">
            <button type="submit" class="register-btn">Guardar y Enviar</button>
        </form><br><br>
        <center>
             <button class="rectangular-button" onclick="window.location.href='dashboarduser.jsp'">
                 
                 Regresar
        
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>
    </button>
        </center>
        <% } %>
    </div>
</body>
</html>