<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
    function colly_water(){
        var userId = '${rcolly.userId}';
        var water = '${rcolly.water}';
        if (water <=0){
            //confirm("물이 없습니다.");
            Swal.fire({
                template: "#my-template",
                text: "지금은 물이 없습니다. 잠시 후 다시 시도해 주세요.",
                imageUrl: "/assets/images/nowater.png",
                imageWidth:150,
                imageHeight: 150,
                confirmButtonText: '확인',
            });
            setTimeout(() =>
            btnActive(), 1500);
        }else{
         $.ajax({
            type : "post",
            url : "/collyWater",
            data: { "userId" : userId },
            success : function(result){
                //alert("물을 주었습니다. 물의 양이 업데이트되었습니다.");
                    Swal.fire({
                    title: "물주기 성공!",
                    text: "물의 양이 업데이트되었습니다.",
                    imageUrl: "/assets/images/successwater.png",
                    imageWidth:150,
                    imageHeight: 150,
                    confirmButtonText: '확인',
                    });
                setTimeout(() =>
               btnActive(), 1500);
            }
           });
         }
    }

    function add_water(){
        var answer = $("input[name='quizOption']:checked").val();
        $.ajax({
            type : "post",
            url : "/collyQuiz",
            data: { "quizId" : "2",
                     "answer": answer },
            success : function(result){
                //alert("퀴즈에 참여해 주셔서 감사합니다");
                $(".uk-modal-close-default").trigger("click"); // 퀴즈 모달창 닫고,
                // 참여완료 팝업 호출
               Swal.fire({
                title: "참여 완료!",
                text: "퀴즈에 참여해 주셔서 감사합니다.",
                imageUrl: "/assets/images/퀴즈성공.png",
                imageWidth:150,
                imageHeight: 150,
                confirmButtonText: '확인',
               });
                setTimeout(() => 
                btnActive(), 1500);
            }
        });
       
    };
function btnActive() {
    console.log("팝업창 닫고 새로고침");
    location.reload();
}

</script>
    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <%--<div class="my-2 flex items-center justify-between pb-3">
                <div>
                    <h2 class="text-xl font-semibold"> 나의 농장에 콜리를 키워 보세요!!</h2>
                </div>
            </div>--%>
            <form id="colly_form">
            <div class="lg:flex lg:space-x-10">
                <div class="lg:w-2/3">
                    <%--<div class="flex justify-between items-center relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <h2 class="text-2xl font-semibold">콜리팜</h2>
                        </div>
                    </div>--%>


                    <%--연습하기!!!--%>
                    <div class="card lg:mx-0 p-4">
                        <div class="flex space-x-3">
                            <img src="assets/images/곰돌이.png" class="w-10 h-10 rounded-full">
                            <input placeholder="매일 매일 퀴즈를 풀고 브로콜리를 키워보세요" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full">
                        </div>
                        <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"  >
                                <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                내가 가진 물 ${rcolly.water} g
                            </div>
                            <a href="/dailyCheck">
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">

                                <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                출석 체크 하고 물받기

                            </div>
                            </a>
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"  uk-toggle="target: #quiz-modal2">
                                <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                퀴즈 풀고 물받기

                            </div>
                        </div>
                    </div>
                    <%--연습하기!!!--%>

                    <div class="relative" uk-slider="finite: true">
                        <div class="uk-slider-container px-1 py-3 g:mx-0 p-4">
                            <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                                <div class="abc" style="width: 100%">
                                  <div class="mt-3">
                                    <li>
                                        <div class="card">
                                            <div class="bg-gray-10 p-6 pt-0 flex justify-end" style="margin-top: 10px;">
                                                <button id="colly_btn" type="button" onclick="colly_water()" class="button bg-blue-700">물 주기</button>
                                            </div>
                                            <img src="assets/images/물주는곰.png"  style="width: 65%; margin-left: 100px;">
                                            <div class="p-4">
                                                <h4 class="text-base font-semibold mb-1" style="text-align: center;">${rcolly.collyNickname}</h4>
                                                <p class="font-medium text-sm" style="text-align: center;">${rcolly.collyLevel} Level
                                                </p>
                                                <p class="font-medium text-sm" style="text-align: center;">내가 가진 물 : ${rcolly.water}
                                                </p>
                                            </div>
                                        <div class="bg-gray-100 rounded-2xl h-4 w-3/4 relative overflow-hidden" style="margin-left: 80px;">
                                            <div class="bg-blue-600 w-1/3 h-full"></div>
                                        </div>
                                        <div class="text-blue-500 font-medium mb-2" style="text-align: center;"> <span> ${rcolly.levelPercent} % !</span> </div>
                                    </div>
                                    </li>
                                  </div>
                                </div>
                            </ul>
                           <%-- <div class="bg-gray-10 p-6 pt-0 flex">
                                <button id="colly_btn" type="button" onclick="colly_water()" class="button bg-blue-700">물 주기</button>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>

            </form>

        </div>
    </div>


<div id="quiz-modal" class="create-post is-story" uk-modal>
    <div
            class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">

        <div class="text-center py-3 border-b">
            <h3 class="text-lg font-semibold">오늘의 퀴~즈</h3>
            <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
        </div>
        <div class="flex flex-1 items-start space-x-4 p-5">

            <div class="flex-1 pt-2">
                ${quiz1.quizContent}
                    <br>
                    <br>
                    1번.  ${quiz1.one}
                    <br>
                    2번.  ${quiz1.two}
                    <br>
                    3번.  ${quiz1.three}
            </div>

        </div>

        <div class="flex items-center w-full justify-between border-t p-3">
            <select class="selectpicker mt-2 story">
                <option disabled>정답을 고르세요</option>
                <option>1.${quiz1.one}</option>
                <option>2.${quiz1.two}</option>
                <option>3.${quiz1.three}</option>
            </select>

            <div class="flex space-x-2">
                <button id="quiz1" href="#" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium">
                    제출하기 </button>
            </div>
        </div>
    </div>
</div>

<%--
<div id="quiz-modal2" class="create-post is-story" uk-modal>
    <div
            class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">

        <div class="text-center py-3 border-b">
            <h3 class="text-lg font-semibold">오늘의 퀴~즈</h3>
            <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
        </div>
        <div class="flex flex-1 items-start space-x-4 p-5">

            <div class="flex-1 pt-2">
                ${quiz2.quizContent}
                <br>
                <br>
                1번.  ${quiz2.one}
                <br>
                2번.  ${quiz2.two}
                <br>
                3번.  ${quiz2.three}
            </div>

        </div>

        <div class="flex items-center w-full justify-between border-t p-3">
            <select class="selectpicker mt-2 story" id="quizeSelect2" >
                <option value="" disabled selected hidden>정답을 골라주세요</option>
                <option value=1>1.${quiz2.one}</option>
                <option value=2>2.${quiz2.two}</option>
                <option value=3>3.${quiz2.three}</option>
            </select>
            <div class="flex space-x-2">
                <button id="quiz2" href="#" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium"
                        onclick="add_water()">
                    제출하기 </button>
            </div>
        </div>

    </div>
</div>--%>

<div id="quiz-modal2" class="create-post is-story" uk-modal>
    <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
        <div class="text-center py-3 border-b">
            <h3 class="text-lg font-semibold">오늘의 퀴~즈</h3>
            <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
        </div>
        <div class="flex flex-1 items-start space-x-4 p-5">
            <div class="flex-1 pt-2">
                ${quiz2.quizContent}
                <br>
                <br>
                <label>
                    <input type="radio" name="quizOption" value="1">
                    1번. ${quiz2.one}
                </label>
                <br>
                <label>
                    <input type="radio" name="quizOption" value="2">
                    2번. ${quiz2.two}
                </label>
                <br>
                <label>
                    <input type="radio" name="quizOption" value="3">
                    3번. ${quiz2.three}
                </label>
            </div>
        </div>
        <div class="flex items-center w-full justify-between border-t p-3">
            <div class="flex space-x-2">
                <button id="quiz2" href="#" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium" onclick="add_water()">
                    제출하기
                </button>
            </div>
        </div>
    </div>
</div>

