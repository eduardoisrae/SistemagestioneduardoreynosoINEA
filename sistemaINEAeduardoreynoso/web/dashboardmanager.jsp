<%-- 
    Document   : dashboardmanager
    Created on : 1/12/2024, 04:40:33 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@include file="conexion.jsp"%>
<% 
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null || usuario.isEmpty()) {
        response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en la sesión
    }
%>


<jsp:include page="includes/footer.jsp"/>
