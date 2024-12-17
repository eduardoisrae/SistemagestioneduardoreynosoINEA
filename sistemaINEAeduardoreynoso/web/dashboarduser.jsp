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
        }
        .card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        .header {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .section {
            padding: 1.5rem;
            border-bottom: 1px solid #eee;
        }
        .section h2 {
            color: #2563eb;
            margin-bottom: 1rem;
            font-size: 1.25rem;
            font-weight: 600;
        }
        .section p, .section ul {
            margin-bottom: 1rem;
        }
        .section ul {
            padding-left: 2rem;
        }
        .highlight {
            background-color: #f3f4f6;
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-family: monospace;
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



        
        
        
        
        
        .notifications-section {
    background: white;
    border-radius: 1rem;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    overflow: hidden;
    margin-bottom: 2rem;
    
}

.notifications-section h2 {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: white;
    padding: 1.5rem;
    font-size: 1.25rem;
    font-weight: 600;
    text-align: left;
    border-radius: 9px;
}

.notifications-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

.notifications-table thead {
    background-color: #f3f4f6;
}

.notifications-table th, 
.notifications-table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.notifications-table th {
    font-weight: 600;
    color: #2563eb;
    text-transform: uppercase;
    font-size: 0.875rem;
}

.notifications-table tr:last-child td {
    border-bottom: none;
}

.notifications-table button {
    display: inline-block;
    padding: 8px 16px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
    transition: all 0.3s ease;
    text-align: center;
    cursor: pointer;
    background-color: #2563eb;
    color: white;
    border: none;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    margin-right: 0.5rem;
}

.notifications-table button:hover {
    background-color: #1e40af;
}



.equipment-section {
    background: white;
    border-radius: 1rem;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    overflow: hidden;
    margin-bottom: 2rem;
}

.equipment-section h2 {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: white;
    padding: 1.5rem;
    font-size: 1.25rem;
    font-weight: 600;
    text-align: left;
    border-radius: 9px;
}

.equipment-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

.equipment-table thead {
    background-color: #f3f4f6;
}

.equipment-table th, 
.equipment-table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.equipment-table th {
    font-weight: 600;
    color: #2563eb;
    text-transform: uppercase;
    font-size: 0.875rem;
}

.equipment-table tr:last-child td {
    border-bottom: none;
}

.equipment-table button {
    display: inline-block;
    padding: 8px 16px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
    transition: all 0.3s ease;
    text-align: center;
    cursor: pointer;
    background-color: #2563eb;
    color: white;
    border: none;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    margin-right: 0.5rem;
}

.equipment-table button:hover {
    background-color: #1e40af;
}




        .maintenance-wrapper {
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem;
        }
        .maintenance-panel {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.08);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        .panel-header {
            background: linear-gradient(135deg, #4338ca, #3730a3);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .panel-content {
            padding: 1.5rem;
            border-bottom: 1px solid #eaeaea;
        }
        .panel-title {
            color: #4338ca;
            margin-bottom: 1rem;
            font-size: 1.25rem;
            font-weight: 600;
        }
        .panel-subtitle {
            color: #4338ca;
            margin-top: 1rem;
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }
        .panel-text, .panel-list {
            margin-bottom: 1rem;
        }
        .panel-list {
            padding-left: 2rem;
        }
        .tech-tag {
            background-color: #f1f5f9;
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-family: monospace;
            color: #4338ca;
        }
        
        
        
        
        
        
        
        
        
        
        
                .maintenance-wrappers {
            max-width: 400px;
            margin: 0 auto;
            padding: 2rem;
        }
        .maintenance-panel {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        .panel-header {
            background: linear-gradient(135deg, #4338ca, #3730a3);
            color: white;
            padding: 1rem;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .chat-container {
            height: 500px;
            display: flex;
            flex-direction: column;
        }
        .chat-messages {
            flex-grow: 1;
            overflow-y: auto;
            padding: 1rem;
        }
        .chat-input {
            display: flex;
            padding: 1rem;
            border-top: 1px solid #eaeaea;
        }
        .chat-input input {
            flex-grow: 1;
            padding: 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            margin-right: 0.5rem;
        }
        .chat-input button {
            background-color: #4338ca;
            color: white;
            border: none;
            border-radius: 0.5rem;
            padding: 0.5rem 1rem;
            cursor: pointer;
        }
        .message {
            margin-bottom: 1rem;
            padding: 0.75rem;
            border-radius: 0.5rem;
        }
        .user-message {
            background-color: #f1f5f9;
            align-self: flex-end;
            text-align: right;
        }
        .bot-message {
            background-color: #e0e7ff;
            align-self: flex-start;
        }
        .chat-toggle {
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }
        .hidden {
            display: none;
        }
        
        
        
        
        #chu{
            text-align: center;
        }
        
        
        
        
                .ey { 
            max-width: 800px; 
            margin: 0 auto; 
            padding: 2rem; 
        }
        .two { 
            background: white; 
            border-radius: 1rem; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.1); 
            overflow: hidden; 
            margin-bottom: 2rem; 
        }
        .mye { 
            background: linear-gradient(135deg, #2563eb, #1e40af); 
            color: white; 
            padding: 2rem; 
            text-align: center; 
        }
        .section-item { 
            padding: 1.5rem; 
            border-bottom: 1px solid #eee; 
        }
        .section-item h2 { 
            color: #2563eb; 
            margin-bottom: 1rem; 
            font-size: 1.25rem; 
            font-weight: 600; 
        }
        .section-item p, .section-item ul { 
            margin-bottom: 1rem; 
        }
        .section-item ul { 
            padding-left: 2rem; 
        }
        .highlight { 
            background-color: #f3f4f6; 
            padding: 0.25rem 0.5rem; 
            border-radius: 0.25rem; 
            font-family: monospace; 
        }
        
        
        
        
        
        
        
        .footer {
    background: white;
    color: black;
    padding: 2rem 1rem;
    margin-top: auto;
    box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.1);
}
.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}
.footer-section {
    margin-bottom: 1rem;
}
.company-name {
    font-size: 1.5rem;
    margin: 0 0 0.5rem 0;
}
.company-tagline {
    font-size: 0.9rem;
    opacity: 0.8;
    margin: 0;
}
.footer-nav {
    display: flex;
    gap: 1.5rem;
    flex-wrap: wrap;
}
.footer-link {
    color: white;
    text-decoration: none;
    transition: color 0.3s ease;
}
.footer-link:hover {
    color: #e0f7ff;
}
.footer-bottom {
    text-align: center;
    margin-top: 2rem;
    padding-top: 1rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    font-size: 0.9rem;
}
@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
        text-align: center;
    }
    .footer-nav {
        margin-top: 1rem;
        justify-content: center;
    }
}
/* Animación sutil de entrada */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}






.dashboard-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 12px 25px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
    gap: 10px;
}

.dashboard-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

.dashboard-btn svg {
    width: 20px;
    height: 20px;
    stroke: white;
    transition: transform 0.3s ease;
}

.dashboard-btn:hover svg {
    transform: translateX(3px);
}



.exit-container {
    text-align: center;
    margin-top: 20px;
}

.btn-salir {
    display: inline-block;
    padding: 10px 20px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    text-transform: uppercase;
    transition: all 0.3s ease;
}

.btn-salir:hover {
    background: linear-gradient(135deg, #2575fc, #6a11cb);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(106, 17, 203, 0.3);
}

.btn-salir i {
    margin-right: 8px;
}
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
        <div class="card">
            <div class="header">
                <h1>Instrucciones de Uso</h1>
            </div>

            <div class="section">
                <h2>Bienvenida</h2>
                <p>Al entrar a esta página, verás un mensaje de bienvenida con tu nombre de usuario. Asegúrate de estar logueado, ya que de no ser así, serás redirigido automáticamente a la página de inicio de sesión.</p>
            </div>

            <div class="section">
                <h2>Botón "Salir"</h2>
                <p>Este botón te permite salir del panel de usuario y regresar a la página principal del sistema.</p>
                <ul>
                    <li>Haz clic en el botón <span class="highlight">Salir</span> (con un ícono de flecha) para cerrar tu sesión.</li>
                </ul>
            </div>

            <div class="section">
                <h2>Notificaciones Personalizadas</h2>
                <p>Aquí podrás ver las notificaciones relacionadas con tus reportes.</p>
                <ul>
                    <li>Encuentra la tabla con las columnas: <span class="highlight">Título</span>, <span class="highlight">Descripción</span>, y <span class="highlight">Acciones</span>.</li>
                    <li>Haz clic en el botón <span class="highlight">Modificar</span> para editar un reporte.</li>
                    <li>Haz clic en el botón <span class="highlight">Eliminar</span> para borrar un reporte que ya no necesitas.</li>
                </ul>
            </div>

            <div class="section">
                <h2>Mis Equipos</h2>
                <p>Aquí puedes gestionar los equipos asignados a tu cuenta.</p>
                <ul>
                    <li>Revisa la tabla con las columnas: <span class="highlight">Tipo de Equipo</span>, <span class="highlight">Estado</span>, <span class="highlight">Área</span>, y <span class="highlight">Acciones</span>.</li>
                    <li>Haz clic en el botón <span class="highlight">Modificar</span> para actualizar la información de un equipo.</li>
                    <li>Haz clic en el botón <span class="highlight">Eliminar</span> si el equipo ya no está relacionado contigo.</li>
                </ul>
            </div>

            <div class="section">
                <h2>Consejos Generales</h2>
                <p>Si no ves datos en las tablas, puede ser porque aún no tienes reportes o equipos registrados. Contacta al administrador si esto parece un error.</p>
                <p>Si experimentas problemas (botones que no funcionan o errores de carga), intenta recargar la página o comunícate con soporte técnico.</p>
            </div>

            <div class="section">
                <h2>Atajos Rápidos</h2>
                <ul>
                    <li><strong>Volver al Inicio:</strong> Usa el botón <span class="highlight">Salir</span> para salir del panel rápidamente.</li>
                    <li><strong>Gestión Rápida:</strong> Utiliza los botones de acción directamente desde las tablas.</li>
                </ul>
            </div>
        </div>
           </div><br>
           
               <!-- New exit button -->
    <div class="exit-container">
        <a href="perfil.jsp" class="btn-salir">
            <i class="fas fa-sign-out-alt"></i> Perfil
        </a>
    </div><br><br>
           
       <!-- Notificaciones Personalizadas -->
<section class="notifications-section">
    <h2>Notificaciones</h2>
    <table class="notifications-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Fecha de Registro</th>
                <th>Área</th>
                <th>Usuario ID</th>
                <th>Equipo ID</th>
                <th>Descripción</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Consulta para traer los reportes relacionados con el usuario actual
                String consultaNotificaciones = "SELECT r.id, r.titulo, r.fechaRegistro, r.area, r.usuarioId, r.equipoId, r.descripcion " +
                                                "FROM Reporte r " +
                                                "JOIN Usuario u ON r.usuarioId = u.id " +
                                                "WHERE u.nombre = ?";
                try {
                    // Prepara la consulta
                    st = conexion.prepareStatement(consultaNotificaciones);
                    st.setString(1, usuario); // Se utiliza el nombre del usuario para filtrar
                    
                    // Ejecuta la consulta
                    rs = st.executeQuery();
                    
                    // Verifica si hay resultados
                    if (!rs.isBeforeFirst()) { 
            %>
                        <tr>
                            <td colspan="8">No hay notificaciones disponibles.</td>
                        </tr>
            <%
                    } else {
                        // Itera sobre los resultados y genera las filas de la tabla
                        while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("titulo") %></td>
                            <td><%= rs.getDate("fechaRegistro") %></td>
                            <td><%= rs.getString("area") %></td>
                            <td><%= rs.getInt("usuarioId") %></td>
                            <td><%= rs.getInt("equipoId") %></td>
                            <td><%= rs.getString("descripcion") %></td>
                            <td>
                                <button onclick="location.href='modificarReporte.jsp?id=<%= rs.getInt("id")%>'" 
                                        style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                                    Modificar
                                </button>
                                <button onclick="location.href='eliminarReporte.jsp?id=<%= rs.getInt("id")%>'" 
                                        style="display: inline-block; padding: 8px 16px; border-radius: 8px; text-decoration: none; font-weight: 600; text-transform: uppercase; font-size: 14px; transition: all 0.3s ease; text-align: center; cursor: pointer; background-color: black; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                                    Eliminar
                                </button>
                            </td>
                        </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    // Muestra un mensaje de error
                    out.println("<tr><td colspan='8'>Error al cargar las notificaciones: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Cierra los recursos
                    if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (st != null) try { st.close(); } catch (Exception e) { e.printStackTrace(); }
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
    
    
<center><h1>Alertas de Nuevas Actualizaciones</h1></center>
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
     
     
     
      <div class="maintenance-wrapper">
        <div class="maintenance-panel">
            <div class="panel-header">
                <h1 id="chu">Guía de Mantenimiento de Computadoras</h1>
            </div>
            <div class="panel-content">
                <h2 class="panel-title">Frecuencia de Revisión y Actualización</h2>
                <p class="panel-text">Para mantener tu computadora en óptimas condiciones, sigue estas recomendaciones:</p>
                <ul class="panel-list">
                    <li><strong>Cada mes:</strong>
                        <ul>
                            <li>Limpieza física del equipo (exterior e interior)</li>
                            <li>Verificar actualizaciones del sistema operativo</li>
                            <li>Ejecutar una limpieza de archivos temporales</li>
                        </ul>
                    </li>
                    <li><strong>Cada 3 meses:</strong>
                        <ul>
                            <li>Desfragmentar disco duro (para sistemas Windows)</li>
                            <li>Actualizar controladores de hardware</li>
                            <li>Revisar y limpiar el software antivirus</li>
                        </ul>
                    </li>
                    <li><strong>Cada 6 meses:</strong>
                        <ul>
                            <li>Verificar estado de la batería</li>
                            <li>Realizar respaldo completo de información</li>
                            <li>Considerar reinstalación del sistema operativo</li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            
            
            
                <center>           <a href="vistamensaje.jsp" class="dashboard-btn">
    contacto Manager
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
        <line x1="5" y1="12" x2="19" y2="12"></line>
        <polyline points="12 5 19 12 12 19"></polyline>
    </svg>
    </a></center>

            <div class="panel-content">
                <h2 class="panel-title">Recomendaciones por Marca</h2>
                
                <h3 class="panel-subtitle">Dell</h3>
                <p class="panel-text">Utiliza la herramienta de diagnóstico <span class="tech-tag">Dell SupportAssist</span> para mantenimiento preventivo. Actualiza el BIOS cada 6 meses.</p>
                
                <h3 class="panel-subtitle">HP</h3>
                <p class="panel-text">Emplea <span class="tech-tag">HP Support Assistant</span> para actualizaciones y diagnóstico. Limpia los ventiladores cada 3 meses.</p>
                
                <h3 class="panel-subtitle">Lenovo</h3>
                <p class="panel-text">Usa <span class="tech-tag">Lenovo Vantage</span> para gestionar actualizaciones. Presta especial atención a la batería y ventilación.</p>
                
                <h3 class="panel-subtitle">Apple</h3>
                <p class="panel-text">Mantén macOS actualizado través de <span class="tech-tag">Preferencias del Sistema > Actualización de Software</span>. Realiza una limpieza física con paños especiales.</p>
                
                <h3 class="panel-subtitle">Acer</h3>
                <p class="panel-text">Utiliza <span class="tech-tag">Acer Care Center</span> para actualizaciones. Revisa la temperatura y rendimiento regularmente.</p>
            </div>

            <div class="panel-content">
                <h2 class="panel-title">Consejos Generales de Optimización</h2>
                <ul class="panel-list">
                    <li>Mantén siempre actualizado tu sistema operativo</li>
                    <li>Usa software antivirus actualizado</li>
                    <li>Limita los programas que se inician con el sistema</li>
                    <li>Realiza respaldos periódicos de información</li>
                    <li>Evita sobrecalentar el equipo</li>
                    <li>Usa almacenamiento en la nube para liberar espacio</li>
                </ul>
            </div>

            <div class="panel-content">
                <h2 class="panel-title">Sistemas Operativos: Consejos de Mantenimiento</h2>
                
                <h3 class="panel-subtitle">Windows</h3>
                <p class="panel-text">Usa <span class="tech-tag">Herramienta de Desfragmentación</span> y <span class="tech-tag">Limpieza de Disco</span> regularmente.</p>
                
                <h3 class="panel-subtitle">macOS</h3>
                <p class="panel-text">Utiliza <span class="tech-tag">Optimizar Almacenamiento</span> y mantén Time Machine activado.</p>
                
                <h3 class="panel-subtitle">Linux</h3>
                <p class="panel-text">Actualiza mediante <span class="tech-tag">apt update</span> y <span class="tech-tag">apt upgrade</span> en distribuciones basadas en Debian.</p>
            </div>
        </div>
    </div>
     
         <div class="ey">
        <div class="two">
            <div class="mye">
                <h1>Val Assistant</h1>
            </div>
            <div class="section-item">
                <p>¡Hola! Bienvenido a nuestro asistente de soporte técnico. Estoy aquí para ayudarte con una variedad de preguntas relacionadas con tu equipo de cómputo.</p>
            </div>
            <div class="section-item">
                <h2>Lista de Preguntas y Consultas</h2>
                <ul>
                    <li>
                        <strong>Actualizaciones de Sistemas Operativos:</strong>
                        <ul>
                            <li>actualizar windows</li>
                            <li>actualizar macOS</li>
                            <li>linux actualizar</li>
                        </ul>
                    </li>
                    <li>
                        <strong>Limpieza de Computadora:</strong>
                        <ul>
                            <li>limpiar computadora</li>
                            
                        </ul>
                    </li>
                    <li>
                        <strong>Revisión de Batería:</strong>
                        <ul>
                            <li>revisar bateria</li>
                       
                            <li>revisar bateria</li>
                        </ul>
                    </li>
                    
                    <li>
    <strong>Rendimiento de la Computadora:</strong>
    <ul>
        <li>rendimiento computadora</li>
        <li>que hago para que mi pc vaya mas rapido</li>
    </ul>
</li>
<li>
    <strong>Detección de Virus:</strong>
    <ul>
        <li>virus</li>
        <li>pasos debo seguir para eliminar un virus</li>
    </ul>
</li>
<li>
    <strong>Actualizar Drivers:</strong>
    <ul>
        <li>actualizar drivers</li>
        
    </ul>
</li>
<li>
    <strong>Solucionar Problemas:</strong>
    <ul>
        <li>solucionar problemas</li>
        
    </ul>
</li>
<li>
    <strong>Configurar Red:</strong>
    <ul>
        <li>configurar red</li>
        
    </ul>
</li>
<li>
    <strong>Respaldo de Datos:</strong>
    <ul>
        
        <li>respaldo de datos</li>
    </ul>
</li>
<li>
    <strong>Instalar Software:</strong>
    <ul>
        <li>instalar software</li>
        
    </ul>
</li>
<li>
    <strong>Solucionar Pantalla Azul:</strong>
    <ul>
        <li>solucionar pantalla azul windows</li>
        <li>para mac pantalla azul mac</li>
    </ul>
</li>
<li>
    <strong>Solucionar Problemas de WiFi:</strong>
    <ul>
        <li>solucionar wifi</li>
        <li>pasos para arreglar wifi</li>
    </ul>
</li>
<li>
    <strong>Solucionar Problemas de Sonido:</strong>
    <ul>
        <li>solucionar sonido</li>
       
    </ul>
</li>
<li>
    <strong>Solucionar Pantalla Negra:</strong>
    <ul>
        <li>solucionar pantalla negra</li>
        
    </ul>
</li>
                </ul>
            </div>
            <div class="section-item">
                <h2>Ejemplo de Interacción</h2>
                <p><strong>Usuario:</strong> "¿Cómo actualizo macOS?"</p>
                <p><strong>Asistente:</strong> "Para actualizar macOS: Haz clic en el menú Apple > Preferencias del Sistema > Actualización de Software."</p>
            </div>
            <div class="section-item">
                <h2>Consejos para Evitar Errores</h2>
                <ol>
                    <li><strong>Usa palabras clave exactas:</strong> Asegúrate de usar las palabras clave exactas mencionadas en la lista de consultas.</li>
                    <li><strong>Formato de la pregunta:</strong> Escribe la pregunta en minúsculas y sin errores ortográficos.</li>
                    <li><strong>Sigue el formato sugerido:</strong> Si la pregunta es larga, intenta resumirla usando las palabras clave.</li>
                </ol>
            </div>
            <div class="section-item">
                <p>Con estas mejoras y consejos, deberías poder interactuar de manera más efectiva con el asistente y obtener respuestas precisas.</p>
            </div>
        </div>
    </div>
     
     <div class="maintenance-wrappers">
        <div class="maintenance-panel">
            <div class="panel-header">
                <h2>Asistente Técnico</h2>
                <button class="chat-toggle" onclick="toggleChat()">💬</button>
            </div>
            <div id="chatbot" class="hidden">
                <div class="chat-container">
                    <div id="chatMessages" class="chat-messages">
                        <div class="message bot-message">
                            ¡Hola! Soy tu asistente Val. ¿En qué puedo ayudarte con tu equipo de cómputo?
                        </div>
                    </div>
                    <div class="chat-input">
                        <input type="text" id="userInput" placeholder="Escribe tu pregunta...">
                        <button onclick="sendMessage()">Enviar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
    
    
    
         <script>
        function toggleChat() {
            const chatbot = document.getElementById('chatbot');
            chatbot.classList.toggle('hidden');
        }

        function sendMessage() {
            const input = document.getElementById('userInput');
            const messagesContainer = document.getElementById('chatMessages');
            
            if (input.value.trim() === '') return;

            // Mensaje del usuario
            const userMessage = document.createElement('div');
            userMessage.classList.add('message', 'user-message');
            userMessage.textContent = input.value;
            messagesContainer.appendChild(userMessage);

            // Respuesta del bot (simulada)
            const botResponse = getBotResponse(input.value.toLowerCase());
            const botMessage = document.createElement('div');
            botMessage.classList.add('message', 'bot-message');
            botMessage.textContent = botResponse;
            messagesContainer.appendChild(botMessage);

            // Limpiar input
            input.value = '';

            // Scroll al último mensaje
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }

        function getBotResponse(userInput) {
            const responses = {
                'hola': '¡Hola! Estoy aquí para ayudarte con problemas de computadoras.',
                'actualizar windows': 'Para actualizar Windows: Ve a Inicio > Configuración > Windows Update. Haz clic en "Buscar actualizaciones" y sigue las instrucciones.',
                'actualizar mac': 'Para actualizar macOS: Haz clic en el menú Apple > Preferencias del Sistema > Actualización de Software.',
                'linux actualizar': 'En la mayoría de distribuciones Linux, usa el comando: sudo apt update && sudo apt upgrade',
                'limpiar computadora': 'Para mantener limpia tu computadora:\n1. Limpia archivos temporales\n2. Desinstala programas no usados\n3. Usa una herramienta de limpieza de disco',
                'revisar bateria': 'Para revisar la batería:\n- Windows: Panel de control > Estado de la batería\n- Mac: Menú Apple > Información del Sistema > Batería',
                'rendimiento computadora': 'Para mejorar el rendimiento:\n1. Reduce programas de inicio\n2. Actualiza drivers\n3. Considera actualizar RAM\n4. Usa SSD',
                'virus': 'Para detectar virus:\n1. Actualiza tu antivirus\n2. Realiza un escaneo completo\n3. Elimina amenazas\n4. Considera reinstalar sistema si es grave',
                'actualizar drivers': 'Para actualizar drivers:\n- Windows: Dispositivos > Administrador de dispositivos > Actualizar driver\n- Mac: Menú Apple > Preferencias del Sistema > Actualización de Software',
                'solucionar problemas': 'Para solucionar problemas comunes:\n1. Reinicia tu computadora\n2. Verifica conexiones\n3. Actualiza software\n4. Usa herramientas de diagnóstico',
                'configurar red': 'Para configurar una red:\n- Windows: Inicio > Configuración > Red e Internet\n- Mac: Menú Apple > Preferencias del Sistema > Red',
                'respaldo de datos': 'Para hacer un respaldo de datos:\n1. Usa herramientas de respaldo integradas\n2. Considera servicios en la nube\n3. Realiza copias de seguridad periódicas',
                'instalar software': 'Para instalar software:\n1. Descarga el instalador\n2. Ejecuta el instalador\n3. Sigue las instrucciones en pantalla',
                'solucionar pantalla azul': 'Para solucionar la pantalla azul:\n1. Reinicia en modo seguro\n2. Verifica drivers\n3. Actualiza Windows\n4. Considera reinstalar sistema si es grave',
                'solucionar wifi': 'Para solucionar problemas de WiFi:\n1. Reinicia el router\n2. Verifica la conexión\n3. Actualiza drivers de red\n4. Usa herramientas de diagnóstico de red',
                 'que hago para que mi pc vaya mas rapido': 'Para mejorar el rendimiento:\n1. Reduce programas de inicio\n2. Actualiza drivers\n3. Considera actualizar RAM\n4. Usa SSD',
                'pasos debo seguir para eliminar un virus': 'Para detectar y eliminar virus:\n1. Actualiza tu antivirus\n2. Realiza un escaneo completo\n3. Elimina amenazas\n4. Considera reinstalar sistema si es grave',
                'actualizar drivers windows': 'Para actualizar drivers en Windows:\n- Dispositivos > Administrador de dispositivos > Actualizar driver',
                'actualizar drivers mac': 'Para actualizar drivers en macOS:\n- Menú Apple > Preferencias del Sistema > Actualización de Software',
                'solucionar sonido': 'Para solucionar problemas de sonido:\n1. Verifica volumen\n2. Comprueba conexiones\n3. Actualiza drivers de audio\n4. Usa herramientas de diagnóstico de sonido',
                'solucionar pantalla negra': 'Para solucionar la pantalla negra:\n1. Verifica conexiones\n2. Reinicia en modo seguro\n3. Actualiza drivers de video\n4. Considera reinstalar sistema si es grave',
                'solucionar pantalla azul windows': 'Para solucionar la pantalla azul en Windows:\n1. Reinicia en modo seguro\n2. Verifica drivers\n3. Actualiza Windows\n4. Considera reinstalar sistema si es grave',
                'para mac pantalla azul mac': 'Para solucionar la pantalla azul en macOS:\n1. Reinicia tu Mac\n2. Verifica actualizaciones de software\n3. Restaura el sistema desde un respaldo\n4. Considera reinstalar el sistema operativo',
                'pasos para arreglar wifi': 'Para solucionar problemas de WiFi:\n1. Reinicia el router y el módem\n2. Verifica la conexión de red en la configuración de tu dispositivo\n3. Desactiva y vuelve a activar la conexión WiFi\n4. Actualiza los drivers de red\n5. Usa herramientas de diagnóstico de red\n6. Verifica la configuración del router\n7. Asegúrate de que no haya interferencias de otros dispositivos\n8. Cambia la frecuencia del canal WiFi\n9. Restaura la configuración de fábrica del router\n10. Considera actualizar el firmware del router'
                
        
        
        
        
        
        };

            // Búsqueda de respuestas
            for (let key in responses) {
                if (userInput.includes(key)) {
                    return responses[key];
                }
            }

            return 'Lo siento, no entendí tu pregunta. ¿Puedes ser más específico?';
        }

        // Evento para enviar con Enter
        document.getElementById('userInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });
    </script>

<jsp:include page="includes/footer.jsp"/>
