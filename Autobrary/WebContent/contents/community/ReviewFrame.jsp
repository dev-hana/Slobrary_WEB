<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article class="reviewBox">
		<div class="bookCover">
			<img src="/img/ex4.png" alt="">
			<div class="buttons">
				<a href="" class="btn"> 도서 상세보기 </a> 
				<a href="" class="btn"> 리뷰 전체보기 </a>
				<a href="" class="btn"> 리뷰 작성하기 </a>
			</div>
		</div>

		<button type="button" data-toggle="modal"
			data-target="#reviewDetailModal" class="main-context">
			<dl class="bookInfo">
				<dt>도서 제목</dt>
				<dd class="title">누가 치즈를 먹었을까?</dd>
				<dt>저자</dt>
				<dd class="author">저자미상</dd>
			</dl>

			<dl class="review">
				<dt>별점</dt>
				<dd>
					<strong class="rating">★ ★ ★ ★ ★</strong>
				</dd>
				<dt>리뷰 내용</dt>
				<dd class="text">재미없음 이거읽을바에 다른거 읽는다 생각해보니까 재밌는 거 같기도 하고 암튼 다른거
					…</dd>
			</dl>
		</button>

		<div class="userInfo dropdown">
			<div class="dropdown-menu">
				<a href="#">프로필 보기</a> <a href="#">다른 리뷰 보기</a>
			</div>
		</div>
	</article>

	<!--modal-->
	<div class="modal fade" id="reviewDetailModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="modal-body">
					<div class="review-header">
						<img class="bookImg" src="/img/ex4.png" alt="">
						<div class="text">
							<dl class="book">
								<dt>도서 제목</dt>
								<dd class="title">누가 치즈를 먹었을까?</dd>
								<dt>저자</dt>
								<dd class="author">저자미상</dd>
							</dl>
							<a href="#" class="user"> <img
								src="/img/default/userImg/boy1.png"> <strong>닉네임</strong>
							</a> <strong class="rating">★ ★ ★ ★ ★</strong>
						</div>
					</div>
					<p class="review-text" aria-label="리뷰 내용">재미없음 재미없음 재미없음 재미없음
						재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음 재미없음
						재미없음 이거읽을바에 다른거 읽는다 생각해보니까 재밌는 거 같기도 하고 암튼 다른거 …</p>

				</div>
			</div>
		</div>
	</div>

	<script>
		var bookCover = document.querySelector(".bookCover");
		var bookButton = bookCover.querySelector(".buttons");
		bookCover.addEventListener("mouseover", function(event) {
			bookButton.classList.add("show");
		})

		bookCover.addEventListener("mouseleave", function(event) {
			bookButton.classList.remove("show");
		})
/*
		const dropdownMenu = document.querySelector(".dropdown-menu")
		const dropdownButton = document.querySelector(".dropdown-button")

		dropdownButton.addEventListener("click", function(event) {
			if (this.active) {
				dropdownMenu.classList.remove("active")
			} else {
				dropdownMenu.classList.add("active")
			}

			this.active = !this.active
		})

		dropdownButton.active = false
		*/
	</script>
</body>
</html>