<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doczilla Университет - Редактировать данные студента</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e8f5e9;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            padding: 25px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2e7d32;
            font-size: 30px;
            font-weight: bold;
            text-transform: uppercase;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-size: 16px;
            color: #424242;
        }

        input, select {
            padding: 12px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn-submit {
            background-color: #388e3c;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #2e7d32;
        }

        .btn-back {
            background-color: #1976d2;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #1565c0;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .hint {
            font-size: 14px;
            color: #757575;
            text-align: center;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Редактировать студента</h1>


    <form action="/students/update" method="post">
        <input type="hidden" name="id" value="${student.id}"/>

        <label for="firstName">Имя:</label>
        <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>

        <label for="lastName">Фамилия:</label>
        <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>

        <label for="middleName">Отчество:</label>
        <input type="text" id="middleName" name="middleName" value="${student.middleName}" required>

        <label for="birthDate">Дата рождения:</label>

        <input type="date" id="birthDate" name="birthDate" value="${student.birthDate}" required
               min="1920-01-01" max="2024-01-01">

        <label for="groupName">Группа:</label>
        <select id="groupName" name="groupName">
            <option value="${student.groupName}">${student.groupName}</option>
            <option value="ИТ-101 – Информационные технологии">ИТ-101 – Информационные технологии</option>
            <option value="КБ-202 – Кибербезопасность">КБ-202 – Кибербезопасность</option>
            <option value="ИИ-303 – Искусственный интеллект">ИИ-303 – Искусственный интеллект</option>
            <option value="ЭК-404 – Электронная коммерция">ЭК-404 – Электронная коммерция</option>
        </select>

        <label for="curator">Куратор:</label>
        <select id="curator" name="curator">
            <option value="${student.curator}">${student.curator}</option>
            <option value="Иванов И.И.">Иванов И.И.</option>
            <option value="Петров П.П.">Петров П.П.</option>
            <option value="Сидоров С.С.">Сидоров С.С.</option>
            <option value="Кузнецова А.А.">Кузнецова А.А.</option>
        </select>

        <div class="buttons">
            <form action="/students/update" method="post">
                <input type="submit" class="btn-submit" value="Сохранить"/>
            </form>

            <a href="/students" class="btn-back">Назад</a>
        </div>
    </form>
</div>

</body>
</html>
