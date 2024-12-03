<%-- 
    Document   : dashboarduser
    Created on : 1/12/2024, 04:40:16 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp"%>
<!DOCTYPE html>




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














        .rectangular-button {
            background-color: black;
            color: white;
            border: none;
            width: 120px;
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
            margin-right: 10px;
        }

        
        
        
        
        
        
        
        
        
        
        
        
        
        
                .containers {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }
        .section {
            background-color: #f9fafb;
            border-left: 4px solid #3b82f6;
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 0 8px 8px 0;
        }
        .note {
            background-color: #eff6ff;
            border-left: 4px solid #2563eb;
            padding: 1rem;
            color: #1e40af;
            font-style: italic;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                .notifications-carousel {
            display: flex;
            gap: 20px;
            max-width: 1200px;
            perspective: 1500px;
        }

        .notification-card {
            background: linear-gradient(145deg, #ffffff, #f0f0f3);
            border-radius: 16px;
            box-shadow: 
                6px 6px 12px rgba(0,0,0,0.05), 
                -6px -6px 12px rgba(255,255,255,0.9);
            width: 320px;
            padding: 25px;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            transform-origin: center;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .notification-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }

        .notification-card:hover {
            transform: rotateY(12deg) scale(1.05);
            box-shadow: 
                10px 10px 20px rgba(0,0,0,0.1), 
                -10px -10px 20px rgba(255,255,255,1);
        }

        .notification-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .notification-icon {
            width: 60px;
            height: 60px;
            background-size: contain;
            background-repeat: no-repeat;
            margin-right: 20px;
            filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.1));
        }

        .notification-content {
            flex-grow: 1;
        }

        .notification-title {
            font-weight: 700;
            font-size: 20px;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .notification-description {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .notification-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .notification-date {
            color: #95a5a6;
            font-size: 12px;
            display: flex;
            align-items: center;
        }

        .notification-date svg {
            margin-right: 5px;
            stroke: #3498db;
        }

        .notification-badge {
            background: linear-gradient(45deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border-radius: 20px;
            padding: 3px 10px;
            font-size: 12px;
            font-weight: 600;
        }

        .hp-icon { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="%230096D6" d="M50 10c-22.091 0-40 17.909-40 40s17.909 40 40 40 40-17.909 40-40-17.909-40-40-40zm18.456 59.907H58.217V50.156h10.239v19.751zm-30.673-19.751v19.751H27.544V50.156h10.239zM50 40.097c-5.523 0-10-4.477-10-10s4.477-10 10-10 10 4.477 10 10-4.477 10-10 10z"/></svg>') }
        .dell-icon { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="%23008571" d="M50 10c-22.091 0-40 17.909-40 40s17.909 40 40 40 40-17.909 40-40-17.909-40-40-40zm20 57.5H30V32.5h40v35z"/></svg>') }
        .lenovo-icon { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="%23E2001A" d="M50 10c-22.091 0-40 17.909-40 40s17.909 40 40 40 40-17.909 40-40-17.909-40-40-40zm15 60H35v-40h30v40z"/></svg>') }
        .asus-icon { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="%231E4FC2" d="M50 10c-22.091 0-40 17.909-40 40s17.909 40 40 40 40-17.909 40-40-17.909-40-40-40zm25 55H25V35h50v30z"/></svg>') }
        .msi-icon { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="%23ED1C24" d="M50 10c-22.091 0-40 17.909-40 40s17.909 40 40 40 40-17.909 40-40-17.909-40-40-40zm25 55H25V35h50v30z"/></svg>') }



    </style>
</head>
<body>
       <% 
        // Recuperar el usuario desde la sesión
        String usuario = (String) session.getAttribute("usuario");

        if (usuario == null || usuario.isEmpty()) {
            response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en la sesión
        }
    %>

    
    <div class="container">
        
        <button class="rectangular-button" onclick="window.location.href='index.jsp'">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
        </svg>
        Salir
    </button>
        <h1 class="title">Bienvenido <%= usuario %></h1>

       
    </div>
        
        
            <div class="containers">
        <h1 id="user-instructions" class="text-3xl font-bold text-center mb-6 text-gray-900 border-b pb-4">
            Instrucciones de Uso
        </h1>

        <div class="section" id="welcome-section">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Bienvenida</h2>
            <p>Al entrar a esta página, verás un mensaje de bienvenida con tu nombre de usuario. Asegúrate de estar logueado, ya que de no ser así, serás redirigido automáticamente a la página de inicio de sesión.</p>
        </div>

        <div class="section" id="logout-section">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Sección: Botón "Salir"</h2>
            <p>Este botón te permite salir del panel de usuario y regresar a la página principal del sistema.</p>
            <ul class="list-disc list-inside ml-4">
                <li>Haz clic en el botón negro que dice <strong>"Salir"</strong> (con un ícono de flecha) para cerrar tu sesión.</li>
            </ul>
        </div>

        <div class="section" id="notifications-section">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Sección: Notificaciones Personalizadas</h2>
            <p>Aquí podrás ver las notificaciones relacionadas con tus reportes.</p>
            <ul class="list-disc list-inside ml-4">
                <li>Encuentra la tabla con las columnas: <strong>Título</strong>, <strong>Descripción</strong>, y <strong>Acciones</strong>.</li>
                <li>Haz clic en el botón <strong>"Modificar"</strong> para editar un reporte.</li>
                <li>Haz clic en el botón <strong>"Eliminar"</strong> para borrar un reporte que ya no necesitas.</li>
            </ul>
        </div>

        <div class="section" id="teams-section">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Sección: Mis Equipos</h2>
            <p>Aquí puedes gestionar los equipos asignados a tu cuenta.</p>
            <ul class="list-disc list-inside ml-4">
                <li>Revisa la tabla con las columnas: <strong>Tipo de Equipo</strong>, <strong>Estado</strong>, <strong>Área</strong>, y <strong>Acciones</strong>.</li>
                <li>Haz clic en el botón <strong>"Modificar"</strong> para actualizar la información de un equipo.</li>
                <li>Haz clic en el botón <strong>"Eliminar"</strong> si el equipo ya no está relacionado contigo.</li>
            </ul>
        </div>

        <div class="section" id="general-tips">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Consejos Generales</h2>
            <p>Si no ves datos en las tablas, puede ser porque aún no tienes reportes o equipos registrados. Contacta al administrador si esto parece un error.</p>
            <p class="note mt-4">Si experimentas problemas (botones que no funcionan o errores de carga), intenta recargar la página o comunícate con soporte técnico.</p>
        </div>

        <div class="section" id="quick-shortcuts">
            <h2 class="text-2xl font-semibold mb-3 text-blue-700">Atajos Rápidos</h2>
            <ul class="list-disc list-inside ml-4">
                <li><strong>Volver al Inicio:</strong> Usa el botón <strong>"Salir"</strong> para salir del panel rápidamente.</li>
                <li><strong>Gestión Rápida:</strong> Utiliza los botones de acción directamente desde las tablas.</li>
            </ul>
        </div>
            </div><br><br>
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
                                <button onclick="location.href='modificarEquipo.jsp?id=<%= rs.getInt("id") %>'" 
        style="display: inline-block; padding: 8px 16px; border-radius: 8px; 
               text-decoration: none; font-weight: 600; text-transform: uppercase; 
               font-size: 14px; transition: all 0.3s ease; text-align: center; 
               cursor: pointer; background-color: black; color: white; 
               box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
    Modificar
</button>

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
     <div class="notifications-carousel">
        <div class="notification-card">
            <div class="notification-header">
                <div class="notification-icon hp-icon"></div>
                <div class="notification-content">
                    <div class="notification-title">HP ProBook Update</div>
                    <div class="notification-description">Firmware de seguridad y rendimiento</div>
                </div>
            </div>
            <div class="notification-meta">
                <div class="notification-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y6></line>
                        <line x1="8" y1="2" x2="8" y6></line>
                        <line x1="3" y1="10" x2="21" y10></line>
                    </svg>
                    15 Nov 2024
                </div>
                <div class="notification-badge">Urgente</div>
            </div>
        </div>

        <div class="notification-card">
            <div class="notification-header">
                <div class="notification-icon dell-icon"></div>
                <div class="notification-content">
                    <div class="notification-title">Dell XPS Drivers</div>
                    <div class="notification-description">Actualización de controladores gráficos</div>
                </div>
            </div>
            <div class="notification-meta">
                <div class="notification-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y6></line>
                        <line x1="8" y1="2" x2="8" y6></line>
                        <line x1="3" y1="10" x2="21" y10></line>
                    </svg>
                    22 Nov 2024
                </div>
                <div class="notification-badge">Nuevo</div>
            </div>
        </div>

        <div class="notification-card">
            <div class="notification-header">
                <div class="notification-icon lenovo-icon"></div>
                <div class="notification-content">
                    <div class="notification-title">Lenovo ThinkPad</div>
                    <div class="notification-description">Correcciones de sistema críticas</div>
                </div>
            </div>
            <div class="notification-meta">
                <div class="notification-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y6></line>
                        <line x1="8" y1="2" x2="8" y6></line>
                        <line x1="3" y1="10" x2="21" y10></line>
                    </svg>
                    30 Nov 2024
                </div>
                <div class="notification-badge">Importante</div>
            </div>
        </div>

        <div class="notification-card">
            <div class="notification-header">
                <div class="notification-icon asus-icon"></div>
                <div class="notification-content">
                    <div class="notification-title">ASUS ROG Update</div>
                    <div class="notification-description">Optimización de rendimiento gaming</div>
                </div>
            </div>
            <div class="notification-meta">
                <div class="notification-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y6></line>
                        <line x1="8" y1="2" x2="8" y6></line>
                        <line x1="3" y1="10" x2="21" y10></line>
                    </svg>
                    05 Dic 2024
                </div>
                <div class="notification-badge">Performance</div>
            </div>
        </div>

        <div class="notification-card">
            <div class="notification-header">
                <div class="notification-icon msi-icon"></div>
                <div class="notification-content">
                    <div class="notification-title">MSI Prestige</div>
                    <div class="notification-description">Actualizaciones de seguridad</div>
                </div>
            </div>
            <div class="notification-meta">
                <div class="notification-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y6></line>
                        <line x1="8" y1="2" x2="8" y6></line>
                        <line x1="3" y1="10" x2="21" y10></line>
                    </svg>
                    10 Dic 2024
                </div>
                <div class="notification-badge">Seguridad</div>
            </div>
        </div>
     </div><br><br>
<center>
    <button onclick="location.href='registrarReporte.jsp'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Registrar Reporte</button>
    <button onclick="location.href='resgistrarEquipo.jsp'" style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">Registrar Equipo</button>
    
</center>  
    <script>
    console.log('<%= usuario %>');
</script>

    <script>
        // Optional future JavaScript for interactive features
        document.querySelectorAll('.notification-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                card.style.setProperty('--mouse-x', `${x}px`);
                card.style.setProperty('--mouse-y', `${y}px`);
            });
        });
    </script>

</body>

</html>
