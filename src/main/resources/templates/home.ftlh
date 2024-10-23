<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Университет</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            margin-top: 100px;
        }

        h1 {
            font-size: 48px;
            color: #333;
        }

        p {
            font-size: 18px;
            color: #666;
            margin-top: 20px;
        }

        .login-btn {
            margin-top: 40px;
            padding: 10px 20px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .login-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Университет Doczilla</h1>
    <p>Добро пожаловать в систему управления данными студентов университета.</p>

    <button class="login-btn" onclick="window.location.href='/students'">Продолжить</button>
</div>
</body>
</html>
