<%-- 
    Document   : head
    Created on : 1/12/2024, 04:34:05 PM
    Author     : cantt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<title>Inicio de Sesión</title>
<style>
/* Estilos generales con diseño moderno */
body {
    font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
    background: linear-gradient(135deg, #e6f2ff 0%, #c1e1fc 100%);
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 100vh;
    color: #2c3e50;
}

/* Encabezado elegante */
header {
    background: linear-gradient(90deg, #2c3e50 0%, #34495e 100%);
    color: white;
    padding: 25px 0;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

/* Contenedor de login moderno */
.login-container {
    max-width: 460px;
    margin: 50px auto;
    background-color: white;
    padding: 40px;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(50, 50, 93, 0.12), 0 8px 20px rgba(0, 0, 0, 0.09);
    transition: all 0.4s ease;
    position: relative;
    overflow: hidden;
}

.login-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(90deg, #3498db 0%, #2980b9 100%);
}

.login-container:hover {
    transform: translateY(-12px);
    box-shadow: 0 25px 50px rgba(50, 50, 93, 0.15), 0 10px 25px rgba(0, 0, 0, 0.1);
}

.login-container h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-weight: 700;
    position: relative;
}

.login-container h1::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background: #3498db;
}

/* Campos del formulario con estilo */
form {
    display: flex;
    flex-direction: column;
}

label {
    font-size: 14px;
    color: #34495e;
    margin-bottom: 10px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

input {
    padding: 14px 16px;
    margin-bottom: 20px;
    border: 2px solid #e7eaf3;
    border-radius: 10px;
    font-size: 16px;
    transition: all 0.3s ease;
    background-color: #f9fafb;
}

input:focus {
    border-color: #3498db;
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.15);
    outline: none;
    background-color: white;
}

/* Botones con efecto de elevación */
button {
    padding: 15px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}

button:hover {
    background-color: #2980b9;
    transform: translateY(-4px);
    box-shadow: 0 8px 15px rgba(50, 50, 93, 0.12), 0 4px 8px rgba(0, 0, 0, 0.1);
}

button:active {
    transform: translateY(1px);
    box-shadow: none;
}

.register-btn {
    background-color: black;
    margin-top: 15px;
}

.register-btn:hover {
    background-color: black;
}

/* Mensajes de error con diseño moderno */
.alert {
    color: #e74c3c;
    background-color: #fef0f0;
    border: 2px solid #e74c3c;
    padding: 14px;
    border-radius: 10px;
    margin-bottom: 20px;
    font-size: 14px;
    text-align: center;
    position: relative;
}

.alert::before {
   
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
}

/* Footer elegante */
footer {
    background: linear-gradient(90deg, #2c3e50 0%, #34495e 100%);
    color: white;
    padding: 20px;
    text-align: center;
    font-size: 14px;
    margin-top: auto;
    box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.15);
}

footer p {
    margin: 5px 0;
    opacity: 0.9;
}

/* Responsive Design */
@media (max-width: 600px) {
    .login-container {
        width: 95%;
        margin: 30px auto;
        padding: 25px;
    }

    header {
        padding: 15px 0;
        font-size: 18px;
    }

    footer {
        font-size: 12px;
        padding: 15px;
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
</style>

    </head>
