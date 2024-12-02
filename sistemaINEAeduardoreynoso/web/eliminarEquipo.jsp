<%-- 
    Document   : eliminarEquipo
    Created on : 1/12/2024, 09:04:24 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="conexion.jsp"%>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Eliminar Equipo</title>
</head>
<body>
    <div class="container">
        <h1 class="title">Eliminar Equipo</h1>
        
        <% 
            String idEquipo = request.getParameter("id");
            if (idEquipo != null) {
                String consulta = "DELETE FROM Equipo WHERE id = ?";
                try {
                    PreparedStatement st = conexion.prepareStatement(consulta);
                    st.setInt(1, Integer.parseInt(idEquipo));
                    int resultado = st.executeUpdate();
                    if (resultado > 0) {
                        out.println("<p>Equipo eliminado correctamente.</p>");
                    } else {
                        out.println("<p>No se encontró el equipo.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            }
        %>

        <button onclick="location.href='dashboarduser.jsp?usuario=<%= request.getParameter("usuario") %>'" class="btn-primary">Volver al Panel</button>
    </div>
</body>
</html>
