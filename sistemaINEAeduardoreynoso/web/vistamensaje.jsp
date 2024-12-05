<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Buscar Usuario</title>
    <style>
        .container {
            margin: 50px auto;
            max-width: 400px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Buscar Usuario por Nombre</h3>
        <form action="buscarid.jsp" method="post">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required />
            </div>
            <button type="submit">Buscar</button>
        </form>
    </div>
</body>
</html>
