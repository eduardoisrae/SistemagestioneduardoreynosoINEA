<%-- 
    Document   : index
    Created on : 1/12/2024, 04:29:01 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/head.jsp"/>
<%@include file="conexion.jsp"%>
 <div class="login-container">
    <h1>Inicio de Sesión</h1>
    <% 
        String mensajeError = "";
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");

            // Hashear la contraseña ingresada
            String consultaUsuario = "SELECT * FROM Usuario WHERE nombre = ? AND contraseña = SHA2(?, 256)";
            String consultaAdmin = "SELECT * FROM Administradores WHERE nombre = ? AND contrasena = SHA2(?, 256)";

            boolean esUsuario = false;
            boolean esAdmin = false;

            try {
                // Validar en tabla Usuarios
                st = conexion.prepareStatement(consultaUsuario);
                st.setString(1, usuario);
                st.setString(2, contrasena); // Aquí se compara ya hasheada
                rs = st.executeQuery();
                if (rs.next()) {
                    esUsuario = true;
                }

                // Validar en tabla Administradores
                st = conexion.prepareStatement(consultaAdmin);
                st.setString(1, usuario);
                st.setString(2, contrasena); // Aquí también se compara ya hasheada
                rs = st.executeQuery();
                if (rs.next()) {
                    esAdmin = true;
                }

                if (esUsuario) {
                    // Guardar el nombre de usuario en la sesión
                    session.setAttribute("usuario", usuario); // Guarda al usuario en la sesión
                    // Redirigir pasando el nombre de usuario como parámetro en la URL
                    response.sendRedirect("dashboarduser.jsp?usuario=" + usuario);
                } else if (esAdmin) {
                    // Guardar el nombre de administrador en la sesión
                    session.setAttribute("usuario", usuario); // Guarda al usuario en la sesión
                    response.sendRedirect("dashboardmanager.jsp");
                } else {
                    mensajeError = "Usuario o contraseña incorrectos.";
                }
            } catch (Exception e) {
                mensajeError = "Error en la conexión: " + e.getMessage();
            } finally {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (conexion != null) conexion.close();
            }
        }
    %>

    <% if (!mensajeError.isEmpty()) { %>
        <div class="alert alert-danger"><%= mensajeError %></div>
    <% } %>
    
    <form method="POST" action="index.jsp">
        <label for="usuario">Usuario</label>
        <input type="text" name="usuario" id="usuario" required>
        <label for="contrasena">Contraseña</label>
        <input type="password" name="contrasena" id="contrasena" required>
        <button type="submit" class="login-btn">Iniciar Sesión</button>
    </form>
    <button class="register-btn" onclick="location.href='registro.jsp'">Registrarse</button>
</div>

<jsp:include page="includes/footer.jsp"/>