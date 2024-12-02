<%-- 
    Document   : modificarEquipo
    Created on : 1/12/2024, 09:02:04 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="conexion.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Equipo</title>
    <style>
        /* Agregar tu estilo aquí (el mismo que usaste en el dashboard) */
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Modificar Equipo</h1>
        
        <% 
            String idEquipo = request.getParameter("id");
            String tipoEquipo = "", estado = "", area = "";
            
            // Obtener el equipo de la base de datos
            if (idEquipo != null) {
                String consulta = "SELECT tipoEquipo, estado, area FROM Equipo WHERE id = ?";
                try {
                    PreparedStatement st = conexion.prepareStatement(consulta);
                    st.setInt(1, Integer.parseInt(idEquipo));
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        tipoEquipo = rs.getString("tipoEquipo");
                        estado = rs.getString("estado");
                        area = rs.getString("area");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            }
        %>

        <section class="form-section">
            <h2>Modificar Datos del Equipo</h2>
            <form method="POST" action="actualizarEquipo.jsp">
                <input type="hidden" name="id" value="<%= idEquipo %>">
                <label for="tipoEquipo">Tipo de Equipo:</label>
                <input type="text" name="tipoEquipo" id="tipoEquipo" value="<%= tipoEquipo %>" required>

                <label for="estado">Estado:</label>
                <input type="text" name="estado" id="estado" value="<%= estado %>" required>

                <label for="area">Área:</label>
                <input type="text" name="area" id="area" value="<%= area %>" required>

                <button type="submit" class="btn-primary">Actualizar Equipo</button>
            </form>
        </section>
    </div>
</body>
</html>
