<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList,tw.gym.model.member.Member" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="gymcss/style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- href加上 . 表示當前目錄(HTML文件所在的目錄),是讓排版從vscode或直接點html都不會跑掉 -->
    
    <!-- ./ 或都不要寫直接 plugins/style.css , 但建議習慣寫./-->
	<style>
		.btn {
			font-size: 12px; 
		}
		
		.container{
		margin-left : 90px;
		}
	</style>
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
        <div class="container mt-5">
            <input class="form-control" id="searchInput" type="text" placeholder="搜尋會員...">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">User ID</th>
                        <th scope="col">User Account</th>
                        <th scope="col">User Password</th>
                        <th scope="col">User Name</th>
                        <th scope="col">User Gender</th>
                        <th scope="col">User Birthday</th>
                        <th scope="col">User Address</th>
                        <th scope="col">User Tel</th>
                        <th scope="col">User Email</th>
                        <th scope="col">User Nickname</th>
                        <th scope="col">User RegisterDate</th>
                        <th scope="col">User Total Spend</th>
                        <th scope="col">User Reward Point</th>
                        <th scope="col">User Permission</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>

<tbody>
  <c:forEach var="member" items="${members}" varStatus="status">
    <tr>
      <td>${member.userId}</td>
      <td>${member.userAccount}</td>
      <td>${member.userPassword}</td>
      <td>${member.userName}</td>
      <td>${member.userGender}</td>
      <td>${member.userBirthDay}</td>
      <td>${member.userAddress}</td>
      <td>${member.userTel}</td>
      <td>${member.userEmail}</td>
      <td>${member.userNickName}</td>
      <td>${member.userRegisterDate}</td>
      <td>${member.userTotalSpend}</td>
      <td>${member.userRewardPoint}</td>
      <td>${member.userPermission}</td>
      <td>
        <button data-bs-toggle="modal" data-bs-target="#updateModal" 
                onclick="storeData(${status.index})" class="btn btn-primary">更新</button>
      </td>
      <td>
        <button data-bs-toggle="modal" data-bs-target="#deleteModal" 
                onclick="storeDataForDelete(${status.index})" class="btn btn-danger">刪除</button>
      </td>
    </tr>
  </c:forEach>
</tbody>

            </table>
        </div>
   
   <!-- 更新視窗 -->
		   <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="updateModalLabel">更新資訊</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <!-- 在這裡放置更新表單 -->
		         <form id="updateForm">
        <input type="hidden" id="userIdInput" value="">
        <div class="mb-3">
            <label for="accountInput" class="form-label">User Account</label>
            <input type="text" class="form-control" id="accountInput">
        </div>
        <div class="mb-3">
            <label for="passwordInput" class="form-label">User Password</label>
            <input type="text" class="form-control" id="passwordInput">
        </div>
        <div class="mb-3">
            <label for="nameInput" class="form-label">User Name</label>
            <input type="text" class="form-control" id="nameInput">
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">User Email</label>
            <input type="email" class="form-control" id="emailInput">
        </div>
        <div class="mb-3">
            <label for="genderInput" class="form-label">User Gender</label>
            <input type="text" class="form-control" id="genderInput">
        </div>
        <div class="mb-3">
            <label for="birthDayInput" class="form-label">User Birthday</label>
            <input type="text" class="form-control" id="birthDayInput" disabled>
        </div>
        <div class="mb-3">
            <label for="addressInput" class="form-label">User Address</label>
            <input type="text" class="form-control" id="addressInput">
        </div>
        <div class="mb-3">
            <label for="telInput" class="form-label">User Telephone</label>
            <input type="tel" class="form-control" id="telInput">
        </div>
        <!-- 更多的欄位可以在這裡添加 -->
    </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" onclick="updateData()">保存更新</button>
		      </div>
		    </div>
		  </div>
		</div>

<!-- 刪除視窗 -->
			<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="deleteModalLabel">確認刪除</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        確定要刪除此會員嗎？
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
			        <button type="button" class="btn btn-danger" onclick="deleteData()">確認刪除</button>
			      </div>
			    </div>
			  </div>
			</div>
	</div>
        <script src="plugins/style.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script>
            document.getElementById("searchInput").addEventListener("keyup", function () {
                let searchInput = document.getElementById("searchInput");
                let filter = searchInput.value.toUpperCase();
                let table = document.querySelector(".table");
                let tr = table.getElementsByTagName("tr");

                for (let i = 0; i < tr.length; i++) {
                    let td = tr[i].getElementsByTagName("td")[1]; // 使用第二列（用戶名）進行搜索
                    if (td) {
                        let txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            });
            //存取資訊
            function storeData(rowId) {
                // 使用 rowId 獲取該行的信息
                let tr = document.getElementsByTagName("tr")[rowId +1];
                // 逐個獲取單元格的值
                let userId = tr.cells[0].innerText;
                let userAccount = tr.cells[1].innerText;
                let userPassword = tr.cells[2].innerText;
                let userName = tr.cells[3].innerText;
                let userGender = tr.cells[4].innerText;
                let userBirthDay = tr.cells[5].innerText;
                let userAddress = tr.cells[6].innerText;
                let userTel = tr.cells[7].innerText;
                let userEmail = tr.cells[8].innerText;
                const rowData = {
                    id: rowId,
                    userId: userId,
                    userAccount: userAccount,
                    UserPassword: userPassword,
                   	UserName: userName,
                   	userEmail: userEmail,
                    userGender: userGender,
                    userBirthDay: userBirthDay,
                    userAddress: userAddress,
                    userTel: userTel,
                };
                // 將 rowData 保存到 localStorage
                localStorage.setItem("rowData", JSON.stringify(rowData));
            }
            document.getElementById("updateModal").addEventListener("shown.bs.modal", function () {
                const rowData = JSON.parse(localStorage.getItem("rowData"));
                // 使用 rowData 的值填充表單元素(表單格子會預原本的值)
                 document.getElementById("userIdInput").value = rowData.userId;
                document.getElementById("accountInput").value = rowData.userAccount;
                document.getElementById("passwordInput").value = rowData.UserPassword;
                document.getElementById("nameInput").value = rowData.UserName;
                document.getElementById("emailInput").value = rowData.userEmail;
                document.getElementById("genderInput").value = rowData.userGender;
                document.getElementById("birthDayInput").value = rowData.userBirthDay;
                document.getElementById("addressInput").value = rowData.userAddress;
                document.getElementById("telInput").value = rowData.userTel;
            });
            function updateData() {
            	const updatedUserId = document.getElementById("userIdInput").value;
                const updatedAccount = document.getElementById("accountInput").value;
                const updatedPassword = document.getElementById("passwordInput").value;
                const updatedName = document.getElementById("nameInput").value;
                const updatedEmail = document.getElementById("emailInput").value;
                const updatedGender = document.getElementById("genderInput").value;
                const updatedBirthDay = document.getElementById("birthDayInput").value;
                const updatedAddress = document.getElementById("addressInput").value;
                const updatedTel = document.getElementById("telInput").value;
                
               

                // 發送AJAX請求到後端Servlet
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "api/memberUpdate", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                
                const data = {
                        userId: updatedUserId,
                        userAccount: updatedAccount,
                        userPassword: updatedPassword,
                        userName: updatedName,
                        userEmail: updatedEmail,
                        userGender: updatedGender,
                        userBirthDay: updatedBirthDay,
                        userAddress: updatedAddress,
                        userTel: updatedTel
                    };
            
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // 根據響應更新前端UI或顯示操作結果
                        console.log(xhr.responseText);
                        location.reload();
                    }
                };
                // 將更新後的數據作為請求參數發送
             
                //xhr.send(`userAccount=${updatedAccount}&userPassword=${updatedPassword}&userName=${updatedName}&userEmail=${updatedEmail}&userId=${updatedUserId}&userGender=${updatedGender}&userBirthDay=${updatedBirthDay}&userAddress=${updatedAddress}&userTel=${updatedTel}`);
                xhr.send(JSON.stringify(data));
                // 移除 localStorage 中的 rowData
                localStorage.removeItem("rowData");
                // 關閉模態框
                const updateModal = new bootstrap.Modal(document.getElementById("updateModal"));
                updateModal.hide();
            }
            
            //--------------刪除方法--------------
            let userIdToDelete = null;

			function storeDataForDelete(index) {
				const userId = document.getElementsByTagName("tbody")[0].rows[index].cells[0].innerHTML;
				userIdToDelete = userId;
				console.log("Stored User ID: " + userId); 
			}
			
			
			function deleteData() {
			    // 創建一個 XMLHttpRequest 對象
			    const xhr = new XMLHttpRequest();
			    const url = `DeleteMember?userId=${userIdToDelete}`;
			    // 打開一個新的 HTTP 請求
			    xhr.open("POST", "api/DeleteMember", true);
			    
			    // 設置 onreadystatechange 事件處理器
			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === 4 && xhr.status === 200) {
			            // 根據響應更新前端 UI 或顯示操作結果
			    console.log("URL: " + url);
			           // console.log(xhr.responseText);
			            location.reload();
			        }
			    };
			    
			    // 發送請求
			    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			    // 發送請求
			    xhr.send("userId=" + encodeURIComponent(userIdToDelete));
			}

            
        </script>
</body>
</html>