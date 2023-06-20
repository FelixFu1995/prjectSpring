<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="icon"
        href="https://cdn1.iconfinder.com/data/icons/diet-and-nutrition-7/64/weights-gym-fitness-exercise-workout-256.png"
        type="image/x-icon" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/gymcss/com/OneItemList.css?ver=123">

    <title>修改商品</title>
</head>

<body>
 <% String basePath=request.getScheme() + "://" + request.getServerName() + ":" +
    request.getServerPort() + request.getContextPath() + "/" ; %>
    <!-- NAV BAR -->
    <div class="container-fluid">
		<header>
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
					<a class="navbar-brand" href="backHomePage">
					<i class="fa fas fa-solid fa-dumbbell"></i>Oh GymGym</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 課程 </a>
								<ul class="dropdown-menu">
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 線上購物 </a>
								<ul class="dropdown-menu">
									<li>
										<a class="dropdown-item" href="itemListPage.func"> 商品列表 </a>
									</li>
									<li>
										<a class="dropdown-item" href="#"> 訂單 </a>
									</li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 活動 </a>
								<ul class="dropdown-menu">

								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 論壇 </a>
								<ul class="dropdown-menu">

								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 會員 </a>
								<ul class="dropdown-menu">

								</ul>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
	</div>

    <div class="title">
        <h2>修改商品</h2>
    </div>
    <!-- 包起整體頁面的div -->
    <div class="wholePageContent">
        <main class="main-content"> 
        <c:forEach items="${OneComList}" var="com">
            <form action="#" method="post" enctype="multipart/form-data">
                <font color="red">${msg}<br><br></font>
            	<input type="hidden" name="comId" value="${com.comId}">
                <div class="add-input">
                    <input type="file" name="comPic" id="comPic" onchange="previewImage(this)" required>
                    <img src="data:image/png;base64,${com.comPicBase64}" class="comPic-preview" alt="Preview">
                </div>
                <div class="add-input">
                    <label for="comName">商品名稱: </label>
                    <input type="text" name="comName" id="comName" required value="${com.comName}">
                </div>
                <div class="add-input">
                    <label for="comNumber">商品數量: </label>
                    <input type="text" name="comNumber" id="comNumber" required pattern="[0-9]+" value="${com.comNumber }">
                </div>
                <div class="add-input">
                    <label for="comPrice">商品價格: </label>
                    <input type="text" name="comPrice" id="comPrice" required pattern="[0-9]+" value="${com.comPrice }">
                </div>
                <div class="add-input">
					<label for="comType">商品類型: </label>
				    <select name="comType" id="comType" >
				    	<option value="上衣" ${com.comType == '上衣' ? 'selected' : ''}>上衣</option>
						<option value="褲子" ${com.comType == '褲子' ? 'selected' : ''}>褲子</option>
						<option value="護具" ${com.comType == '護具' ? 'selected' : ''}>護具</option>
						<option value="配件" ${com.comType == '配件' ? 'selected' : ''}>配件</option>
					</select>
				</div>
                <div class="add-input">
                 	<label for="comStatus" >商品狀態: </label>
				    <select name="comStatus" id="comStatus" >
				    	<option value="上架" ${com.comStatus == '上架' ? 'selected' : ''}>上架</option>
				    	<option value="下架" ${com.comStatus == '下架' ? 'selected' : ''}>下架</option>
				    </select>
				</div>
                <div class="add-input">
                    <label for="comContent">商品描述: </label>
                    <textarea name="comContent" id="comContent" cols="30" rows="5" autocomplete="off" placeholder="${com.comContent}"></textarea>
                </div>
                <div class="preview">
                    <img id="previewImg">
                </div>
                <div class="comConfirm">
                    <input type="hidden" name="userState" value="editCom">
                    <div class="button-container">
                        <input type="submit" value="確認修改">
                    </div>
                </div>
            </form>
            <button onclick="goBack(event)" class="goback">上一頁</button>
            </c:forEach>
        </main>
    </div>






    <!--回到上方按鈕-->
    <button id="back-to-top-btn" title="回到頁面頂端">
        <i class="fas fa-arrow-up">TOP</i>
    </button>

    <script>
        // 當網頁滾動超過 20px 時，按鈕才會顯示
        window.onscroll = function () {
            scrollFunction();
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("back-to-top-btn").classList.remove("hide");
            } else {
                document.getElementById("back-to-top-btn").classList.add("hide");
            }
        }

        // 按下按鈕後回到頁面頂端
        document.getElementById("back-to-top-btn").onclick = function () {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        };
    </script>
 <script>
    // 預覽圖片
    function previewImage(input) {
        var previewImg = document.querySelector('#previewImg');
        var file = input.files[0];
        var reader = new FileReader();
        reader.onload = function(e) {
            previewImg.src = e.target.result;
        }
        console.log(file);
        reader.readAsDataURL(file);
    }
    function clearPreview() {
    var previewImg = document.querySelector('#previewImg');
    previewImg.src = "";
}
</script>

<script>
  function goBack(event) {
    event.stopPropagation(); // 停止事件傳播

    // 在這裡進行回到上一頁的操作
    location.href = 'itemListPage.func';
  }

  document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault(); // 取消表單提交事件

    if (confirm('您確定要修改資料嗎？')) {
      // 如果使用者按下“確定”按鈕，則提交表單
      document.querySelector('form').submit();
    } else {
      // 使用者按下“取消”按鈕，不提交表單
      // 可以在這裡執行相應的操作或清除表單內容
    }
  });
</script>


    <!-- Bootstrap JS JQ -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
</body>

</html>