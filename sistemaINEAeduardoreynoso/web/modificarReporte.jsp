<%-- 
    Document   : modificarReporte
    Created on : 1/12/2024, 09:07:27 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="conexion.jsp"%>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Modificar Reporte</title>
    <style>
        /* Agregar tu estilo aquí (el mismo que usaste en el dashboard) */
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Modificar Reporte</h1>
        
        <% 
            String idReporte = request.getParameter("id");
            String titulo = "", descripcion = "";
            
            // Obtener los detalles del reporte desde la base de datos
            if (idReporte != null) {
                String consulta = "SELECT titulo, descripcion FROM Reporte WHERE id = ?";
                try {
                    PreparedStatement st = conexion.prepareStatement(consulta);
                    st.setInt(1, Integer.parseInt(idReporte));
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        titulo = rs.getString("titulo");
                        descripcion = rs.getString("descripcion");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            }
        %>

        <section class="form-section">
            <h2>Modificar Reporte</h2>
            <form method="POST" action="actualizarReporte.jsp">
                <input type="hidden" name="id" value="<%= idReporte %>">
                <label for="titulo">Título del Reporte:</label>
                <input type="text" name="titulo" id="titulo" value="<%= titulo %>" required>

                <label for="descripcion">Descripción:</label>
                <textarea name="descripcion" id="descripcion" required><%= descripcion %></textarea>

                <button type="submit" class="btn-primary">Actualizar Reporte</button>
            </form>
        </section>
    </div>
</body>
   
</html>
