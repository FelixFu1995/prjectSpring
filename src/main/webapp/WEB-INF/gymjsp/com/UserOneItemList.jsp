<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/gymcss/com/UserOneItemList.css?ver=123">

    <title>商品頁面</title>
</head>

<body>

    <!-- NAV BAR -->
    <div class="container-fluid">
    	<header>
	    	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	        	<div class="container-fluid">
	          		<a class="navbar-brand" href="homePage"><i class="fa fas fa-solid fa-dumbbell"></i> Oh GymGym</a>
	          		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
	            		aria-label="Toggle navigation">
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
			   	            	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 商城 </a>
			     	        	<ul class="dropdown-menu">
			                		<li>
			                			<a class="dropdown-item" href="userItemList.func"> 線上商城 </a>
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
		            	<a class="navbtn " href="#" data-toggle="modal" data-target="#exampleModal1">
		            		<img src="${pageContext.request.contextPath}/images/user__icon_new.png" alt="Custom Icon" height="30px" width="30px">
		            	</a>
		            	<a class="navbtn" href="getIntoCart.func">
		            		<img src="${pageContext.request.contextPath}/images/cart_new.jpg" alt="Custom Icon" height="30px" width="30px">
		            	</a>
		            	<a class="navbtn" href="#" data-toggle="modal" data-target="#exampleModal3">
		            		<img src="${pageContext.request.contextPath}/images/message_new.png" alt="Custom Icon" height="30px" width="30px">
		            	</a>
		            	<form class="d-flex" role="search">
		              		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
		              		<button type="submit" class="btn btn-outline-secondary">Search</button>
		            	</form>
	          		</div>
	        	</div>
	    	</nav>
    	</header>
    </div>

	   <!-- 包起整體頁面的div -->
	<div class="wholePageContent">
	    <!-- 麵包屑 -->
	    <div class="linkList">
	        <c:forEach items="${OneComList}" var="com">
	            <div aria-label="breadcrumb" class="links">
	                <ol class="breadcrumb">
	                    <li class="breadcrumb-item">
	                    	<a href="homePage">首頁</a>
	                    </li>
	                    <li class="breadcrumb-item">
	                    	<a href="userItemList.func">商品列表</a>
	                    </li>
	                    <li class="breadcrumb-item active" aria-current="page">
	                        <c:out value="${com.comName} "></c:out>
	                    </li>
	                </ol>
	            </div>
	        </c:forEach>
	    </div>
	    
	    <main class="main-content">
	        <font color="red">${msg}<br><br></font>
	        <c:forEach items="${OneComList}" var="com">
	            <div class="comPica">
	                <div id="carouselExampleControls-${com.comId}" class="carousel slide">
	                    <div class="carousel-inner rollImgDiv">
	                        <c:set var="currentIndex" value="1" />
	                        <c:forEach items="${com.comPicInfo}" var="entry">
	                            <div class=" ${currentIndex == 1 ? 'carousel-item active' : 'carousel-item'}">
	                                <img src="data:image/png;base64,${entry.value}" class="d-block rollImg"
	                                    alt="Slide ${entry.key + 1}" style="width:350px; height:350px">
	                                <c:set var="currentIndex" value="${currentIndex + 1}" />
	                            </div>
	                        </c:forEach>
	                    </div>
	                    <a class="carousel-control-prev" href="#carouselExampleControls-${com.comId}" role="button"
	                        data-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="sr-only">Previous</span>
	                    </a>
	                    <a class="carousel-control-next" href="#carouselExampleControls-${com.comId}" role="button"
	                        data-slide="next">
	                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                        <span class="sr-only">Next</span>
	                    </a>
	                </div>
	            </div>
	
	            <div class="itemContent">
	
	                <form action="userAddCart.func" method="post">
	                    <div class="itemName">
	                        <h1>${com.comName}</h1>
	                    </div>
	                    <div class="itemPriceLabel">
	                        <label >特價</label>
	                    </div>
	                    <div class="itemPrice">
	                        <h3><span style="color:red">$</span>${com.comPrice}</h3>
	                    </div>
	                    <div class="itemTypeLabel">
	                        <label >款式</label>
	                    </div>
	                    <div class="itemType">
	                        <h3>${com.comType}</h3>
	                    </div>
	                    <div class="itemNumber">
	                        <label >數量:</label>
	                        <input type="number" name="itemNumber" id="" value="1" min="1" max="99">
	                    </div>
	                    <input type="hidden" name="comId" value="${com.comId}">
	                    <input type="hidden" name="userState" id="" value="inputCart">
	                    <div class="inputSubmit">
	                        <input type="submit" value="加入購物車" id="addCart">
	                    </div>
	                    <div class="moveDescribe">
	                        <div class="itemdescribetLabel">
	                            <label >詳細介紹</label>
	                        </div>
	                        <div class="itemDescribe">
	                            <h4>${com.comContent}</h4>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </c:forEach>
	    </main>
	</div>
	
	
	<!-- footer -->
	<div class="footer">
	    <footer class="py-3 my-4">
	        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	            <li class="nav-item">
	                <a href="#" class="nav-link px-2 text-muted">關於我們</a>
	            </li>
	            <li class="nav-item">
	                <a href="#" class="nav-link px-2 text-muted">常見問題</a>
	            </li>
	            <li class="nav-item">
	                <a href="#" class="nav-link px-2 text-muted">服務條款</a>
	            </li>
	            <li class="nav-item">
	                <a href="#" class="nav-link px-2 text-muted">客服中心</a>
	            </li>
	        </ul>
	        <p class="text-center text-muted">
	            © 2023 Oh Gym Gym. All Rights Reserved.
	        </p>
	    </footer>
	</div>
	<!--回到上方按鈕-->
	<button id="back-to-top-btn" title="回到頁面頂端">
	    <i class="fas fa-arrow-up">TOP</i>
	</button>

       <!-- SweetAlert2框框 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- JQ -->
    <script src="${pageContext.request.contextPath}/Js/jquery-3.6.4.min.js"></script>
    
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
    <!-- 取消輪播 -->
    <script>
	
	    $(document).ready(function() {
	      $('.carousel').carousel({
	        interval: false,  //取消自動輪播
	      	pause: false    //滑鼠移入暫停
	      });
	    });
    </script>
    <!-- 按下購物車按鈕 -->
   <script>
	   $(function(){
		   $('#addCart').on('click', function(e){
		     e.preventDefault(); // 防止表單直接送出
	
		     Swal.fire({
		       title: '確定加入購物車？',
		       icon: 'question',
		       showCancelButton: true,
		       confirmButtonText: '加入',
		       cancelButtonText: '取消'
		     }).then((result) => {
		       if (result.isConfirmed) {
		         // 確認後送出表單
		         Swal.fire({
		            title: '加入成功!',
		            icon: 'success',
		            confirmButtonText: '確定'
		         }).then((result) => {
		             if (result.isConfirmed) {
		                $(this).closest('form').submit();
		             }
		         });
		       }
		     });
		   });
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