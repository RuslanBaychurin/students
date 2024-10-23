<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Управление студентами | Doczilla Университет</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4CAF50;
            padding: 20px;
            color: white;
        }

        .header .university-name {
            font-size: 24px;
            font-weight: bold;
        }

        .header .account-icon {
            display: flex;
            align-items: center;
        }

        .header .account-icon img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .actions button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }

        .actions button:hover {
            background-color: #45a049;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .student-list {
            margin-top: 20px;
        }

        .student-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .student-info {
            display: flex;
            flex-direction: column;
        }

        .student-info p {
            margin: 0;
            font-size: 16px;
        }

        .student-actions a {
            text-decoration: none;
            padding: 6px 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            margin-left: 10px;
            font-size: 14px;
        }

        .student-actions a:hover {
            background-color: #45a049;
        }

        .button {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            font-size: 16px;
            display: inline-block;
            margin: 10px 0;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #b71c1c;
        }

        hr {
            margin-top: 30px;
            border: none;
            border-top: 1px solid #ddd;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.4s;
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 20px;
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: #000;
        }

        .modal-content h2 {
            text-align: center;
            font-size: 24px;
            color: #333;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .student-info p {
            font-size: 18px;
            margin: 10px 0;
            color: #555;
        }

        /* Кнопки */
        .actions {
            text-align: center;
            margin-top: 20px;
        }

        .actions .btn {
            text-decoration: none;
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            border: none;
            outline: none;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
            border: none;
            outline: none;
            transition: background-color 0.3s ease;
        }

        .btn-edit:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        input[type="text"],
        input[type="date"],
        select {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .submit-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="university-name">
        Doczilla Университет
    </div>
    <div class="account-icon">
        <img src="https://via.placeholder.com/40" alt="Account Icon">
        <span>Ректор</span>
    </div>
</div>

<div class="container">
    <div class="actions">
        <button id="addUser">Добавить студента</button>
    </div>

    <h1>Список студентов</h1>

    <div class="student-list">
        <#list students as sqlStudent>
            <div class="student-card">
                <div class="student-info">
                    <p>ID: ${sqlStudent.id}</p>
                    <p><b>${sqlStudent.firstName} ${sqlStudent.lastName}</b></p>
                    <p>Группа: ${sqlStudent.groupName}</p>
                </div>

                <div>
                    <button class="button" onclick="openStudentInfoModal(${sqlStudent.id}, '${sqlStudent.firstName}', '${sqlStudent.lastName}', '${sqlStudent.middleName}', '${sqlStudent.birthDate}', '${sqlStudent.groupName}', '${sqlStudent.curator}')">Подробнее</button>
                </div>
            </div>
        </#list>
    </div>

    <h2>Отчислить студента по ID</h2>
    <form action="/students/delete/user/by/id" method="post">
        <label for="studentId">ID студента:</label>
        <input type="number" id="studentId" name="id" required>
        <input type="submit" class="btn btn-delete" value="Отчислить студента">
    </form>
</div>



<div id="addUserModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Добавить студента</h2>
        <form action="/students/create" method="post">
            <label for="firstName">Имя:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Фамилия:</label>
            <input type="text" id="lastName" name="lastName" required>

            <label for="middleName">Отчество:</label>
            <input type="text" id="middleName" name="middleName" required>

            <label for="birthDate">Дата рождения:</label>

            <input type="date" id="birthDate" name="birthDate" required
                   min="1920-01-01" max="2024-01-01">


            <label for="groupName">Группа:</label>
            <select id="groupName" name="groupName" required>
                <option value="">Выберите группу</option>
                <option value="ИТ-101 – Информационные технологии">ИТ-101 – Информационные технологии</option>
                <option value="КБ-202 – Кибербезопасность">КБ-202 – Кибербезопасность</option>
                <option value="ИИ-303 – Искусственный интеллект">ИИ-303 – Искусственный интеллект</option>
                <option value="ЭК-404 – Электронная коммерция">ЭК-404 – Электронная коммерция</option>
            </select>

            <label for="curator">Выбор куратора:</label>
            <select id="curator" name="curator" required>
                <option value="">Выберите куратора</option>
                <option value="Иванов И.И.">Иванов И.И.</option>
                <option value="Петров П.П.">Петров П.П.</option>
                <option value="Сидоров С.С.">Сидоров С.С.</option>
                <option value="Кузнецова А.А.">Кузнецова А.А.</option>
            </select>

            <input type="submit" class="submit-btn" value="Добавить студента">
        </form>
    </div>
</div>



<div id="studentInfoModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeStudentInfoModal()">&times;</span>
        <h2>Информация о студенте</h2>

        <div class="student-info">
            <p><b>Имя:</b> <span id="studentFirstName"></span></p>
            <p><b>Фамилия:</b> <span id="studentLastName"></span></p>
            <p><b>Отчество:</b> <span id="studentMiddleName"></span></p>
            <p><b>Дата рождения:</b> <span id="studentBirthDate"></span></p>
            <p><b>Группа:</b> <span id="studentGroupName"></span></p>
            <p><b>Куратор:</b> <span id="studentCurator"></span></p>
        </div>

        <div class="actions">
            <form action="/students/delete/user/id/" method="post" id="deleteForm">
                <input type="submit" value="Отчислить" class="btn btn-delete"/>
            </form>

            <a href="#" id="editLink" class="btn btn-edit">Изменить данные</a>
        </div>
    </div>
</div>


<script>
    function openStudentInfoModal(id, firstName, lastName, middleName, birthDate, groupName, curator) {
        document.getElementById('studentFirstName').textContent = firstName;
        document.getElementById('studentLastName').textContent = lastName;
        document.getElementById('studentMiddleName').textContent = middleName;
        document.getElementById('studentBirthDate').textContent = birthDate;
        document.getElementById('studentGroupName').textContent = groupName;
        document.getElementById('studentCurator').textContent = curator;

        document.getElementById('deleteForm').action = '/students/delete/user/id/' + id;

        document.getElementById('editLink').href = '/students/edit/user/id/' + id;

        document.getElementById('studentInfoModal').style.display = 'block';
    }

    function closeStudentInfoModal() {
        document.getElementById('studentInfoModal').style.display = 'none';
    }

    window.onclick = function(event) {
        const modal = document.getElementById('studentInfoModal');
        if (event.target == modal) {
            closeStudentInfoModal();
        }
    }
</script>



<script>
    var modal = document.getElementById("addUserModal");

    var btnAddUser = document.getElementById("addUser");

    var span = document.getElementsByClassName("close")[0];

    btnAddUser.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>

