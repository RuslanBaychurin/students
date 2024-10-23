<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doczilla Университет - Информация о студенте</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 36px;
        }

        p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        .student-info {
            margin-bottom: 20px;
        }

        .student-info b {
            font-weight: bold;
            color: #333;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .actions form, .actions a {
            display: inline-block;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
        }

        .btn-back {
            background-color: #4CAF50;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Информация о студенте</h1>

    <div class="student-info">
        <p><b>ID:</b> ${student.id}</p>
        <p><b>Имя:</b> ${student.firstName}</p>
        <p><b>Фамилия:</b> ${student.lastName}</p>
        <p><b>Отчество:</b> ${student.middleName}</p>
        <p><b>Дата рождения:</b> ${student.birthDate}</p>
        <p><b>Группа:</b> ${student.groupName}</p>
        <p><b>Куратор:</b> ${student.curator}</p>
    </div>

    <div class="actions">
        <form action="/students/delete/user/id/${student.id}" method="post">
            <input type="submit" value="Отчислить" class="btn btn-delete"/>
        </form>

        <a href="/students/edit/user/id/${student.id}" class="btn btn-edit">Изменить данные</a>

        <a href="/students" class="btn btn-back">Назад к списку студентов</a>
    </div>
</div>

</body>
</html>
