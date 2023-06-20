<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html lang="zh-Hants">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Oh GymGym-活動</title>
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
	href="gymcss/style.css" />
<link rel="stylesheet"
	href="gymcss/style11.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
</head>

<body>
    	<%!public String encodeBase64(byte[] data) {
		return Base64.getEncoder().encodeToString(data);
	}%>
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
						<a class="navbtn " href="user.html" data-toggle="modal"
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
		<div>
			<table class="table caption-top">
				<h1>活動總覽</h1>
				<form
					action="insertForm"
					method="get">
					<button type="submit">新增</button>
				</form>
				<thead>
					<tr>
						<th scope="col">活動編號</th>
						<th scope="col">活動名稱</th>
						<th scope="col">活動內容</th>
						<th scope="col">活動封面圖片</th>
						<th scope="col">活動日期</th>
						<th scope="col">活動地點</th>
						<th scope="col">活動狀態</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${aBeanList}" var="aBean" varStatus="s">
						<tr>
							<th scope="row">${aBean.activityId}</th>
							<td>${aBean.activityName}</td>
							<td style="max-width: 18ch;">${aBean.activityContent}</td>
							<td><img
								src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(aBean.activityCover)}"
								style="width: 350px; height: 280px;" /></td>
							<td>${aBean.activityDate}</td>
							<td>${aBean.activityLocation}</td>
							<td>${aBean.activityStatus}</td>
							<td>
								<form
									action="updateForm"
									method="get">
									<input type="hidden" name="activityId" value="${aBean.activityId}">
									<button type="submit">修改</button>
								</form>
							</td>
							<td>
								<form
									action="delete"
									method="get">
									<input type="hidden" name="activityId"
										value="${aBean.activityId}">
									<button type="button" class="delete-btn">刪除</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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
	<script>
		$(document).ready(
				function() {
					$('.delete-btn').click(
							function() {
								var activityId = $(this).closest('form').find(
										'input[name="activityId"]').val();
								var confirmed = confirm("您確定要刪除這個活動嗎？");
								if (confirmed) {
									// 使用者確認刪除，提交表單
									$(this).closest('form').submit();
								}
							});
				});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>