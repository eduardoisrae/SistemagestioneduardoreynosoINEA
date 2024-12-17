<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%@include file="conexion.jsp"%>
  
  <head>
      <style>
          /* Modern and Attractive Registration Page Styles */
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

button:hover {
    background-color: #00f2fe;
    transform: translateY(-4px);
    box-shadow: 0 8px 15px rgba(50, 50, 93, 0.12), 0 4px 8px rgba(0, 0, 0, 0.1);
}

button:active {
    transform: translateY(1px);
    box-shadow: none;
}

.register-btn {
    background-color: #4facfe;
}

.register-btn:hover {
    background-color: #00f2fe;
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
      </style>
  </head>
  
  <body>

<div class="register-container">
    <h1>Registro de Usuario</h1>
    <% 
        String mensajeExito = "";
        String mensajeError = "";

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String usuario = request.getParameter("usuario");
            String email = request.getParameter("email");
            String contrasena = request.getParameter("contrasena");
            String tipo = request.getParameter("tipo"); // Obtener el tipo de usuario

            String consultaRegistro;

            if ("admin".equalsIgnoreCase(tipo)) {
                consultaRegistro = "INSERT INTO Administradores (nombre, email, contrasena) VALUES (?, ?, SHA2(?, 256))";
            } else {
                consultaRegistro = "INSERT INTO Usuario (nombre, email, contraseña) VALUES (?, ?, SHA2(?, 256))";
            }

            try {
                st = conexion.prepareStatement(consultaRegistro);
                st.setString(1, usuario);
                st.setString(2, email);
                st.setString(3, contrasena);

                int resultado = st.executeUpdate();
                if (resultado > 0) {
                    mensajeExito = "Usuario registrado exitosamente en la tabla " + (tipo.equalsIgnoreCase("admin") ? "Administrador" : "Usuario") + ".";
                }
            } catch (Exception e) {
                mensajeError = "Error al registrar el usuario: " + e.getMessage();
            } finally {
                if (st != null) st.close();
                if (conexion != null) conexion.close();
            }
        }
    %>
    <% if (!mensajeError.isEmpty()) { %>
        <div class="alert alert-danger"><%= mensajeError %></div>
    <% } %>
    <% if (!mensajeExito.isEmpty()) { %>
        <div class="alert alert-success"><%= mensajeExito %></div>
    <% } %>
    <form method="POST" action="registro.jsp">
        <label for="usuario">Usuario</label>
        <input type="text" name="usuario" id="usuario" required>
        <label for="email">Correo Electrónico</label>
        <input type="email" name="email" id="email" required>
        <label for="contrasena">Contraseña</label>
        <input type="password" name="contrasena" id="contrasena" required>
        
        <!-- Campo select para elegir tipo de usuario -->
        <label for="tipo">Tipo de Usuario</label>
        <select name="tipo" id="tipo" required>
            <option value="usuario">Usuario</option>
            <option value="admin">Administrador</option>
        </select>

        <button type="submit" class="register-btn">Registrar</button>
        <button type="button" class="register-btn" onclick="location.href='index.jsp'">Regresar</button>
    </form>
</div>

  </body>
</html>
