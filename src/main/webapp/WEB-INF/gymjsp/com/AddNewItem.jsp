<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/gymcss/com/AddNewItem.css?ver=123">

    <title>新增商品</title>
</head>

<body>

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
        <h2>新增商品</h2>
    </div>
    <!-- 包起整體頁面的div -->
    <div class="wholePageContent">
        <main class="main-content"> 
        <font color="red">${msg}<br><br></font>
            <form action="addItem.func" method="post" enctype="multipart/form-data">
                <div class="add-input">
                    <label for="comName"><span style="color:red">*</span>商品名稱: </label>
                    <input type="text" name="comName" id="comName" required >
                </div>
                <div class="add-input">
                    <label for="comNum"><span style="color:red">*</span>商品數量: </label>
                    <input type="text" name="comNumber" id="comNum" pattern="[1-9][0-9]{0,2}" max="999" placeholder="ex:99,999" required >
                </div>
                <div class="add-input">
                    <label for="comPrice"><span style="color:red">*</span>商品價格: </label>
                    <input type="text" name="comPrice" id="comPrice" pattern="[1-9][0-9]{0,4}" placeholder="不能為0" required>
                </div>
                <div class="add-input">
                    <label for="comType"><span style="color:red">*</span>商品類型: </label>
                    <select name="comType" id="comType">
                        <option value="上衣">上衣</option>
                        <option value="褲子">褲子</option>
                        <option value="護具">護具</option>
                        <option value="配件">配件</option>
                    </select>
                </div>
                <div class="add-input">
                    <label for="comStatus"><span style="color:red">*</span>商品狀態: </label>
                    <select name="comStatus" id="comStatus">
                        <option value="上架">上架</option>
                        <option value="下架">下架</option>
                    </select>
                </div>
                <div class="add-input">
                    <label for="comContent"><span style="color:red">*</span>商品描述: </label>
                    <textarea name="comContent" id="comContent" cols="30" rows="5" autocomplete="off" required></textarea>
                </div>
                <div class="add-input">
                    <label for="comPic" ><span style="color:red">*</span>商品圖片: </label>
                    <input type="file" name="comPic" id="comPic" onchange="previewImages(this)" required multiple>
                </div>
                <div class="preview">
                    <img id="previewImg" class="preview-image">
                </div>
                <div class="submit">
                	<input type="hidden" name="userState" value="addNewItem">
                    <input type="submit" value="確認新增">
                    <input type="reset" value="清除" onclick="clearPreview()">
                    
                </div>
            </form>
        </main>
    </div>

  <!-- SweetAlert2框框 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- JQ -->
    <script src="${pageContext.request.contextPath}/Js/jquery-3.6.4.min.js"></script>

	<script>
	// 預覽圖片
	function previewImages(input) {
	    var previewContainer = document.querySelector('.preview'); // 預覽容器
	    previewContainer.innerHTML = ""; // 清空預覽容器

	    var files = input.files;
	    if (files.length > 3) {
	        Swal.fire({
	            icon: 'error',
	            title: 'Oops...',
	            text: '只能上傳三張圖片!',
	        });
	        input.value = ""; // 清空已選檔案
	        return;
	    }

	    for (var i = 0; i < files.length; i++) {
	        var file = files[i];
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            var image = document.createElement("img");
	            image.src = e.target.result;
	            image.classList.add("preview-image");
	            previewContainer.appendChild(image);
	        };

	        reader.readAsDataURL(file);
	    }
	}

	function clearPreview() {
	    var previewContainer = document.querySelector('.preview'); // 預覽容器
	    previewContainer.innerHTML = "";
	}

	$('form').submit(function (event) {
	    event.preventDefault(); // 取消表單提交事件

	    Swal.fire({
	        title: '確定新增商品？',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonText: '新增',
	        cancelButtonText: '取消'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // 確認後送出表單
	            $(this).closest('form').submit();
	        }
	    });
	});
	</script>




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