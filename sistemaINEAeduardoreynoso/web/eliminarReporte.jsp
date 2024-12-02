<%-- 
    Document   : eliminarReporte
    Created on : 1/12/2024, 09:09:00 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="conexion.jsp"%>
<html>
    
    <head>
    <meta charset="UTF-8">
    <title>Eliminar Reporte</title>
</head>
<body>
    <div class="container">
        <h1 class="title">Eliminar Reporte</h1>
        
        <% 
            String idReporte = request.getParameter("id");
            if (idReporte != null) {
                String consulta = "DELETE FROM Reporte WHERE id = ?";
                try {
                    PreparedStatement st = conexion.prepareStatement(consulta);
                    st.setInt(1, Integer.parseInt(idReporte));
                    int resultado = st.executeUpdate();
                    if (resultado > 0) {
                        out.println("<p>Reporte eliminado correctamente.</p>");
                    } else {
                        out.println("<p>No se encontró el reporte.</p>");
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
