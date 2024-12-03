<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <style>
     body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  background-color: #ecf0f1;
  margin: 0;
  padding: 0;
  color: #2c3e50;
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.container {
  margin: 60px auto;
  padding: 40px;
  max-width: 900px;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}

.well {
  background-color: #f9fafb;
  border: 1px solid #e1e4e8;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 25px;
  transition: background-color 0.3s ease;
}

.well:hover {
  background-color: #f0f3f6;
}

.form-group {
  margin-bottom: 25px;
  position: relative;
}

label {
  font-weight: 600;
  color: #2c3e50;
  margin-bottom: 8px;
  display: block;
  transition: color 0.3s ease;
}

.input-group {
  position: relative;
}

.input-group-addon {
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  color: #a0aec0;
  transition: color 0.3s ease;
}

input[type="text"], 
input[type="number"], 
textarea {
  width: 80%;
  padding: 12px 15px;
  font-size: 16px;
  border: 2px solid #e2e8f0;
  border-radius: 12px;
  outline: none;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input[type="text"]:focus, 
input[type="number"]:focus, 
textarea:focus {
  border-color: #3498db;
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
}

textarea {
  resize: vertical;
  min-height: 120px;
}

.btn {
  display: inline-block;
  padding: 14px 25px;
  background-color: #3498db;
  color: #fff;
  border: none;
  border-radius: 12px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 10px rgba(52, 152, 219, 0.2);
}

.btn:hover {
  background-color: #2980b9;
  transform: translateY(-2px);
  box-shadow: 0 6px 15px rgba(52, 152, 219, 0.3);
}

.btn:active {
  transform: translateY(0);
  box-shadow: 0 2px 5px rgba(52, 152, 219, 0.2);
}

.title {
  font-size: 28px;
  color: #2c3e50;
  text-align: center;
  margin-bottom: 40px;
  font-weight: 700;
  position: relative;
}

.title::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background-color: #3498db;
  border-radius: 2px;
}

.alert {
  padding: 15px 20px;
  margin-bottom: 25px;
  border-radius: 12px;
  text-align: center;
  font-weight: 500;
  position: relative;
  overflow: hidden;
}

.alert-danger {
  background-color: #fff5f5;
  color: #c53030;
  border: 1px solid #feb2b2;
}

.alert-danger::before {
  content: '!'; 
  position: absolute;
  top: -10px;
  left: -10px;
  background-color: #c53030;
  color: white;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
}

@media (max-width: 768px) {
  .container {
    margin: 30px 15px;
    padding: 25px;
  }

  .title {
    font-size: 24px;
  }
}

        </style>
    </head>


<%@include file="conexion.jsp"%>

<div class="container well">
    <center>
        
        <h3>Modificar Reporte</h3>
    </center>

    <div class="row col-md-4"></div>
    <div class="row col-md-5">
        <%
            // Obtener el ID del reporte desde los parámetros de la URL
            String id = request.getParameter("id");
            String titulo = "";
            String descripcion = "";
            String area = "";
            int usuarioId = 0;
            int equipoId = 0;

            try {
                // Preparar la consulta para obtener los datos del reporte
                st = conexion.prepareStatement("SELECT titulo, descripcion, area, usuarioId, equipoId FROM Reporte WHERE id = ?");
                st.setString(1, id);
                rs = st.executeQuery();

                if (rs.next()) {
                    titulo = rs.getString("titulo");
                    descripcion = rs.getString("descripcion");
                    area = rs.getString("area");
                    usuarioId = rs.getInt("usuarioId");
                    equipoId = rs.getInt("equipoId");
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error al cargar datos: " + e.getMessage() + "</div>");
            }
        %>

        <form role="form" action="actualizarRegistro.jsp" method="POST">
            <div class="col-md-10">
                
                
                <input type="hidden" name="id" value="<%= id %>">

                <div class="form-group">
                    <label for="titulo">Título:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="titulo" id="titulo" value="<%= titulo %>" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <div class="input-group">
                        <textarea class="form-control" name="descripcion" id="descripcion" rows="5" required><%= descripcion %></textarea>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="area">Área:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="area" id="area" value="<%= area %>" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="usuarioId">ID Usuario:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="usuarioId" id="usuarioId" value="<%= usuarioId %>" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="equipoId">ID Equipo:</label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="equipoId" id="equipoId" value="<%= equipoId %>" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                        <center>
                            
                            <input type="submit" class="btn btn-info" value="Guardar cambios">

                        </center>
            </div>
        </form>
    </div>
</div>

</html>
</body>

