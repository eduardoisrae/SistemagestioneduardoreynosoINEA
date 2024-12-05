<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard Administrador</title>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,900' rel='stylesheet' type='text/css'>
    
    
    <style>
/* Ultra-Modern Dashboard Design */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    font-family: 'Inter', 'Roboto', sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #e9e9f7 100%);
    color: #2c3e50;
    line-height: 1.6;
    letter-spacing: -0.025em;
}

.dashboard-container {
    max-width: 1500px;
    margin: 0 auto;
    padding: 40px 20px;
}

/* Advanced Search Container */
.search-container {
    display: flex;
    justify-content: center;
    margin-bottom: 30px;
}

.search-wrapper {
    display: flex;
    align-items: center;
    background: white;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    overflow: hidden;
    max-width: 500px;
    width: 100%;
    transition: all 0.3s ease;
}

.search-wrapper:focus-within {
    box-shadow: 0 10px 25px rgba(37, 117, 252, 0.2);
    transform: translateY(-3px);
}

.search-wrapper .input-field {
    flex-grow: 1;
    margin: 0;
}

.search-wrapper input {
    width: 100%;
    padding: 15px 20px;
    border: none;
    font-size: 16px;
    background: transparent;
    outline: none;
}

.search-wrapper .search-icon {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    padding: 15px 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
}

.search-wrapper .search-icon:hover {
    opacity: 0.9;
}

/* Refined Table Styling */
.table {
    width: 100%;
    background: white;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
    overflow: hidden;
    margin-bottom: 30px;
}

.table thead {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
}

.table thead th {
    padding: 18px 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
    font-size: 0.8rem;
}

.table tbody tr {
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.table tbody tr:hover {
    background-color: rgba(37, 117, 252, 0.03);
    transform: scale(1.01);
}

.table tbody td {
    padding: 16px 20px;
    border-bottom: 1px solid #e9ecef;
    vertical-align: middle;
    font-size: 0.95rem;
}

/* Elegant Buttons */
.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 12px 20px;
    border-radius: 16px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    gap: 8px;
    border: none;
    cursor: pointer;
}

.btn-primary {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    box-shadow: 0 4px 6px rgba(37, 117, 252, 0.2);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(37, 117, 252, 0.3);
}

.btn-danger {
    background: linear-gradient(135deg, #ff6a88 0%, #ff6a88 100%);
    color: white;
}

.btn-danger:hover {
    transform: translateY(-2px);
}

/* Page Title Styling */
.page-title {
    background: white;
    border-radius: 16px;
    padding: 25px 30px;
    margin-bottom: 30px;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
}

.page-title h2 {
    color: #2575fc;
    font-weight: 700;
    letter-spacing: -0.5px;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .search-wrapper {
        flex-direction: column;
    }
    
    .table {
        font-size: 0.9rem;
    }
}

/* Scrollbar Styling */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    border-radius: 5px;
}

/* Advanced Input Styles */
.user-form-container {
    background: white;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
    padding: 30px;
    margin-bottom: 30px;
}

.user-form-row {
    display: flex;
    gap: 20px;
    align-items: center;
    margin-bottom: 20px;
}

.input-group {
    position: relative;
    flex-grow: 1;
}

.input-group input {
    width: 100%;
    padding: 15px 20px;
    border: 2px solid transparent;
    border-bottom: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
}

.input-group input:focus {
    outline: none;
    border-bottom-color: #6a11cb;
    box-shadow: 0 2px 4px rgba(106, 17, 203, 0.1);
    background-color: white;
}

.input-group input:not(:placeholder-shown) {
    border-bottom-color: #2575fc;
}

.input-group::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    transition: width 0.3s ease;
}

.input-group input:focus + .input-group::before {
    width: 100%;
}

.input-group label {
    position: absolute;
    top: -25px;
    left: 0;
    font-size: 12px;
    color: #6c757d;
    transition: all 0.3s ease;
    opacity: 0;
}

.input-group input:focus + label,
.input-group input:not(:placeholder-shown) + label {
    top: -35px;
    opacity: 1;
    color: #6a11cb;
}

.add-user-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 12px 25px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
}

.add-user-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

.add-user-btn .glyphicon {
    margin-right: 10px;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .user-form-row {
        flex-direction: column;
        gap: 15px;
    }
    
    .input-group {
        width: 100%;
    }
}

/* Advanced Search Form Styles */
.search-form-container {
    background: white;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
    padding: 30px;
    max-width: 600px;
    margin: 0 auto;
}

.search-form-wrapper {
    display: flex;
    align-items: center;
    gap: 20px;
}

.search-input-group {
    position: relative;
    flex-grow: 1;
}

.search-input-group input {
    width: 100%;
    padding: 15px 20px;
    border: 2px solid transparent;
    border-bottom: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
}

.search-input-group input:focus {
    outline: none;
    border-bottom-color: #6a11cb;
    box-shadow: 0 2px 4px rgba(106, 17, 203, 0.1);
    background-color: white;
}

.search-input-group label {
    position: absolute;
    top: -25px;
    left: 0;
    font-size: 12px;
    color: #6c757d;
    transition: all 0.3s ease;
    opacity: 0;
}

.search-input-group input:focus + label,
.search-input-group input:not(:placeholder-shown) + label {
    top: -35px;
    opacity: 1;
    color: #6a11cb;
}

.search-button {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 12px 25px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
    cursor: pointer;
}

.search-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

.search-button i {
    margin-right: 10px;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .search-form-wrapper {
        flex-direction: column;
        gap: 15px;
    }
    
    .search-input-group {
        width: 100%;
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

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /* Estilos Modernos para Tablas */
.table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    background-color: white;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
    border-radius: 12px;
    overflow: hidden;
}

.table thead {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
}

.table thead th {
    padding: 15px 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
    border-bottom: 2px solid rgba(255,255,255,0.2);
    transition: all 0.3s ease;
}

.table tbody tr {
    transition: all 0.3s ease;
}

.table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tbody tr:hover {
    background-color: rgba(106, 17, 203, 0.05);
    transform: translateY(-3px);
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.1);
}

.table tbody td {
    padding: 15px 20px;
    border-bottom: 1px solid #e0e0e0;
    font-size: 15px;
    color: #333;
}

.btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 8px 15px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(106, 17, 203, 0.2);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(106, 17, 203, 0.3);
}

.section-title {
    color: #6a11cb;
    position: relative;
    text-align: center;
    margin-bottom: 30px;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 3px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .table, .table tbody, .table tr, .table td {
        display: block;
        width: 100%;
    }
    
    .table thead {
        display: none;
    }
    
    .table tr {
        margin-bottom: 15px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    
    .table td {
        text-align: right;
        padding: 10px 15px;
        border-bottom: 1px solid #e0e0e0;
    }
    
    .table td::before {
        content: attr(data-label);
        float: left;
        font-weight: bold;
        text-transform: uppercase;
    }
}
        
        

/* Footer elegante */
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
.login-container {
    animation: fadeIn 0.7s ease-out;
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
        
    </style>
</head>
<body id="top" class="has-header-search">

<%
    Connection conexion = null;
    Statement usuariosStmt = null;
    Statement equiposStmt = null;
    Statement reportesStmt = null;
    ResultSet listadoUsuarios = null;
    ResultSet listadoEquipos = null;
    ResultSet listadoReportes = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");
        request.setCharacterEncoding("UTF-8");

        usuariosStmt = conexion.createStatement();
        listadoUsuarios = usuariosStmt.executeQuery("SELECT * FROM Usuario");

        equiposStmt = conexion.createStatement();
        listadoEquipos = equiposStmt.executeQuery("SELECT * FROM Equipo");

        reportesStmt = conexion.createStatement();
        listadoReportes = reportesStmt.executeQuery("SELECT * FROM Reporte");
%>

<section class="page-title ptb-50">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                    <button class="rectangular-button" onclick="window.location.href='index.jsp'">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
        </svg>
        Salir
    </button>
                <h2>
                    <%
                        HttpSession creasesion = request.getSession();
                        String usuario = (String) creasesion.getAttribute("usuario");
                        if (usuario != null) {
                            out.print("<center><h1> Gusto en verte de nuevo @" + usuario + " </h1></center><br>");
                            
                        } else {
                            out.print("<script>location.replace('login.jsp');</script>");
                        }
                    %>
                </h2>
               
            </div>
        </div>
    </div>
</section><br><br><br><br>



<h3 class="section-title text-uppercase center">Busqueda</h3>

<section class="section-padding ">
    <div class="container">
        <div class="row mt-50">
            <div class="col-md-8 col-md-offset-2">
                
                <div class="mt-30"></div>

                <!--======================Buscar Usuario============================ --> 
              <div class="search-form-container">
    <form class="search-form-wrapper" method="post" action="buscarUsuario.jsp">
        <div class="search-input-group">
            <input 
                type="text" 
                name="nombreusuario" 
                id="nombreusuario" 
                placeholder=" "
                required
            >
            <label for="nombreusuario">Nombre de Usuario</label>
        </div>
        <button class="search-button" type="submit" name="aceptar">
            <i class="fa fa-search"></i> Buscar
        </button>
    </form>
              </div><br><br><br><br>
                
                
                
                
                
                <h3 class="section-title text-uppercase center">Crea Usuario</h3>
                <!-- /=============================================================== --> 
                <table class="table table-striped">

                    <!--======================Añadir Usuario============================ --> 
                   <div class="user-form-container">
    <form method="post" action="agregarUsuario.jsp" class="user-form-row">
    <div class="input-group">
        <input type="text" name="nombre" required placeholder=" " />
        <label>Nombre</label>
    </div><br><br>
    <div class="input-group">
        <input type="email" name="email" required placeholder=" " />
        <label>Email</label>
    </div><br><br>
    <div class="input-group">
        <input type="password" name="password" required placeholder=" " />
        <label>Contraseña</label>
    </div><br><br>
    <button type="submit" class="add-user-btn" title="Añadir Usuario">
        <span class="glyphicon glyphicon-plus"></span> Añadir
    </button>
</form>

</div>      
                    <!-- /=============================================================== --> 
                    <thead>
                        <th>ID</th>
                        
                        <th>NOMBRE</th>
                        <th>CORREO</th>
                        <th></th>
                        <th></th>
                        
                    </thead>
                    
                    
                    <h3 class="section-title text-uppercase center">Usuarios Registrados</h3>
                    <%
                        while (listadoUsuarios.next()) {
                    %>
                    <tr>
                        <td><%=listadoUsuarios.getInt("id")%></td>
                        <td><%=listadoUsuarios.getString("nombre")%></td>
                        <td><%=listadoUsuarios.getString("email")%></td>
                        <form method="post" action="editarUsuario.jsp">
                            <input type="hidden" name="id" value="<%=listadoUsuarios.getInt("id")%>">
                            <input type="hidden" name="nombre" value="<%=listadoUsuarios.getString("nombre")%>">
                            <input type="hidden" name="email" value="<%=listadoUsuarios.getString("email")%>">
                            <td>
                                <button class="btn btn-primary" type="submit" name="editar" title="Editar Usuario">
                                    Editar
                                </button>
                            </td>
                        </form> 
                        <form method="post" action="eliminarUsuario.jsp">
                            <input type="hidden" name="id" value="<%=listadoUsuarios.getInt("id")%>">                                                           
                            <td>
                                <button class="btn btn-primary" type="submit" name="borrar" title="Eliminar Usuario">
                                    Eliminar
                                </button>                            
                            </td>
                        </form>
                    </tr>
                    <%
                        }//cierra While
                    %>                                                                                                                                                      
                </table>                        
            </div>                                                           
        </div>

        <div class="row mt-50">
            <div class="col-md-8 col-md-offset-2">
                <h3 class="section-title text-uppercase center">Equipos Registrados</h3>
                <div class="mt-30"></div>

                <table class="table table-striped">
                    <thead>
                        <th>ID</th>
                        <th>Fecha Registro</th>
                        <th>Estado</th>
                        <th>Área</th>
                        <th>Usuario ID</th>
                        <th>Tipo Equipo</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Número de Serie</th>
                        <th>Fecha Última Actualización</th>
                    </thead>
                    <%
                        while (listadoEquipos.next()) {
                    %>
                    <tr>
                        <td><%=listadoEquipos.getInt("id")%></td>
                        <td><%=listadoEquipos.getDate("fechaRegistro")%></td>
                        <td><%=listadoEquipos.getString("estado")%></td>
                        <td><%=listadoEquipos.getString("area")%></td>
                        <td><%=listadoEquipos.getInt("usuarioId")%></td>
                        <td><%=listadoEquipos.getString("tipoEquipo")%></td>
                        <td><%=listadoEquipos.getString("marca")%></td>
                        <td><%=listadoEquipos.getString("modelo")%></td>
                        <td><%=listadoEquipos.getString("numeroSerie")%></td>
                        <td><%=listadoEquipos.getDate("fechaUltimaActualizacion")%></td>
                    </tr>
                    <%
                        }//cierra While
                    %>                                                                                                                                                      
                </table>                        
            </div>                                                           
        </div>

        <div class="row mt-50">
            <div class="col-md-8 col-md-offset-2">
                <h3 class="section-title text-uppercase center">Reportes Registrados</h3>
                <div class="mt-30"></div>

                <table class="table table-striped">
                    <thead>
                        <th>ID</th>
                        <th>Fecha Registro</th>
                        <th>Área</th>
                        <th>Usuario ID</th>
                        <th>Equipo ID</th>
                        <th>Descripción</th>
                        <th>Título</th>
                        <th></th>
                    </thead>
                    <%
                        while (listadoReportes.next()) {
                    %>
                    <tr>
                        <td><%=listadoReportes.getInt("id")%></td>
                        <td><%=listadoReportes.getDate("fechaRegistro")%></td>
                        <td><%=listadoReportes.getString("area")%></td>
                        <td><%=listadoReportes.getInt("usuarioId")%></td>
                        <td><%=listadoReportes.getInt("equipoId")%></td>
                        <td><%=listadoReportes.getString("descripcion")%></td>
                        <td><%=listadoReportes.getString("titulo")%></td>
                        <form method="post" action="eliminarReporteusuario.jsp">
                            <input type="hidden" name="id" value="<%=listadoReportes.getInt("id")%>">                                                           
                            <td>
                                <button class="btn btn-primary" type="submit" name="borrar" title="Eliminar Reporte">
                                    Eliminar
                                </button>                            
                            </td>
                        </form>
                    </tr>
                    <%
                        }//cierra While
                    %>                                                                                                                                                      
                </table>                        
            </div>                                                           
        </div>
    </div><!-- /.container -->
</section><br><br>
                    
                    
                    
<center>           <a href="dashboardmanager.jsp" class="dashboard-btn">
    Ir a mensajes
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
        <line x1="5" y1="12" x2="19" y2="12"></line>
        <polyline points="12 5 19 12 12 19"></polyline>
    </svg>
    </a></center><br><br><br><br>
<%
    } catch (SQLException e) {
        e.printStackTrace();
        out.print("<p>Error al procesar los datos: " + e.getMessage() + "</p>");
    } finally {
        if (listadoUsuarios != null) listadoUsuarios.close();
        if (listadoEquipos != null) listadoEquipos.close();
        if (listadoReportes != null) listadoReportes.close();
        if (usuariosStmt != null) usuariosStmt.close();
        if (equiposStmt != null) equiposStmt.close();
        if (reportesStmt != null) reportesStmt.close();
        if (conexion != null) conexion.close();
    }
%>
<!-- jQuery -->
<script src="assets/js/jquery-2.1.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/materialize/js/materialize.min.js"></script>
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/smoothscroll.min.js"></script>
<script src="assets/js/jquery.inview.min.js"></script>
<script src="assets/js/menuzord.js"></script>
<script src="assets/js/equalheight.js"></script>
<script src="assets/js/imagesloaded.js"></script>
<script src="assets/js/jquery.stellar.min.js"></script>
<script src="assets/js/jquery.countTo.min.js"></script>
<script src="assets/js/jquery.shuffle.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/twitterFetcher.min.js"></script>
<script src="assets/flexSlider/jquery.flexslider-min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/scripts.js"></script>




<jsp:include page="includes/footer.jsp"/>