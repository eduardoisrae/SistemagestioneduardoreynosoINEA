<%-- 
    Document   : dashboarduser
    Created on : 1/12/2024, 04:40:16 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@include file="conexion.jsp"%>

<html>
    
<head>
    <meta charset="UTF-8">
    <title>Panel de Usuario</title>
    <style>
/* Estilos generales para Panel de Usuario Moderno */
body {
    font-family: 'Inter', 'system-ui', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    background: linear-gradient(135deg, #f4f7f9 0%, #e9f0f5 100%);
    margin: 0;
    padding: 0;
    line-height: 1.6;
    color: #2c3e50;
}

.container {
    max-width: 1280px;
    margin: 0 auto;
    padding: 40px 20px;
}

.title {
    text-align: center;
    color: #2c3e50;
    font-size: 2.5rem;
    margin-bottom: 50px;
    font-weight: 800;
    position: relative;
    letter-spacing: -0.02em;
}

.title::after {
    content: '';
    position: absolute;
    bottom: -15px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 5px;
    background: #3498db;
    border-radius: 10px;
}

/* Sección de Formulario Modernizada */
.form-section {
    background-color: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 
        0 25px 50px -12px rgba(50, 50, 93, 0.08), 
        0 10px 24px -8px rgba(0, 0, 0, 0.06);
    margin-bottom: 40px;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    overflow: hidden;
    position: relative;
}

.form-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 6px;
    background: linear-gradient(90deg, #3498db 0%, #2980b9 100%);
}

.form-section:hover {
    transform: translateY(-10px);
    box-shadow: 
        0 30px 60px -15px rgba(50, 50, 93, 0.15), 
        0 15px 35px -10px rgba(0, 0, 0, 0.1);
}

.form-section h2 {
    text-align: center;
    color: #34495e;
    margin-bottom: 30px;
    font-weight: 700;
    font-size: 1.8rem;
    position: relative;
}

.form-section form {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
}

.form-section label {
    display: block;
    margin-bottom: 10px;
    color: #2c3e50;
    font-weight: 600;
    font-size: 0.95rem;
    transition: color 0.3s ease;
}

.form-section input, 
.form-section textarea {
    width: 100%;
    padding: 14px 16px;
    border: 2px solid #e0e6ed;
    border-radius: 12px;
    font-size: 16px;
    transition: all 0.3s ease;
    appearance: none;
}

.form-section input:focus, 
.form-section textarea:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.15);
}

.btn-primary {
    grid-column: span 2;
    padding: 16px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
}

.btn-primary::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transition: all 0.4s;
}

.btn-primary:hover::before {
    left: 100%;
}

.btn-primary:hover {
    background-color: #2980b9;
    transform: translateY(-5px);
    box-shadow: 
        0 10px 20px -5px rgba(52, 152, 219, 0.3), 
        0 5px 10px -3px rgba(52, 152, 219, 0.2);
}

/* Secciones de Tablas */
.notifications-section,
.equipment-section {
    background-color: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 
        0 25px 50px -12px rgba(50, 50, 93, 0.08), 
        0 10px 24px -8px rgba(0, 0, 0, 0.06);
    margin-bottom: 30px;
}

.notifications-table,
.equipment-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    border-radius: 15px;
    overflow: hidden;
}

.notifications-table thead,
.equipment-table thead {
    background-color: #f4f7f9;
    color: #2c3e50;
}

.notifications-table th,
.equipment-table th {
    padding: 15px;
    text-align: left;
    font-weight: 700;
    border-bottom: 2px solid #e0e6ed;
}

.notifications-table tbody tr,
.equipment-table tbody tr {
    transition: background-color 0.3s ease;
}

.notifications-table tbody tr:nth-child(even),
.equipment-table tbody tr:nth-child(even) {
    background-color: #f9fafb;
}

.notifications-table tbody tr:hover,
.equipment-table tbody tr:hover {
    background-color: #f0f4f8;
}

.notifications-table td,
.equipment-table td {
    padding: 15px;
    border-bottom: 1px solid #e0e6ed;
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-section form,
    .form-section h2 {
        grid-template-columns: 1fr;
    }

    .btn-primary {
        grid-column: span 1;
    }
}




















    </style>
</head>
<% 
    // Recuperar el usuario desde la sesión
    String usuario = (String) session.getAttribute("usuario");

    if (usuario == null || usuario.isEmpty()) {
        response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en la sesión
    }
%>

<body> 
<div class="container">
    <h1 class="title">Panel de Usuario: <%= usuario %></h1>

    <!-- Formulario de Registro de Reportes -->
    <section class="form-section">
        <h2>Registrar Reporte</h2>
<form method="POST" action="registrarReporte.jsp" enctype="multipart/form-data">

    <input type="hidden" name="usuario" value="<%= usuario %>" />

    <label for="tipoEquipo">Tipo de Equipo:</label>
    <input type="text" name="tipoEquipo" id="tipoEquipo" required>

    <label for="marca">Marca:</label>
    <input type="text" name="marca" id="marca" required>

    <label for="modelo">Modelo:</label>
    <input type="text" name="modelo" id="modelo" required>

    <label for="numeroSerie">Número de Serie:</label>
    <input type="text" name="numeroSerie" id="numeroSerie" required>

   <label for="area">Área Asignada:</label>
<input type="text" name="area" id="area" required>


    <label for="descripcion">Descripción del Reporte:</label>
    <textarea name="descripcion" id="descripcion" required></textarea>

    <label for="titulo">Título:</label>
    <input type="text" name="titulo" id="titulo" required>

    <button type="submit" class="btn-primary">Guardar y Enviar</button>
</form>

    </section>
</div>

        <!-- Notificaciones Personalizadas -->
        <section class="notifications-section">
            <h2>Notificaciones</h2>
            <table class="notifications-table">
                <thead>
                    <tr>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                     <% 
                // Consulta para traer los reportes relacionados con el usuario
                String consultaNotificaciones = "SELECT r.titulo, r.descripcion, r.id FROM Reporte r " +
                                                "JOIN Usuario u ON r.usuarioId = u.id WHERE u.nombre = ?";
                try {
                    st = conexion.prepareStatement(consultaNotificaciones);
                    st.setString(1, usuario); // Usamos el nombre de usuario obtenido de la URL

                    rs = st.executeQuery();
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("titulo") %></td>
                    <td><%= rs.getString("descripcion") %></td>
                    <td>
                        <button onclick="location.href='modificarReporte.jsp?id=<%= rs.getInt("id")%>'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Modificar</button>

                        <button onclick="location.href='eliminarReporte.jsp?id=<%= rs.getInt("id")%>'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Eliminar</button>

                    </td>
                </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='3'>Error al cargar las notificaciones: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (st != null) st.close();
                }
            %>
                </tbody>
            </table>
        </section>

        <!-- Equipos del Usuario -->
        <section class="equipment-section">
            <h2>Mis Equipos</h2>
            <table class="equipment-table">
                <thead>
                    <tr>
                        <th>Tipo de Equipo</th>
                        <th>Estado</th>
                        <th>Área</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Consulta para traer los equipos relacionados con el usuario
                        String consultaEquipos = "SELECT tipoEquipo, estado, area, id FROM Equipo WHERE usuarioId = (SELECT id FROM Usuario WHERE nombre = ?)";
                        try {
                            st = conexion.prepareStatement(consultaEquipos);
                            st.setString(1, usuario); // Usamos el nombre de usuario

                            rs = st.executeQuery();
                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getString("tipoEquipo") %></td>
                            <td><%= rs.getString("estado") %></td>
                            <td><%= rs.getString("area") %></td>
                            <td>
                                <button onclick="location.href='modificarEquipo.jsp?id=<%= rs.getInt("id") %>'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Modificar</button>
                                <button onclick="location.href='eliminarEquipo.jsp?id=<%= rs.getInt("id") %>'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Eliminar</button>
                            </td>
                        </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='4'>Error al cargar los equipos: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) rs.close();
                            if (st != null) st.close();
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>
    
    
    <script>
    console.log('<%= usuario %>');
</script>

</body>

</html>
