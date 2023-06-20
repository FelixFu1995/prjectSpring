<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
<html lang="zh-Hants">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Oh Gym Gym</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="icon"
        href="https://cdn1.iconfinder.com/data/icons/diet-and-nutrition-7/64/weights-gym-fitness-exercise-workout-256.png"
        type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/gymcss/style.css" />
    <!-- href加上 . 表示當前目錄(HTML文件所在的目錄),是讓排版從vscode或直接點html都不會跑掉 -->
    <!-- ./ 或都不要寫直接 plugins/style.css , 但建議習慣寫./-->
    <style>
        /* 置中表單並設定寬度 */
        form {
            width: 800px;
            margin: 0 auto;
            margin-top: 50px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 20px;
        }

        fieldset {
            border-radius: 10px;
            border: none;
            padding: 0;
        }

        legend {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* 增加選項間距 */
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            margin-left: 140px;
        }

        input,
        select {
            display: block;
            width: 50%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            margin: auto;
        }

        input {
            width: 50%;

            color: black;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 10px;
            border-radius: 8px;
            margin: auto;
        }

        input[type="submit"] {
            width: 20%;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 10px;
            border-radius: 8px;
            margin-top: 20px;
            display: inline;
            margin: auto;

        }

        .btn-primary {
            width: 20%;
            background-color: #ff0000;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 10px;
            border-radius: 8px;
            margin-top: 20px;
            display: inline;
            margin: auto;

        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .navbar .nav-item .nav-link:hover {
            color: #007bff;
        }
    </style>
    <script>
        function populateAddressOptions() {
            const addressOptions = [
                "基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣",
                "台中市", "彰化縣", "南投縣", "雲林縣", "嘉義市", "嘉義縣", "台南市",
                "高雄市", "屏東縣", "台東縣", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣"
            ];

            const userAddressFirst = document.getElementById('userAddressFirst');
            addressOptions.forEach(optionValue => {
                const option = document.createElement('option');
                option.value = optionValue;
                option.textContent = optionValue;
                userAddressFirst.appendChild(option);
            });
        }

        function validatePasswordMatch() {
            var password = document.getElementById("userPassword").value;
            var confirmPassword = document.getElementById("userPasswordCheck").value;

            if (password !== confirmPassword) {
                alert("密碼和確認密碼不一致，請重新輸入。");
                return false;
            }
            return true;
        }
    </script>
</head>

<body onload="populateAddressOptions()">
    <div class="container-fluid">
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../FirstPage/FirstPage.jsp"><i
                            class="fa fas fa-solid fa-dumbbell"></i> Oh GymGym</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    課程
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">1</a></li>
                                    <li><a class="dropdown-item" href="#">2</a></li>
                                    <li><a class="dropdown-item" href="#">3</a></li>
                                    <li><a class="dropdown-item" href="#">4</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    線上購物
                                </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ComServlet?userState=checkCom">商品列表</a></li>
                                <li><a class="dropdown-item" href="#">訂單</a></li>

                            </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    活動
                                </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/ActivityServlet?action=selectAll">近期賽事</a>
									</li>
								</ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    論壇
                                </a>
                              <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/GetAllArticle">論壇首頁</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/html/FitnessInsertPage.html">新增文章</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/html/FitnessSelectPage.html">查詢文章</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    會員
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">1</a></li>
                                    <li><a class="dropdown-item" href="#">2</a></li>
                                    <li><a class="dropdown-item" href="#">3</a></li>
                                    <li><a class="dropdown-item" href="#">4</a></li>
                                </ul>
                            </li>
                        </ul>


                    </div>
                </div>
            </nav>
        </header>
    </div>
    <div class="container">
        <form action="checkRegister" method="POST" onsubmit="return validatePasswordMatch()">
            <fieldset>
                <legend>註冊資訊</legend>

                <label for="userAccount">帳號：</label>
                <input type="text" id="userAccount" name="userAccount" required
                    oninvalid="this.setCustomValidity('請輸入1-20個字元的英文字母或數字');" oninput="this.setCustomValidity('');"><br>


                <label for="userPassword">密碼：</label>
                <input type="password" id="userPassword" name="userPassword" required
                    oninvalid="this.setCustomValidity('請輸入1-20個字元的英文字母或數字');" oninput="this.setCustomValidity('');"><br>

                <label for="userPasswordCheck">確認密碼：</label>
                <input type="password" id="userPasswordCheck" name="userPasswordCheck" pattern="^[a-zA-Z0-9]{1,20}$"
                    required oninvalid="this.setCustomValidity('請輸入1-20個字元的英文字母或數字');"
                    oninput="this.setCustomValidity('');"><br>
              
                <label for="userName">姓名：</label>
                <input type="text" id="userName" name="userName" required><br>
                
                <label for="userNickName">暱名：</label>
                <input type="text" id="userNickName" name="userNickName" required><br>
              
                <label for="userGender">性別：</label>
                <select id="userGender" name="userGender" required>
                    <option value="">選擇性別</option>
                    <option value="male">男</option>
                    <option value="female">女</option>
                </select><br>
 
                <label for="userAddressFirst">地址：</label>
                <select id="userAddressFirst" name="userAddressFirst" required>
                    <option value="">行政區</option>
                </select>
                <input type="text" id="userAddressDetail" name="userAddressDetail" placeholder="XX市(區) XX街(路)XX"
                    required><br>
               
                <label for="userTel">電話：</label>
                <input type="tel" id="userTel" name="userTel" required><br>

                <label for="userEmail">信箱：</label>
                <input type="email" id="userEmail" name="userEmail" required><br>
                
                <label for="userBirthDay">出生日期：</label>
                <input type="date" id="userBirthDay" name="userBirthDay" required><br>
 
                <div class="button-container">
                    <a href="../FirstPage/FirstPage.jsp" class="btn btn-primary" role="button">取消</a>
                    <input type="submit" value="註冊">
                </div>  
            </fieldset>
        </form>
    </div>


    <script src="plugins/style.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script>

        function submitForm(event) {
            event.preventDefault();
            if (!validatePasswordMatch()) {
                return;
            }

            const formData = new FormData(document.querySelector('form'));

            fetch('../Resgister', {
                method: 'POST',
                body: formData,
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('註冊成功！');
                    window.location.href = '../FirstPage/FirstPage.jsp';
                } else {
                    alert('註冊失敗，請再試一次。');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('註冊失敗，請再試一次。');
            });
        }
        </script>
</body>

</html>