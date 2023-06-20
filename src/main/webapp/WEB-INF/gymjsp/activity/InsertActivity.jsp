<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="gymcss/activity/style11.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
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
                        <a class="navbtn " href="user.html" data-toggle="modal" data-target="#exampleModal1"><img
                                src="${pageContext.request.contextPath}/images/user__icon_new.png" alt="Custom Icon" height="30px" width="30px"></a>
                        <a class="navbtn" href="./cart.html"><img src="${pageContext.request.contextPath}/images/cart_new.jpg" alt="Custom Icon"
                                height="30px" width="30px"></a>
                        <a class="navbtn" href="#" data-toggle="modal" data-target="#exampleModal3"><img
                                src="${pageContext.request.contextPath}/images/message_new.png" alt="Custom Icon" height="30px" width="30px"></a>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                            <button type="submit" class="btn btn-outline-secondary">
                                Search
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
		<section class="w3l-simple-contact-form1">
			<div class="contact-form section-gap">
				<div class="wrapper">
					<div class="contact-form" style="max-width: 450px; margin: 0 auto;">
						<div class="form-mid">
							<form action="insert"
								method="post" enctype="multipart/form-data">
								<h2>Insert Data</h2>
								<div class="field">
									<input type="text" class="form-control" id="activityName"
										name="activityName" value="${aBean.activityName}"
										placeholder="活動名稱" required>
								</div>
								<div class="field">
									<input type="text" class="form-control" id="activityDate"
										name="activityDate" value="${aBean.activityDate}"
										placeholder="活動日期" required>
								</div>
								<div class="field">
									<input type="text" class="form-control" id="activityLocation"
										name="activityLocation" value="${aBean.activityLocation}"
										placeholder="活動地點" required>
								</div>
								<div class="field">
									<input type="text" class="form-control" id="activityStatus"
										name="activityStatus" value="${aBean.activityStatus}"
										placeholder="活動狀態" required>
								</div>
								<div class="field">
									<input type="file" class="form-control" id="activityCover"
										name="activityCover" value="${aBean.activityCover}"
										placeholder="活動封面" required>
								</div>
								<textarea name="activityContent" id="activityContent"
									class="form-control" value="${aBean.activityContent}"
									placeholder="活動內容" style="height: 5em; line-height: 1.5em; max-height: 7.5em; resize: none;" required></textarea>
								<button type="submit" class="btn btn-contact" id="insert-btn" onclick="return confirm('您確定要新增這個活動嗎？')">確定</button>
								<button type="reset" class="btn btn-contact">取消</button>
								<button type="button" class="btn btn-contact" id="fill-form-btn">一鍵輸入</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
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
	$(document).ready(function() {
		// 監聽一鍵輸入按鈕點擊事件
		$('#fill-form-btn').click(function() {
			// 輸入表單欄位
			$('#activityName').val('關子嶺鐵馬行');
			$('#activityDate').val('2023-06-18');
			$('#activityLocation').val('嘉義市文化公園');
			$('#activityStatus').val('報名中');
			// 由於檔案上傳欄位無法預先輸入，這裡留空
			$('#activityCover').val('');
			$('#activityContent').val('好山、好湯、好食、好景，可說是體驗關子嶺風景區的最佳描述。俯瞰嘉南平原好景色，本次活動將帶領車友悠遊白河蓮花，看看全省最大賞蓮區，挑戰關子嶺雲萊庭院咖啡（標高540公尺），品嘗道地東山咖啡，探訪古廟名剎大仙寺和百年古廟碧雲寺、天然奇景水火洞等等，回程還可品嘗嘉義文化路美食，還在等什麼！一起來騎單車吧！！！');
		});

		$('#activityDate').datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		
</body>
</html>