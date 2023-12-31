<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,tw.gym.model.course.CourseBean"%>

<!DOCTYPE html>
<html lang="zh-Hants">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>員工資料</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="icon"
	href="https://cdn1.iconfinder.com/data/icons/diet-and-nutrition-7/64/weights-gym-fitness-exercise-workout-256.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/gymcss/course/coursestyle.css" />
		<link rel="stylesheet"
	href="gymcss/style.css" /> 
</head>
<body>
    <div class="container-fluid">
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="AdminWebPage"><i class="fa fas fa-solid fa-dumbbell"></i> Oh GymGym</a>
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
                                    <li><a class="dropdown-item" href="insertCourse.controller">新增課程</a></li>
                                    <li><a class="dropdown-item" href="selectAllCourse.action">全部課程</a></li>
                                </ul>
                            </li>
                           <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                線上購物
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="itemListPage.func">商品列表</a></li>
                                <li><a class="dropdown-item" href="#">訂單</a></li>

                            </ul>
                        </li>
                            <li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
									活動 </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="selectAll">近期賽事</a>
									</li>
								</ul></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    論壇
                                </a>
                              <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="getAllArticle">論壇首頁</a></li>
                                    <li><a class="dropdown-item" href="articleInsertPage">新增文章</a></li>
                                    <li><a class="dropdown-item" href="articleSelectPage">查詢文章</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    管理員
                                </a>
                                <form id="logoutForm" method="POST" action="logout">
								</form>
                               <ul class="dropdown-menu">
								    <li><a class="dropdown-item" href="MemberQuery">會員查詢列表</a></li>
								    <li><a class="dropdown-item" href="#" onclick="document.getElementById('logoutForm').submit()">登出</a></li>
								</ul>
                            </li>
                        </ul>
						<a class="navbtn " href="#" data-toggle="modal"
							data-target="#exampleModal1"><img
							src="${pageContext.request.contextPath}/images/user__icon_new.png"
							alt="Custom Icon" height="30px" width="30px"></a> <a
							class="navbtn" href="./cart.html"><img
							src="${pageContext.request.contextPath}/images/cart_new.jpg"
							alt="Custom Icon" height="30px" width="30px"></a> <a
							class="navbtn" href="#" data-toggle="modal"
							data-target="#exampleModal3"><img
							src="${pageContext.request.contextPath}/images/message_new.png"
							alt="Custom Icon" height="30px" width="30px"></a>
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search" />
							<button type="submit" class="btn btn-outline-secondary">
								Search</button>
						</form>
					</div>
				</div>
			</nav>
		</header>
		<article style="background-color: #cfcbcb;">
			<div class="container">
					<form method="post" action="insertCourse.action"
						onsubmit="return confirm('確定要新增這筆課程嗎？')"
						enctype="multipart/form-data">
				<div class="container-fluid" style="background-color: #fff;">
						<div class="row">
							<div class="col"></div>
							<div class="col-6">
								<h2 class="m-3" style="text-align: center;">新增課程</h2>
								<div class="mb-3">
									<label for="text1" class="form-label">課程名稱 </label> <input
										type="text" class="form-control" id="text1" name="courseName"
										autofocus autocomplete="off" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">請輸入課程名稱</div>
								</div>
								<hr style="border: 1px solid black;">
								<div class="mb-3">
									<label for="text2" class="form-label">教練姓名 </label> <input
										type="text" class="form-control" id="text2" name="coachName"
										autofocus autocomplete="off" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">請輸入教練姓名</div>
								</div>
								<hr style="border: 1px solid black;">
								<div>
									<div class="mb-3">
										<label for="formFileLg" class="form-label">上傳教練圖片</label> <input
											class="form-control form-control-lg" id="formFileLg"
											type="file" name="courseImg"  multiple="multiple">
									</div>
								</div>
								<hr style="border: 1px solid black;">
								<div class="mb-3">
									<label for="text3" class="form-label">課程價格 </label> <input
										type="text" class="form-control" id="text3" name="courseCost"
										autofocus autocomplete="off" aria-describedby="emailHelp" oninput="value=value.replace(/[^\d]/g,'')">
									<div id="emailHelp" class="form-text">請輸入課程價格</div>
								</div>
								<hr style="border: 1px solid black;">
								<div class="mb-3">
									<div class="form-group">
										<label for="text5" class="form-label">課程介紹</label>
										<textarea class="form-control" rows="5" id="text5"
											name="courseIntroduce" aria-describedby="emailHelp"></textarea>
										<div id="emailHelp" class="form-text">請輸入課程介紹</div>
									</div>
								</div>
								<hr>
								<div>
									<div class="mb-3">
										<label for="formFileLg" class="form-label">上傳課程圖片</label> <input
											class="form-control form-control-lg" id="formFileLg"
											type="file" name="courseImg"  multiple="multiple">
									</div>
								</div>
								

							</div>
							<div class="col"></div>
						</div>
						<hr>
				</div>
				<div class="d-grid gap-1 col-2 mx-auto m-3 d-md-block">
					<input type="submit" class="btn btn-outline-dark" name="Submit"
						value="確定" style="text-align: center;"> <input
						type="button" class="btn btn-outline-dark" name="Submit"
						value="取消" style="text-align: center;"
						onclick="location.href='${pageContext.request.contextPath}/selectAllCourse'">
				</div>
				</form>
				<hr>
			</div>
		</article>
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">關於我們</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">常見問題</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">服務條款</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">客服中心</a></li>
			</ul>
			<p class="text-center text-muted">© 2023 Oh Gym Gym. All Rights
				Reserved.</p>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>