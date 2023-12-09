<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .list-group-item{
        color: #0c0c0c;
    }
    .clickableImage:hover{
        cursor : pointer;
        border: 3px solid #e0e0e0;
        paddind: 5px;
    }
    /* 캐릭터 이미지 클릭 효과 */
    .clicked {
        border: 3px solid blue;
        paddind: 5px; /* 여백 크기 조절 */
    }
    .insert {
        color:white;
        text-decoration: none; /* 밑줄 제거 */
    }
    .insert:hover {
        color: white; /* 마우스를 대면 색상을 상속받음 */
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>

    let registerColly_form = {

        init:function(){
            $('#registerColly_btn').click(function(){
                registerColly_form.send();
            });
        },
        send:function(){
            var userId = $('#userId').val();
            var userName = $('#userName').val();
            var collyNickname = $('#collyNickname').val();
            var groupName = $('#groupName').val();
            var branchName = $('#branchName').val();
            var userLevel = $('#userLevel').val();
            var yearOfEmp = $('#yearOfEmp').val();
            var typeOfCrops = $('#typeOfCrops').val();

            $('#registerColly_form').attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $('#registerColly_form').submit();
        }
    };
    $(function(){
        registerColly_form.init();
    });

</script>


<body>
<!-- Main Contents -->
<div class="main_content">
    <div class="mcontainer">

        <div class="max mx-auto">

            <div class="card sm:p-7 p-4">

                <div class="flex items-center space-x-3">
                    <ion-icon name="gift" class="text-yellow-500 text-xl bg-yellow-50 p-1 rounded-md"></ion-icon>
                    <div class="text-xl font-semibold">콜리팜 시작하기</div>
                </div>

                <form id="registerColly_form">
                <div class="space-y-8 mt-10 mb-10">
                    <div class=" flex-1 sm:space-y-8 space-y-6">

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#">직원번호</a> </div>
                                </div>
                                <div class="relative">
                                    <input type="text" name="userId" id="userId" class="with-border" placeholder="직원번호를 입력 해 주세요">
                                    <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#">이름</a> </div>
                                </div>
                                <div class="relative">
                                    <input type="text" name="userName" id="userName" class="with-border" placeholder="김국민">
                                    <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#"> 나의 소속 </a> </div>

                                </div>
                                <div class="relative">
                                    <input type="text" name="branchName" id="branchName" class="with-border" placeholder="부점명">
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#">직급</a> </div>

                                </div>
                                <div class="relative">
                                    <input type="number" name="userLevel" id="userLevel" class="with-border" placeholder="L0 ~ L4">
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#">입행년도</a> </div>

                                </div>
                                <div class="relative">
                                    <input type="date" name="yearOfEmp" id="yearOfEmp" class="with-border">
                                </div>
                            </div>
                        </div>

                        <!-- 이미지 선택하기 -->

                        <div class="text-base font-semibold">나의 작물</div>
                        <div class="font-medium text-sm text-gray-400" style="margin-top:3px;">키우고 싶은 작물을 1개 선택 해 주세요!</div>
                        <div class="flex items-center justify-around" id="typeOfCrops" style="margin-bottom:15px;">
                            <img src="/assets/images/콜리.png" alt="" class="clickableImage sm:w-20 sm:h-20 w-14 h-14 rounded-full" value="colly">
                            <img src="/assets/images/사과.png" alt="" class="clickableImage sm:w-20 sm:h-20 w-14 h-14 rounded-full" value="1">
                            <img src="/assets/images/밤.png" alt="" class="clickableImage sm:w-20 sm:h-20 w-14 h-14 rounded-full" value="2">
                            <img src="/assets/images/딸기.png" alt="" class="clickableImage sm:w-20 sm:h-20 w-14 h-14 rounded-full" value="3">
                            <img src="/assets/images/파인애플.png" alt="" class="clickableImage sm:w-20 sm:h-20 w-14 h-14 rounded-full" value="4">
                        </div>
                        <!-- //이미지 선택하기 -->

                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-3">
                                    <div class="text-base font-semibold"> <a href="#">내 작물 이름짓기 </a> </div>
                                    <div class="font-medium text-sm text-blue-400" id="resultArea"> </div>
                                </div>
                                <div class="relative">
                                    <input type="text" name="collyNickname" id="collyNickname" class="with-border" placeholder="이름을 지어주면 좋아할거에요 :)">
                                    <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                </div>
                            </div>
                        </div>




                    </div>

                    <!-- //관심종목 선택하기 -->

                    <div class="relative cursor-pointer" uk-toggle="target: #upcoming2; animation: uk-animation-fade">
                        <div class="bg-green-50 rounded-lg px-5 py-4 font-semibold text-base"> 콜리팜 알아보기</div>
                        <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400" id="upcoming" hidden></i>
                        <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400" id="upcoming"></i>
                    </div>

                    <!-- 두번째 토글 -->
                    <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming2" hidden>
                        <div class="font-medium text-sm text-gray-400"> 내가 도전할 목표를 1개 선택하고 그에 대한 세부내용을 작성하세요.</div>
                        <div class="uk-child-width-1-3@m" uk-grid uk-scrollspy="cls: uk-animation-slide-bottom; target: .card; delay: 300; repeat: true">
                            <div>
                                <div class="card p-5 clickGoal">
                                    <h3 class="text-lg font-semibold mb-2">내가 원하는 작물 고르기</h3>
                                    <p>받고 싶은 작물을 골라보세요!<br>KB가 보장하는 무료수확</p>
                                </div>
                            </div>
                            <div>
                                <div class="card p-5 clickGoal" uk-scrollspy-class="uk-animation-slide-top">
                                    <h3 class="text-lg font-semibold mb-2">퀴즈와 출석체크로 물 획득하기</h3>
                                    <p>퀴즈는 하루 1번 풀 수 있어요!<br>출석 체크도 하루에 1번!</p>
                                </div>
                            </div>
                            <div>
                                <div class="card p-5 clickGoal">
                                    <h3 class="text-lg font-semibold mb-2">물을 주면 작물이 자랍니다</h3>
                                    <p>작물을 클릭해서<br>물을 주면 됩니다!</p>
                                </div>
                            </div>
                        </div>
                        <!-- 수기작성칸 -->
                        <div class="flex items-center sm:space-x-6 space-x-3">
                            <div class="flex-1">

                                <div class="bg-red-50 rounded-lg px-5 py-4 font-semibold text-base">퀴즈 풀고 상품 지식 쑥쑥~ 내 작물도 쑥쑥~</div>
                            </div>
                        </div>


                    </div>

                </div>

                <div class="border-t flex justify-between lg:space-x-10 p-7 bg-gray-50 rounded-b-md">
                    <p class="text-sm leading-6">물을 주면 작물이 자라요! 퀴즈를 풀고 물을 줘볼까요?</p>
                    <a href="collyFarm?userId=4538899" class="insert button lg:w-1/3"><button id="registerColly_btn" type="button">재배 시작하기</button></a>
                </div>
                </form>

            </div>

        </div>

    </div>
</div>





<script>

    $(document).ready(function() {
        // * 캐릭터 이미지 선택하기 효과
        $(".clickableImage").on("click", function() {
            // 모든 이미지의 클래스 제거
            $(".clickableImage").removeClass("clicked");

            // 클릭된 이미지에 클래스를 추가하여 스타일을 적용
            $(this).addClass("clicked");
        });
        // * '이름'입력 창에 입력이 완료되면 실행되는 이벤트
        $("#userInput").on("input", function() {
            // 입력 값 가져오기
            var userInput = $(this).val();

            // 사용자 입력이 있을 경우 '사용 가능' 텍스트를 결과 영역에 표시
            if (userInput.trim() !== "") {
                $("#resultArea").text("사용 가능").css({color:'blue'});
                // 글자 수가 6자리를 초과하는지 확인
                if (userInput.length > 6) {
                    $("#resultArea").text("사용 불가").css({color:'red'});
                } else {
                    $("#resultArea").text("사용 가능").css({color:'blue'});
                }
            }
            else {
                // 사용자 입력이 없을 경우 결과 영역을 비움
                $("#resultArea").text("");
            }
        });
        // * 나의 목표 3개 중 1개 선택하기 효과
        $(".clickGoal").on("click", function() {
            // 모든 이미지의 클래스 제거
            $(".clickGoal").removeClass("clicked");

            // 클릭된 이미지에 클래스를 추가하여 스타일을 적용
            $(this).addClass("clicked");
        });
    });
    // 다크모드
    (function (window, document, undefined) {
        'use strict';
        if (!('localStorage' in window)) return;
        var nightMode = localStorage.getItem('gmtNightMode');
        if (nightMode) {
            document.documentElement.className += ' night-mode';
        }
    })(window, document);

    (function (window, document, undefined) {

        'use strict';

        // Feature test
        if (!('localStorage' in window)) return;

        // Get our newly insert toggle
        var nightMode = document.querySelector('#night-mode');
        if (!nightMode) return;

        // When clicked, toggle night mode on or off
        nightMode.addEventListener('click', function (event) {
            event.preventDefault();
            document.documentElement.classList.toggle('dark');
            if (document.documentElement.classList.contains('dark')) {
                localStorage.setItem('gmtNightMode', true);
                return;
            }
            localStorage.removeItem('gmtNightMode');
        }, false);

    })(window, document);
</script>






</body>