<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Buscar Usuario</title>
    <style>
        /* Estilos Generales de Búsqueda y Alertas */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7f6;
    line-height: 1.6;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px;
    background-color: white;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
}

/* Títulos */
h2 {
    color: #6a11cb;
    text-align: center;
    margin-bottom: 30px;
    position: relative;
    text-transform: uppercase;
    letter-spacing: 1px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 3px;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
}

/* Tabla de Resultados */
.table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    background-color: white;
    box-shadow: 0 10px 25px rgba(50,50,93,.1);
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
}

.table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tbody tr:hover {
    background-color: rgba(106, 17, 203, 0.05);
    transition: all 0.3s ease;
}

.table tbody td {
    padding: 15px 20px;
    border-bottom: 1px solid #e0e0e0;
}

/* Alertas Personalizadas */
.alert {
    padding: 15px 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.alert-success {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    color: white;
}

.alert-success::before {
    content: '✓';
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 24px;
    opacity: 0.7;
}

.alert-danger {
    background: linear-gradient(135deg, #ff5f6d 0%, #ff4185 100%);
    color: white;
}

.alert-danger::before {
    content: '!';
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 24px;
    opacity: 0.7;
    border: 2px solid white;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.alert-info {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
}

.alert-info::before {
    content: 'i';
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 24px;
    opacity: 0.7;
    border: 2px solid white;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }
    
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
<body>
<%
    String nombreusuario = request.getParameter("nombreusuario");
    boolean usuarioEncontrado = false;

    if (nombreusuario != null && !nombreusuario.isEmpty()) {
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet listadoUsuarios = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaControlEquipos", "root", "");
            ps = conexion.prepareStatement("SELECT * FROM Usuario WHERE nombre LIKE ?");
            ps.setString(1, "%" + nombreusuario + "%");
            listadoUsuarios = ps.executeQuery();
%>
<section>
    <div class="container">
        <h2>Resultados de la Búsqueda</h2>
        <%
            if (listadoUsuarios != null && listadoUsuarios.isBeforeFirst()) { // Verifica si hay resultados
                usuarioEncontrado = true;
        %>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (listadoUsuarios.next()) {
                %>
                <tr>
                    <td><%=listadoUsuarios.getInt("id")%></td>
                    <td><%=listadoUsuarios.getString("nombre")%></td>
                    <td><%=listadoUsuarios.getString("email")%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table><br><br>
        <a href="dashboardmanager.jsp" class="dashboard-btn">
    Ir al Dashboard
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
        <line x1="5" y1="12" x2="19" y2="12"></line>
        <polyline points="12 5 19 12 12 19"></polyline>
    </svg>
</a>
        <%
            } else {
        %>
        <p>No se encontraron usuarios con el nombre proporcionado.</p>
        <%
            }
        %>
    </div>
</section>
<%
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<p>Error al procesar los datos: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (listadoUsuarios != null) listadoUsuarios.close();
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    } else {
        out.print("<p>No se proporcionó un nombre de usuario para la búsqueda.</p>");
    }
%>




</body>
</html>
