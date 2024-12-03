<%-- 
    Document   : actualizarRegistro
    Created on : 2/12/2024, 10:48:19 PM
    Author     : cantt
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <style>
            .alert {
  padding: 15px 20px;
  margin-bottom: 25px;
  border-radius: 12px;
  text-align: center;
  font-weight: 500;
  position: relative;
  overflow: hidden;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.alert-success {
  background-color: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.alert-danger {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}

.alert-success::before,
.alert-danger::before {
  
  position: absolute;
  top: -10px;
  left: -10px;
  background-color: #155724;
  color: white;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
}

.alert-danger::before {
  background-color: #721c24;
}

.alert:hover {
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
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
<%@include file="conexion.jsp"%>

<div class="container">
    <%
        // Capturar los datos enviados desde el formulario
        String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String area = request.getParameter("area");
        String usuarioId = request.getParameter("usuarioId");
        String equipoId = request.getParameter("equipoId");

        try {
            // Preparar la consulta SQL para actualizar el reporte
            String sql = "UPDATE Reporte SET titulo = ?, descripcion = ?, area = ?, usuarioId = ?, equipoId = ? WHERE id = ?";
            st = conexion.prepareStatement(sql);
            st.setString(1, titulo);
            st.setString(2, descripcion);
            st.setString(3, area);
            st.setInt(4, Integer.parseInt(usuarioId));
            st.setInt(5, Integer.parseInt(equipoId));
            st.setInt(6, Integer.parseInt(id));

            // Ejecutar la consulta
            int filasActualizadas = st.executeUpdate();

            if (filasActualizadas > 0) {
                out.println("<div class='alert alert-success'>El reporte se ha actualizado correctamente.</div>");
            } else {
                out.println("<div class='alert alert-danger'>No se pudo actualizar el reporte. Verifica los datos ingresados.</div>");
            }

            conexion.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error al actualizar el reporte: " + e.getMessage() + "</div>");
        }
    %>

      <center>
             <button class="rectangular-button" onclick="window.location.href='dashboarduser.jsp'">
                 
                 Salir
        
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>
    </button>
        </center>
</div>

    </body>
</html>