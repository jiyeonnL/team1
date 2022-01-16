<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
    <!-- 스크롤 관련 자바스크립트 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
        integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 트랜지션 효과 자바스크립트 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"
        integrity="sha512-UxP+UhJaGRWuMG2YC6LPWYpFQnsSgnor0VUF3BHdD83PS/pOpN+FYbZmrYN+ISX8jnvgVUciqP/fILOXDjZSwg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- gsap 스크롤 관련 플러그인 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/ScrollToPlugin.min.js"
        integrity="sha512-1OG9UO4krPizjtz/c9iDbjCqtXznBYdJeD4ccPaYfJHzC6F1qoQ3P1bgQ3J8lgCoK5qGVCqsY4+/RKjLDzITVQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 스크롤 매직 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
        integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        html {
            overflow: hidden;
            -ms-overflow-style: none;
            /* IE and Edge */
            scrollbar-width: none;
            /* Firefox */
        }

        .html::-webkit-scrollbar {
            display: none;
            /* Chrome, Safari, Opera*/
        }

        html,
        body {
            font-weight: bold;
            font-family: 'Jua', sans-serif;
            display: block;
            width: 100%;
            height: 100%;
            margin: 0;
            background-color: beige;
        }

        .scroll-section {
            width: 100%;
            height: 100%;
            position: relative;
        }

        /* visual  */
        .header {
            background-color: burlywood;
            height: 84px;
            width: 100%;
        }

        /* 메인 화면 */
        .visual {
            overflow: hidden;
            /* default color */

            /* "to left" / "to right" - affects initial color */
            width: 100%;

        }

        /* 전체 화면(100 view height)에서 헤더 높이(84px) 뺀 값 */
        .visual .inner {
            height: calc(100vh - 84px);
            width: 100%;
        }

        /* 배경 이미지  */
        .visual .inner .main-cover {

            height: 100%;
            /* 왼쪽에 있는 색 -> 오른쪽에 있는 색으로 변경 */
            background: linear-gradient(to left, beige 50%, #ffe164 50%) right;
            background-size: 200%;
            -webkit-animation: chagecolor 1.0s cubic-bezier(0.250, 0.460, 0.450, 1.000) 0.0s both;
            animation: chagecolor 1.0s cubic-bezier(0.250, 0.460, 0.450, 1.000) 0.0s both;
            /* Full height */
            /*             width: 100%;
            height: 100%;
            background-image: url("https://cdn.pixabay.com/photo/2020/06/05/09/34/village-5262357_960_720.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            filter: blur(2px);
            -webkit-filter: blur(2px); */

        }

        @-webkit-keyframes chagecolor {

            0% {}

            100% {
                background-position: left;
            }

        }

        @keyframes chagecolor {

            0% {}

            100% {

                background-position: left;
            }
        }

        /*로고 */
        .visual .logo {
            justify-content: center;
            align-items: center;
            display: flex;
            position: absolute;
            width: 100%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -webkit-animation: tracking-in-expand 0.5s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.5s both;
            animation: tracking-in-expand 0.5s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.5s both;
        }

        @-webkit-keyframes tracking-in-expand {
            0% {
                letter-spacing: -0.5em;
                opacity: 0;
            }

            40% {
                opacity: 0.6;
            }

            100% {
                opacity: 1;
            }
        }

        @keyframes tracking-in-expand {
            0% {
                letter-spacing: -0.5em;
                opacity: 0;
            }

            40% {
                opacity: 0.6;
            }

            100% {
                opacity: 1;
            }
        }

        /* 로고 이미지(아이콘) 담는 컨테이너 div */
        .visual .logo-container {
            margin-right: 30px;
            height: 200px;
            width: 200px;
            background-color: blueviolet;
            -webkit-animation: rotate-in-center 0.6s cubic-bezier(0.250, 0.460, 0.450, 0.940) 2.0s both;
            animation: rotate-in-center 0.6s cubic-bezier(0.250, 0.460, 0.450, 0.940) 2.0s both;

        }

        /* 로고 아이콘 회전주는 애니메이션 */
        @-webkit-keyframes rotate-in-center {
            0% {
                -webkit-transform: rotate(-360deg);
                transform: rotate(-360deg);
                opacity: 0;
            }

            100% {

                -webkit-transform: rotate(0);
                transform: rotate(0);
                opacity: 1;
            }
        }

        @keyframes rotate-in-center {
            0% {
                -webkit-transform: rotate(-360deg);
                transform: rotate(-360deg);
                opacity: 0;
            }

            100% {
                -webkit-transform: rotate(0);
                transform: rotate(0);
                opacity: 1;
            }
        }

        /* 로고 텍스트 */
        .visual .logo-text {
            color: white;
            font-size: 7rem;
            display: flex;
            justify-content: center;
            align-items: center;
            -webkit-animation: text-all 0.8s 4.8s both;
            animation: text-all 0.8s 4.8s both;
        }

        @-webkit-keyframes text-all {
            0% {
                color: #9ec6ee;
                ;
            }

            100% {
                color: #264d73;
            }
        }

        @keyframes text-all {
            0% {
                color: #9ec6ee;
                ;
            }

            100% {
                color: #264d73;
            }
        }

        .visual .logo-text .letter {}

        .visual .letter.delay-0 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 2.8s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.5s both;
        }

        .visual .letter.delay-1 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 2.9s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.6s both;
        }

        .visual .letter.delay-2 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.0s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.7s both;
        }

        .visual .letter.delay-3 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.1s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.8s both;
        }

        .visual .letter.delay-4 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.2s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.9s both;
        }

        .visual .letter.delay-5 {

            -webkit-animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 3.3s both;
            animation: text-color 0.2s cubic-bezier(0.455, 0.030, 0.515, 0.955) 4.0s both;
        }

        /* 개별 글자에 적용 */
        @-webkit-keyframes text-color {
            0% {
                color: #9ec6ee;
            }

            50% {
                color: #264d73;
            }

            100% {
                color: inherit;
            }
        }

        @keyframes text-color {
            0% {
                color: #9ec6ee;
            }

            50% {
                color: #264d73;
            }

            100% {
                color: inherit;
            }
        }

        /* 소개 타이틀 */
        .visual .title {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 1.7rem;
        }

        /* 소개 서브타이틀 */
        .visual .subTitle {

            position: absolute;
            top: 75%;
            left: 50%;
            transform: translate(-50%, -50%);

            font-size: 1.2rem;
        }

        .visual .image1 {

            position: absolute;
            bottom: 80px;
            right: 150px;

        }

        /* 2번 페이지 텍스트 css */
        .intro .text-box {
            position: absolute;
            top: 150px;
            left: 100px;
            width: 600px;
            height: 500px;

        }

        .intro .text-box .text-title {

            font-size: 4.5rem;
            margin-bottom: 75px;
            opacity: 0;
            transform: translateX(-150px);
        }

        .intro .text-box .text-content {
            font-size: 1.5rem;
            opacity: 0;
            transform: translateX(-150px);
        }

        .intro .show .title-ani {
            opacity: 1;
            transition: 1s;
            transform: translateX(0px);
            transition-delay: 1.3s;
        }

        .intro .show .content-ani {
            opacity: 1;
            transition: 1s;
            transform: translateX(0px);
            transition-delay: 1.8s;
        }

        /* 2번 페이지 이미지 css */

        .intro .image {
            position: absolute;
            object-fit: cover;
            border: black 5px solid;
            transform: translateX(150px);
            opacity: 0;
        }

        .intro .image.image1 {
            top: 120px;
            right: 270px;
            width: 480px;
            height: 300px;

        }

        .intro .image.image2 {
            top: 400px;
            right: 100px;
            width: 480px;
            height: 300px;
        }

        /* 이미지의 효과 */
        .intro .show .image1-ani {
            opacity: 1;
            transition: 1s;
            transition-delay: 0.3s;
            transform: translateX(0px);
        }

        .intro .show .image2-ani {
            opacity: 1;
            transition: 1s;
            transition-delay: 0.9s;
            transform: translateX(0px);
        }


        /* 게시판 소개 영역 1개 엘리먼트 정의 */
        .body .board {

            position: absolute;
            display: flex;
            width: 100%;
            height: 300px;
            background-color: #ffe164;
            border: black 5px so;

        }

        .body .board.upper {
            top: 40px;
        }

        .body .board.downer {
            bottom: 40px;
        }

        .body .triangle {
            position: absolute;
            height: 300px;
            width: 300px;
            background-color: #264d73;
        }

        .body .triangle.left {
            left: 0px;
            bottom: 0px;
            clip-path: polygon(0 0, 0% 100%, 100% 100%);
            -webkit-clip-path: polygon(0 0, 0% 100%, 100% 100%);

        }

        .body .triangle.right {
            right: 0px;
            bottom: 0px;
            clip-path: polygon(100% 0, 0% 100%, 100% 100%);
            -webkit-clip-path: polygon(100% 0, 0% 100%, 100% 100%);
        }

        /* 커버 이미지 담는 div 영역 */
        .body .board .image-container {
            position: absolute;
            height: 100%;
            width: 700px;
        }

        .image-container.left {
            top: 0px;
            left: 0px;
        }

        .image-container.right {
            top: 0px;
            right: 0px;
        }

        .cover-image {
            object-fit: cover;
            display: block;
            width: 100%;
            height: 100%;

        }

        /* 마름모꼴 만드는 코드 */
        .cover-image.left {
            -webkit-clip-path: polygon(0 0, 100% 0, 55% 100%, 0% 100%);
            clip-path: polygon(0 0, 100% 0, 50% 100%, 0% 100%);
        }

        .cover-image.right {
            -webkit-clip-path: polygon(100% 0, 0% 0, 55% 100%, 100% 100%);
            clip-path: polygon(100% 0, 0% 0, 50% 100%, 100% 100%);
        }



        .body .board .text-left {
            position: absolute;
            top: 120px;
            left: 700px;
            font-size: 2.0rem;
        }

        .body .board .text-right {
            position: absolute;
            top: 120px;
            right: 700px;
            font-size: 2.0rem;
        }

        .back-to-position {
            opacity: 0;
            transition: 1s;
        }

        .back-to-position.to-right {
            transform: translateX(-150px);
        }

        .back-to-position.to-left {
            transform: translateX(150px);
        }

        .show .back-to-position {
            opacity: 1;
            transform: translateX(0);
        }

        /* 애니메이션에 딜레이 얼마나 줄지 결정 */
        .show .back-to-position.delay-0 {
            transition-delay: 0.3s;
        }

        .show .back-to-position.delay-1 {
            transition-delay: 0.6s;
        }

        .show .back-to-position.delay-2 {
            transition-delay: 0.9s;
        }

        .show .back-to-position.delay-3 {
            transition-delay: 1.2s;
        }



        /* a 링크를 버튼으로 만들고 hover 시 효과 부여 */
        .button {
            text-align: center;
            justify-content: center;
            text-decoration: none;
            margin-top: 10px;
            width: 180px;
            display: block;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            border: 3px solid black;
            /* 글자 색상을 여기서 바꾼다 */
            background: linear-gradient(45deg, white 50%, black 50%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;

            /*For IE*/
        }

        .button:after {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(45deg,
                    #264d73 50%, transparent 50%);
            z-index: -1;
        }

        .button,
        .button:after {
            background-size: 300%;
            background-position: 100%;
            transition: 0.7s, font-size 0.2s;
        }

        .button:hover,
        .button:hover:after {
            background-position: 0;
            font-size: 1.1em;
            /*For IE*/
        }

        /* 링크를 버튼으로 만든다. */
        /*         .btn {
            margin-top: 30px;
            width: 160px;
            padding: 20px;
            border: 2px solid #333;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            box-sizing: border-box;
            display: block;
            transition: 0.4s;
        }

        .btn:hover {
            background-color: #333;
            color: #fff;
        } */
    </style>
       
</head>


<body>

    <!-- 헤더 -->
    <div class="scroll-section">
		
		<div id="header">
			<b:header></b:header>
		</div>
		
        <section class="visual">
            <div class="inner">
                <div class="main-cover"></div>

                <div class="logo">
                    <div class="logo-container">
                        아이콘
                    </div>
                    <div class="logo-text">
                        <div class="letter delay-0">사</div>
                        <div class="letter delay-1">용</div>
                        <div class="letter delay-2">할</div>
                        <div class="letter delay-3">로</div>
                        <div class="letter delay-4">고</div>
                        <div class="letter delay-5">명</div>
                    </div>
                </div>

                <div class="title">
                    WelCome to (프로젝트 이름)
                </div>
                <div class="subTitle">
                    서브 타이틀 Lorem, ipsum dolor sit
                </div>
            </div>
        </section>
    </div>

    <div class="scroll-section">

        <section class="intro">
            <div class="text-box scroll-spy">
                <div class="text-title title-ani">
                    지역 기반의 커뮤니티
                </div>

                <div class="text-content content-ani">
                    (프로젝트명)은 지역 기반의 커뮤니티로 지역 근처 주민들과 다양한 주제로 여러분의 일상이나 느낀점, 의견을 공유하거나 여러분의 이웃이 올린 게시물을 불 수 있습니다.
                    (프로젝트명)으로 여러분의 이웃과 함께 해보세요!
                </div>
            </div>
            <!-- 이미지 담긴 영역 -->
            <div class="image-box scroll-spy">
                <img class="image image1 image1-ani"
                    src="https://images.pexels.com/photos/6205453/pexels-photo-6205453.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" />
                <img class="image image2 image2-ani"
                    src="https://images.pexels.com/photos/5935249/pexels-photo-5935249.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" />
            </div>
        </section>
    </div>

    <div class="scroll-section">
        <section class="body ">
            <div class="board upper scroll-spy">
                <div class="triangle right"></div>
                <div class="image-container left back-to-position to-right delay-0">
                    <img class="cover-image left"
                        src="https://images.pexels.com/photos/3341508/pexels-photo-3341508.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
                        alt="newsImage" />
                </div>
                <div class="text-left back-to-position to-left delay-1">
                    이웃들과 나누고 싶은 새로운 소식이 있나요?
                    <a href="/controller1/news/list" class="button">바로가기</a>
                </div>
            </div>
        </section>

        <section class="body">
            <div class="board downer scroll-spy">
                <div class="triangle left"></div>
                <div class="image-container right back-to-position to-left delay-0">
                    <img class="cover-image right"
                        src="https://cdn.pixabay.com/photo/2017/10/13/12/29/hands-2847508_960_720.jpg"
                        alt="newsImage" />
                </div>
                <div class="text-right back-to-position to-right delay-1">
                    <div>
                        도움이 필요하신가요? 이웃들에게 부탁해보세요!
                    </div>
                    <a href="/controller1/help/list" class="button" style="float: right;">바로가기</a>
                </div>

            </div>
        </section>
    </div>

    <div class="scroll-section">
        <section class="body ">
            <div class="board upper scroll-spy">
                <div class="triangle right"></div>
                <div class="image-container left back-to-position to-right delay-0">
                    <img class="cover-image left"
                        src="https://images.pexels.com/photos/7235606/pexels-photo-7235606.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
                        alt="qeustionImage" />
                </div>
                <div class="text-left back-to-position to-left delay-1">
                    궁금한게 있나요? 이웃들에게 물어보세요!
                    <a href="/controller1/question/list?page=1" class="button">바로가기</a>
                </div>
            </div>
        </section>

        <section class="body">
            <div class="board downer scroll-spy">
                <div class="triangle left"></div>
                <div class="image-container right back-to-position to-left delay-0">
                    <img class="cover-image right"
                        src="https://images.pexels.com/photos/414628/pexels-photo-414628.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
                        alt="lifeImage" />
                </div>
                <div class="text-right back-to-position to-right delay-1">
                    <div>
                        이웃들과 여러분의 일상을 공유해보세요!
                    </div>
                    <a href="/controller1/life/list" class="button" style="float: right;">바로가기</a>
                </div>

            </div>
        </section>
    </div>

</body>
<script>
gsap.from("#header", {
    opacity: 0,
    delay: 0.0,
    duration: 0.7,

})

    gsap.from(".title", {
        opacity: 0,
        delay: 0.9,
        duration: 0.7,
        y: 50
    })

    gsap.from(".subTitle", {
        opacity: 0,
        delay: 1.2,
        duration: 0.7,
        y: 50
    })

    gsap.from(".newsImage", {
        opacity: 0,
        duration: 0.7,
        x: -100
    })

    const spyEls = document.querySelectorAll('.scroll-spy');
    spyEls.forEach(function (spyEl) {
        new ScrollMagic
            .Scene({
                triggerElement: spyEl, //보여짐 여부를 감시할 요소를 지정
                triggerHook: 0.8 //뷰포트 기준 0.8 높이(밑에서 위로 20) 이상 올라오면 토글 트리거
            })
            .setClassToggle(spyEl, 'show')
            .addTo(new ScrollMagic.Controller());

    });


    /* 페이지 스크롤 관련 코드들 */

    /* 기본 스크롤 이벤트를 막는다 */
    window.addEventListener("wheel", function (e) {
        e.preventDefault();
    }, {
        passive: false
    });

    var mHtml = $("html");
    console.log(mHtml);
    var page = 1;

    mHtml.animate({
        scrollTop: 0
    }, 10);

    /* 휠 이벤트 처리 */
    $(window).on("wheel", function (e) {
        console.log('wheel');
        if (mHtml.is(":animated")) return;
        if (e.originalEvent.deltaY > 0) {
            if (page == 4) return;
            page++;
        } else if (e.originalEvent.deltaY < 0) {
            if (page == 1) return;
            page--;
        }
        var posTop = (page - 1) * $(window).height();

        $('html, body').animate({
            scrollTop: posTop
        }, 680);
    })
</script>

</html>
