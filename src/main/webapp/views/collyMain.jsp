<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    function colly_water(){
        var userId = '${rcolly.userId}';
        var water = '${rcolly.water}';
        if (water <=0){
            confirm("물이 없습니다.");
        }else{
         $.ajax({
            type : "post",
            url : "/collyWater",
            data: { "userId" : userId },
            success : function(result){
                alert("물을 주었습니다. 물의 양이 업데이트되었습니다.");
                location.reload();
            }
           });
         }
    }

    function add_water(){
        var answer = $("#quizeSelect2").val();
        alert("정답은"+answer);

    }



</script>
    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="my-2 flex items-center justify-between pb-3">
                <div>
                    <h2 class="text-xl font-semibold">나의 농장에 콜리를 키워 보세요!!</h2>
                </div>
            </div>
            <form id="colly_form">
            <div class="lg:flex lg:space-x-10">
                <div class="lg:w-2/3">
                    <div class="flex justify-between items-center relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <h2 class="text-2xl font-semibold">콜리팜</h2>
                        </div>
                    </div>

                <%--    <div class="card lg:mx-0 p-4" uk-toggle="target: #quiz-modal">
                        <div class="flex space-x-3">
                            <img src="assets/images/avatars/avatar-2.jpg" class="w-10 h-10 rounded-full">
                            <input placeholder="나의 농장에 콜리를 키워 보세요!!" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full">
                        </div>
                        <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                내가 가진 물
                            </div>
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                퀴즈 같이 풀고 물받기
                            </div>
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                               퀴즈 풀고 물받기
                            </div>
                        </div>
                    </div>--%>

                    <%--연습하기!!!--%>
                    <div class="card lg:mx-0 p-4">
                        <div class="flex space-x-3">
                            <img src="assets/images/avatars/avatar-2.jpg" class="w-10 h-10 rounded-full">
                            <input placeholder="나의 농장에 콜리를 키워 보세요!!" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full">
                        </div>
                        <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"  >
                                <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                내가 가진 물
                            </div>
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"  uk-toggle="target: #quiz-modal">
                                <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                퀴즈 같이 풀고 물받기
                            </div>
                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"  uk-toggle="target: #quiz-modal2">
                                <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                퀴즈 풀고 물받기
                            </div>
                        </div>
                    </div>
                    <%--연습하기!!!--%>


                    <div class="relative" uk-slider="finite: true">
                        <div class="uk-slider-container px-1 py-3">
                            <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                                <li>
                                    <a href="timeline-page.html" class="uk-link-reset">
                                        <div class="card">
                                            <img src="assets/images/콜리.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                            <div class="p-4">
                                                <h4 class="text-base font-semibold mb-1">${rcolly.collyNickname}</h4>
                                                <p class="font-medium text-sm">${rcolly.collyLevel} Level
                                                </p>
                                                <p class="font-medium text-sm">내가 가진 물 : ${rcolly.water}
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="mt-3">

                                        <div class="bg-gray-100 rounded-2xl h-2 w-full relative overflow-hidden">
                                            <div class="bg-blue-600 w-1/3 h-full"></div>
                                        </div>

                                        <div class="text-blue-500 font-medium mb-2"> <span> ${rcolly.levelPercent} % !</span> </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="bg-gray-10 p-6 pt-0 flex">
                                <button id="colly_btn" type="button" onclick="colly_water()" class="button bg-blue-700">물 주기</button>
                            </div>
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
</div>