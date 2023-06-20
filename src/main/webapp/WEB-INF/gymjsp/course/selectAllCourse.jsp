<%@page import="tw.gym.dao.course.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,tw.gym.model.course.CourseBean,tw.gym.model.course.ImageBean"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<%!@SuppressWarnings("unchecked")%>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>新增課程</title>

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
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>

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

				<div class="container-fluid" id="tabs">
					<ul>

						<%
						List<CourseBean> cbeans = (ArrayList<CourseBean>) request.getAttribute("cbeans");
						for (CourseBean cbean : cbeans) {
						%>
						<li><a href="#tabs-<%=cbean.getCourseId()%>"><%=cbean.getCourseName()%></a></li>
						<%
						}
						%>

					</ul>
					<%
					for (CourseBean cbean : cbeans) {
					%>

					<div id="tabs-<%=cbean.getCourseId()%>">
						<div class="dropdown" style="float: right">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false"></button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item" href="#"><form
											action="updateCourse" method="post">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-outline-secondary"
												data-bs-toggle="modal" data-bs-target="#staticBackdrop"
												onclick="updateCourse('<%=cbean.getCourseId()%>')">更新</button>
										</form></a></li>
								<li><a class="dropdown-item" href="#"><form
											action="deleteCourse.action" method="post"
											onsubmit="return confirm('確定要刪除這筆資料嗎？')">
											<button class="btn btn-outline-secondary" type="submit"
												name="courseId" value="<%=cbean.getCourseId()%>">刪除</button></a>
									</form></li>
								
							</ul>
						</div>
						<p>
						<div class="row">
							<div class="col-md-6  d-flex ">
								<div class="row">
									<div class="col-md-6">
										<h2>課程編號</h2>
									</div>
									<div class="col-md-6" id="CourseId">
										<h2><%=cbean.getCourseId()%></h2>
									</div>
									<hr>
									<div class="col-md-6">
										<h2>課程名稱</h2>

									</div>
									<div class="col-md-6" id="CourseName<%=cbean.getCourseId()%>">
										<h2><%=cbean.getCourseName()%></h2>
									</div>
									<hr>
									<div class="col-md-6">
										<h2>教練名稱</h2>
									</div>
									<div class="col-md-6" id="CoachName<%=cbean.getCourseId()%>">
										<h2><%=cbean.getCoachName()%></h2>
									</div>
									<hr>
									<div class="col-md-6">
										<h2>課程價格</h2>
									</div>
									<div class="col-md-6" id="CourseCost<%=cbean.getCourseId()%>">
										<h2><%=cbean.getCourseCost()%></h2>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="height: 500px">
								<div class="container p-5 img-fluid"
									style="background-color: gray">
									<div id="carouselExampleIndicators-<%=cbean.getCourseId()%>"
										class="carousel slide">

										<div class="carousel-inner">
											<%
											List<ImageBean> images = cbean.getImages();
											// 							for (ImageBean image : images) {
											for (int i = 0; i < images.size(); i++) {
												String imageDataStr = Base64.getEncoder().encodeToString(images.get(i).getImageData());
												String mimeType = images.get(i).getImgmimeType();
												String dataURI = "data:" + mimeType + ";base64," + imageDataStr;
												String a;
												if (i == 0) {
													a = "carousel-item active";
												} else {
													a = "carousel-item";
												} ;
											%>
											<div class="<%=a%>">
												<h2 style="text-align: center;"><%=i + 1%></h2>
												<form id="uploadForm" action="updateCourseImg.action" method="post"
													enctype="multipart/form-data"
													style="display: flex; justify-content: center;">
													<label class="upload_cover"> <input type="file"
														name="courseImg" id="upload_cover" style="display: none">
														<div
															style="overflow: hidden; width: 500px; height: 300px; display: flex; justify-content: center;">
															<img src="<%=dataURI%>" class="img-fluid mx-auto"
																alt="...">
														</div>
														<div class="d-grid gap-1 col-3 mx-auto mt-3 ">
															<button class="btn btn-light" type="submit"
																name="imageId" value="<%=images.get(i).getImageId()%>"
																; style="align-items: center;">更新</button>
														</div>

													</label>
												</form>
											</div>
											<%
											}
											%>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleIndicators-<%=cbean.getCourseId()%>"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleIndicators-<%=cbean.getCourseId()%>"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>

								</div>
							</div>


							<hr>
							<div class="col-md-12" style="text-align: center;">
								<h3>課程介紹</h3>
							</div>
							<div class="col-md-12"
								id="CourseIntroduce<%=cbean.getCourseId()%>">
								<br>
								<h3><%=cbean.getCourseIntroduce()%></h3>
							</div>

						</div>
						<%-- ${pageContext.request.contextPath}/images/gym33.avif --%>

						</p>
					</div>


					<%
					}
					%>

				</div>
				<div class="d-grid gap-1 col-2 mx-auto m-3 ">
					<input type="button" class="btn btn-outline-dark" name="Submit"
						value="返回" style="text-align: center;"
						onclick="location.href='AdminWebPage'">
				</div>
				<hr>
			</div>

		</article>

		<!-- 		更新彈跳視窗 -->
		<form method="post" action="updateCourse.action"
			onsubmit="return confirm('確定要更新這筆資料嗎？')"
			enctype="multipart/form-data">
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">更新課程資料</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<!-- 					更新內容 -->
						<div class="modal-body">

							<div class="mb-3">
								<label for="text1" class="form-label">課程編號 </label> <input
									type="text" readonly class="form-control" id="text1"
									name="courseId" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">請輸入課程編號</div>
							</div>
							<hr style="border: 1px solid black;">
							<div class="mb-3">
								<label for="text2" class="form-label">課程名稱 </label> <input
									type="text" class="form-control" id="text2" name="courseName"
									aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">請輸入課程名稱</div>
							</div>
							<hr style="border: 1px solid black;">
							<div class="mb-3">
								<label for="text3" class="form-label">教練名稱 </label> <input
									type="text" class="form-control" id="text3" name="coachName"
									aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">請輸入教練名稱</div>
							</div>
							<hr style="border: 1px solid black;">
							<div class="mb-3">
								<label for="text4" class="form-label">課程價格 </label> <input
									type="text" class="form-control" id="text4" name="courseCost"
									aria-describedby="emailHelp">
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

						</div>
						<div class="modal-footer d-flex justify-content-center">
							<button type="submit" class="btn btn-primary">更新</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</form>

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
	<script src="plugins/style.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script>
		function updateCourse(courseId) {
			// 在这里执行你想要的操作
			// 使用 courseId 进行相应的处理
			let courseName = document.getElementById('CourseName' + courseId).innerText;
			let coachName = document.getElementById('CoachName' + courseId).innerText;
			let courseCost = document.getElementById('CourseCost' + courseId).innerText;
			let courseIntroduce = document.getElementById('CourseIntroduce'
					+ courseId).innerText;
			console.log('Course ID:', courseId);
			console.log('Course Name:', courseName);
			console.log('Coach Name:', coachName);
			console.log('Course Cost:', courseCost);
			console.log('Course Introduce:', courseIntroduce);

			// 移除換行符號空白
			let trimmedIntroduce = courseIntroduce.replace(/\s+/g, ' ');

			document.getElementById('text1').value = courseId;
			document.getElementById('text2').value = courseName;
			document.getElementById('text3').value = coachName;
			document.getElementById('text4').value = courseCost;
			document.getElementById('text5').value = trimmedIntroduce;

		}
	</script>
	<script>
	$('.carousel').carousel({
		  interval: false
		})
	</script>

</body>

</html>