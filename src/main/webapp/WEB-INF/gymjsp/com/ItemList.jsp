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
			integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="icon" href="https://cdn1.iconfinder.com/data/icons/diet-and-nutrition-7/64/weights-gym-fitness-exercise-workout-256.png" type="image/x-icon" />
    	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/gymcss/com/ItemList.css?ver=123">
            <!-- JQ -->
    <script src="${pageContext.request.contextPath}/Js/jquery-3.6.4.min.js"></script>

    <title>商品列表</title>
</head>

<body>
<% String basePath=request.getScheme() + "://" + request.getServerName() + ":" +
							request.getServerPort() + request.getContextPath() + "/" ; %>
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
					</div>
				</div>
			</nav>
		</header>
	</div>
	
    <div class="add-new-item">
        <a href="addItemPage"><span>新增商品</span></a>
    </div>
    
    <!-- 包起整體頁面的div -->
    <div class="wholePageContent">
    	<main class="main-content">
        	<font color="red">${msg}<br><br></font>
            <c:forEach items="${comList}" var="com">
            <input type="hidden" name="comId" value="${com.comId}">
            <div class="card com-list" >
            	<div class="add-input">
                	<div id="carouselExampleControls-${com.comId}" class="carousel slide" data-ride="carousel">
                    	<div class="carousel-inner rollImgDiv">
                        	<c:set var="currentIndex" value="1" />
                            <c:forEach items="${com.comPicInfo}" var="entry">
                            <div class=" ${currentIndex == 1 ? 'carousel-item active' : 'carousel-item'}">
                            	<img src="data:image/png;base64,${entry.value}" class="d-block rollImg" alt="Slide ${entry.key + 1}">
                                <div class="btn btn-light imgBtn" name="imageId" data-imgId="${entry.key}" data-comId="${com.comId }">
                                	更新
                                </div>
                            </div>
                            <c:set var="currentIndex" value="${currentIndex + 1}" />
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls-${com.comId}" role="button" data-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls-${com.comId}" role="button" data-slide="next">
                        	<span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                   	</div>
               </div>
			<div class="card-body cardContent">
            	<div>
                	商品:<input type="text" value="${com.comName}" name="comName" readonly>
                </div>
                <div>
                	數量:<input type="text" value="${com.comNumber}" name="comNumber" readonly>
                </div>
                <div>
                	價格:<input type="text" value="${com.comPrice}" name="comPrice" readonly>
                </div>
                <div class="add-input">
                	<label for="comType-${com.comId}">商品類型: </label>
                    	<select name="comType" id="comType-${com.comId}" disabled>
                        	<option value="上衣" ${com.comType=='上衣' ? 'selected' : '' }>上衣</option>
                            <option value="褲子" ${com.comType=='褲子' ? 'selected' : '' }>褲子</option>
                        	<option value="護具" ${com.comType=='護具' ? 'selected' : '' }>護具</option>
                        	<option value="配件" ${com.comType=='配件' ? 'selected' : '' }>配件</option>
                        </select>
                </div>
                <div class="add-input">
	            	<label for="comStatus-${com.comId}">商品狀態: </label>
	            	<select name="comStatus" id="comStatus-${com.comId}" disabled>
                    	<option value="上架" ${com.comStatus=='上架' ? 'selected' : '' }>上架</option>
                    	<option value="下架" ${com.comStatus=='下架' ? 'selected' : '' }>下架</option>
                	</select>
                </div>
                <div>
                	描述:<textarea name="comContent"  cols="20" rows="5" placeholder="${com.comContent}" readonly resized="none"></textarea>
                </div>
                
                <!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal-${com.comId}" data-comId="${com.comId}">修改商品資訊</button>

                 <!-- Modal -->
                 <div class="modal fade" id="exampleModal-${com.comId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                 	<div class="modal-dialog" role="document">
                    	<div class="modal-content">
                        	<div class="modal-header">
                            	<h5 class="modal-title" id="exampleModalLabel">商品資訊</h5>
                            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                	<span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            	<font color="red">${msg}<br><br></font>
                                <div class="add-input">
                                	<label for="comNameAjax-${com.comId}">商品名稱: </label>
                                    	<input type="text" name="comName" id="comNameAjax-${com.comId}" required value="${com.comName }">
                                </div>
                                <div class="add-input">
                                	<label for="comNumberAjax-${com.comId}">商品數量: </label>
                                    <input type="text" name="comNumber" id="comNumberAjax-${com.comId}" required pattern="[0-9]+" value="${com.comNumber }" >
                                </div>
                                <div class="add-input">
                                	<label for="comPriceAjax-${com.comId}">商品價格: </label>
                                	<input type="text" name="comPrice" id="comPriceAjax-${com.comId}" required pattern="[0-9]+" value="${com.comPrice }">
                                </div>
                                <div class="add-input">
                                	<label for="comTypeAjax-${com.comId}">商品類型: </label>
                                	<select name="comType" id="comTypeAjax-${com.comId}">
                                    	<option value="上衣" ${com.comType=='上衣' ? 'selected' : '' }>上衣</option>
					                    <option value="褲子" ${com.comType=='褲子' ? 'selected' : '' }>褲子</option>
					                    <option value="護具" ${com.comType=='護具' ? 'selected' : '' }>護具</option>
					                    <option value="配件" ${com.comType=='配件' ? 'selected' : '' }>配件</option>
                                    </select>
                                </div>
                                <div class="add-input">
                                	<label for="comStatusAjax-${com.comId}">商品狀態: </label>
                                    <select name="comStatus" id="comStatusAjax-${com.comId}">
	                                    <option value="上架" ${com.comStatus=='上架' ? 'selected' : '' }>上架</option>
	                                    <option value="下架" ${com.comStatus=='下架' ? 'selected' : '' }>下架</option>
                                    </select>
                                </div>
                                <div class="add-input">
                                	<label for="comContentAjax-${com.comId}">商品描述: </label>
                                    <textarea name="comContent" id="comContentAjax-${com.comId}" cols="30" rows="5" autocomplete="off" placeholder="${com.comContent }">${com.comContent}</textarea>
                                </div>
                                <div class="preview">
                                	<img id="previewImg">
                                </div>
                                <div class="comConfirm">
                                	<input type="hidden" name="userState" value="editCom">
                                </div>
                            </div>
                            <div class="modal-footer">
                            	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="reset()">Close</button>
                                <button type="button" id="saveChangesBtn-${com.comId }" class="btn btn-primary" onclick="saveChanges(this)">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- model End -->
            </div>
        </div>
        </c:forEach>
    	</main>
	</div>

    <!--Aside-->
    <div class="div-aside">
        <aside class="aside">
            <!-- Aside content here -->
    	<div>
	    	<p>搜尋條件</p>
		    <div class="aside-search">
		    	<form action="checkByKeyword.func" method="post">
		        	<input type="hidden" name="userState" value="searchByName">
		        	<input type="search" name="keywords" placeholder="請輸入查詢" style="width: 10vw;">
		        	<input type="submit" value="查詢">
		        </form>
		    </div>
		    <div class="aside-search">
		    	<form action="sortByPrice.func" method="post">
		    		<input type="hidden" name="userState" value="sortByPrice">
		        	<select name="sortPrice">
			        	<option value="0">價格高至低</option>
			        	<option value="1">價格低至高</option>
		            </select>
		            <input type="submit" value="查詢">
		        </form>
			</div>
			<div class="aside-search">
				<form action="sortByType.func" method="post">
					<input type="hidden" name="userState" value="searchByType">
		        	<select name="sortType">
			        	<option value="上衣">上衣</option>
			            <option value="褲子">褲子</option>
			            <option value="護具">護具</option>
			            <option value="配件">配件</option>
		            </select>
		            <input type="submit" value="查詢">
				</form>
			</div>
			<div class="aside-search">
				<form action="sortByStatus.func" method="post">
					<input type="hidden" name="userState" value="searchByStatus">
		        	<select name="sortSattus">
			        	<option value="上架">上架</option>
			            <option value="下架">下架</option>
		            </select>
		            <input type="submit" value="查詢">
				</form>
			</div>
		</div>
        </aside>
    </div>




    <!--回到上方按鈕-->
    <button id="back-to-top-btn" title="回到頁面頂端">
        <i class="fas fa-arrow-up">TOP</i>
    </button>

 <!-- SweetAlert2框框 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
    <!-- 修改圖片 -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
	  
    var imgBtns = document.getElementsByClassName('imgBtn');
    var basePath = "<%=basePath%>";

    for (var i = 0; i < imgBtns.length; i++) {
      imgBtns[i].addEventListener('click', function() {
        var imageId = this.getAttribute('data-imgId'); // 獲取存在 data-imgId 屬性中的值
        var comId = this.getAttribute('data-comId'); // 獲取存在 data-imgId 屬性中的值

        
        var input = document.createElement('input');
        input.type = 'file';
        
        input.addEventListener('change', function() {
          var file = input.files[0];
          
          var formData = new FormData();
          
          formData.append('comId', comId);
          formData.append('imageId', imageId);
          formData.append('imageFile', file);
          
          var xhr = new XMLHttpRequest();
          
          xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
              console.log('圖片上傳成功');
              location.reload(); // 刷新頁面
            } else if (xhr.readyState === 4 && xhr.status !== 200) {
              console.log('圖片上傳失敗');
            }
          };
          
          xhr.open('POST', 'editOnePic.func', true);
          xhr.send(formData);
        });
        
        input.click();
      });
    }
  });
</script>

<!-- 修改商品資訊 -->
<script>

function saveChanges(button) {
    var comId = button.getAttribute("id").split("-")[1];
    console.log(comId);
    var comName = document.getElementById("comNameAjax-" + comId).value;
    var comNumber = document.getElementById("comNumberAjax-" + comId).value;
    var comPrice = document.getElementById("comPriceAjax-" + comId).value;
    var comType = document.getElementById("comTypeAjax-" + comId).value;
    var comStatus = document.getElementById("comStatusAjax-" + comId).value;
    var comContent = document.getElementById("comContentAjax-" + comId).value;

    Swal.fire({
        title: '確定要修改嗎？',
        text: "此操作將無法還原！",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '是的，修改它！'
    }).then((result) => {
        if (result.isConfirmed) {
            // 將值傳遞給 Servlet
            var formData = new FormData();
            formData.append("comId", comId);
            formData.append("comNameAjax", comName);
            formData.append("comNumberAjax", comNumber);
            formData.append("comPriceAjax", comPrice);
            formData.append("comTypeAjax", comType);
            formData.append("comStatusAjax", comStatus);
            formData.append("comContentAjax", comContent);

            var basePath = "<%=basePath%>";
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'editItemInfo.func', true);
            xhr.onreadystatechange = function () {
            	if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        // 請在需要時處理回應
                        Swal.fire({
                            title: '修改成功!',
                            icon: 'success',
                            confirmButtonText: '確定'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload(); // 刷新頁面
                            }
                        });
                    } else {
                        console.log('修改失敗 - 狀態碼: ' + xhr.status + ', 錯誤訊息: ' + xhr.statusText);
                    }
                }
            };
            xhr.send(formData);
        }
    });
}
</script>

<!-- close按 -->
<script>
    function reset() {
        location.reload();
    }
</script>


    
    <!-- Bootstrap JS JQ -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

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