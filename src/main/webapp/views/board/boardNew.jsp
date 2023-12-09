<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">
<style>
    .container {
        display: flex;
        align-items: center;
    }

    .container h2 {
        margin-right: 10px;
    }

    .container img {
        width: 30px;
        margin-left: 30vi;
    }
</style>
<body>


<div id="wrapper">

    <!-- Header -->


    <!-- sidebar -->


    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">

            <div class="lg:flex lg:space-x-12">

                <div class="lg:w-2/3 flex-shirink-0">

                    <div class="flex justify-between relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <div class="container">
                                <h2 class="text-2xl font-semibold">WM 게시판</h2>

                                <a href="/boardWrite" class="flex items-center justify-center h-10 w-10 z-10 rounded-full bg-blue-600 text-white absolute right-0"
                                   data-tippy-placement="left" title="Create New Page">
                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                                </a>

                            </div>
                            <nav class="responsive-nav md:m-0 -mx-4 style-2">
                                <ul>
                                    <li ><a href="/board" class="lg:px-2"> 전체글 </a></li>
                                    <li><a href="/boardLiked" class="lg:px-2"> 인기글 </a></li>
                                    <li class="active"><a href="/boardNew" class="lg:px-2"> 최신글 </a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <ul class="card divide-y divide-gray-100 sm:m-0 -mx-5">
                        <li>
                            <div class="flex items-start space-x-5 p-7">
                                <img src="assets/images/콜리.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> 디지캠퍼스 어떻게 생각하시나요?</a>
                                    <p class="text-sm text-gray-400 mb-2"> 작성자 3133252  <span data-href="%40tag-dev.html"> </span> </span> 16/12/2023</p>
                                    <p class="leading-6 line-clamp-2 mt-3">  영업점 직원도 갈만 할까요?  </p>
                                </div>
                                <div class="sm:flex items-center space-x-4 hidden">
                                    <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                    <span class="text-xl"> 7 </span>
                                </div>
                            </div>
                            <div class="flex items-start space-x-5 p-7">
                                <img src="assets/images/avatars/c.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> 적금 만기고객 , 투자권유 스크립트 </a>
                                    <p class="text-sm text-gray-400 mb-2"> 작성자 2214147 <span data-href="%40tag-dev.html"> </span> </span> 16/12/2023</p>
                                    <p class="leading-6 line-clamp-2 mt-3"> 제가 만든 스크립트에요, 도움이 되신다면 댓글 부탁드려요 ^^  </p>
                                </div>
                                <div class="sm:flex items-center space-x-4 hidden">
                                    <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                    <span class="text-xl"> 7 </span>
                                </div>
                            </div>
                            <div class="flex items-start space-x-5 p-7">
                                <img src="assets/images/avatars/a.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> (업무 외) 주말에 뭐하시나요?</a>
                                    <p class="text-sm text-gray-400 mb-2"> 작성자 3133252  <span data-href="%40tag-dev.html"> </span> </span> 16/12/2023</p>
                                    <p class="leading-6 line-clamp-2 mt-3">  주말에 아이와 놀러갈 겨울철 실내 장소 추천해주세요,   </p>
                                </div>
                                <div class="sm:flex items-center space-x-4 hidden">
                                    <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                    <span class="text-xl"> 7 </span>
                                </div>
                            </div>
                            <div class="flex items-start space-x-5 p-7">
                                <img src="assets/images/avatars/b.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="#" class="text-lg font-semibold line-clamp-1 mb-1">isa 만기자금 irp 한도 잘 모르겠어요 </a>
                                    <p class="text-sm text-gray-400 mb-2">작성자 3128252  <span data-href="%40tag-dev.html"> </span> </span> 16/12/2023</p>
                                    <p class="leading-6 line-clamp-2 mt-3">  선배님들, 만기자금만큼 한도 늘어나나요?  </p>
                                </div>
                                <div class="sm:flex items-center space-x-4 hidden">
                                    <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                    <span class="text-xl"> 7 </span>
                                </div>
                            </div>
                            <div class="flex items-start space-x-5 p-7">
                                <img src="assets/images/avatars/a.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> 여유자금 3억원 장기투자 어떻게하면 좋을까요? </a>
                                    <p class="text-sm text-gray-400 mb-2">작성자 3133252  <span data-href="%40tag-dev.html"> </span> </span> 16/12/2023</p>
                                    <p class="leading-6 line-clamp-2 mt-3">  주니어 vm이에요 , 3억원 정도 안정적인 투자 방안 궁금해요   </p>
                                </div>
                                <div class="sm:flex items-center space-x-4 hidden">
                                    <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                    <span class="text-xl"> 7 </span>
                                </div>
                            </div>
                        </li>

                    </ul>
                    <%--가장 좋아요가 많은 글 보여주기--%>
                    <h2 class="text-xl font-semibold mb-6 lg:mt-10 mt-4"> 핫 WM 이슈 </h2>
                    <ul class="card divide-y divide-gray-100">
                        <li>
                            <div class="flex items-center space-x-5 p-7">
                                <img src="assets/images/avatars/b.png" alt="" class="w-12 h-12 rounded-full">
                                <div class="flex-1">
                                    <a href="/boardDetail2" class="text-lg font-semibold line-clamp-1"> 항셍지수의 미래에 대해 어떻게 생각하세요?</a>
                                    <div class="flex space-x-3 text-sm pb-2 mt-1 flex-wrap font-medium">
                                        <a href="timeline.html" class="font-semibold"> 작성자 2855004 </a>
                                        <div class="text-gray-500"> 2023.11.13 </div>
                                        <div class="text-gray-500"> 102 개의 댓글 </div>
                                    </div>
                                </div>
                                <div class="sm:flex items-center -space-x-4 hidden">
                                    <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Jesse Stevens">
                                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Stella Johnson">
                                    <img src="assets/images/avatars/avatar-3.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Adrian Mohani">
                                    <div class="w-10 h-10 rounded-full flex justify-center items-center bg-red-100 text-red-500 font-semibold"> 12+</div>
                                </div>
                            </div>
                        </li>
                    </ul>

                </div>

                <div class="lg:w-1/3 pt-5">

                    <div uk-sticky="offset:100">

                        <h2 class="text-xl font-semibold mb-2"> 이 달의 활동왕 </h2>
                        <p> 이번달에 가장 열심히 활동한 직원이에요,</p>
                        <br>
                        <ul class="space-y-3">
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/d.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 서지영 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 137 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/a.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 정인보 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 14 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/b.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 이진만 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 257 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/c.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 최준혁 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 137 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/d.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 최미진 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 14 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-3">
                                    <img src="assets/images/avatars/sad.png" alt="" class="w-8 h-8 rounded-full">
                                    <a href="#" class="font-semibold"> 조현손 </a>
                                    <div class="flex items-center space-x-2">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-lg"></ion-icon>
                                        <span> 257 </span>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>

                </div>

            </div>

        </div>
    </div>

</div>

<!-- birthdays modal -->
<div id="birthdays" uk-modal>
    <div class="uk-modal-dialog uk-modal-body rounded-xl shadow-lg">
        <!-- close button -->
        <button class="uk-modal-close-default p-2.5 bg-gray-100 rounded-full m-3" type="button" uk-close></button>

        <div class="flex items-center space-x-3 mb-10">
            <ion-icon name="gift" class="text-yellow-500 text-xl bg-yellow-50 p-1 rounded-md"></ion-icon>
            <div class="text-xl font-semibold">   Today's birthdays </div>
        </div>

        <div class="space-y-6">
            <div class="sm:space-y-8 space-y-6 pb-2">

                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="assets/images/avatars/avatar-3.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"> <a href="#">  Alex Dolgove </a> </div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"> <a href="#"> Stella Johnson </a> </div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>

            </div>
            <div class="relative cursor-pointer" uk-toggle="target: #upcoming; animation: uk-animation-fade">
                <div class="bg-gray-50 rounded-lg px-5 py-4 font-semibold text-base"> Upcoming birthdays </div>
                <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400" id="upcoming" hidden></i>
                <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400" id="upcoming"></i>
            </div>
            <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming" hidden>

                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="assets/images/avatars/avatar-6.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"> <a href="#">  Erica Jones </a> </div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="assets/images/avatars/avatar-5.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"> <a href="#"> Dennis Han </a> </div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<!-- open chat box -->
<div uk-toggle="target: #offcanvas-chat" class="start-chat">
    <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
    </svg>
</div>

<div id="offcanvas-chat" uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar bg-white p-0 w-full lg:w-80 shadow-2xl">


        <div class="relative pt-5 px-4">

            <h3 class="text-2xl font-bold mb-2"> Chats </h3>

            <div class="absolute right-3 top-4 flex items-center space-x-2">

                <button class="uk-offcanvas-close  px-2 -mt-1 relative rounded-full inset-0 lg:hidden blcok"
                        type="button" uk-close></button>

                <a href="#" uk-toggle="target: #search;animation: uk-animation-slide-top-small">
                    <ion-icon name="search" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <a href="#">
                    <ion-icon name="settings-outline" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <a href="#">
                    <ion-icon name="ellipsis-vertical" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                     uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small; offset:5">
                    <ul class="space-y-1">
                        <li>
                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="checkbox-outline" class="pr-2 text-xl"></ion-icon> Mark all as read
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="settings-outline" class="pr-2 text-xl"></ion-icon>  Chat setting
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="notifications-off-outline" class="pr-2 text-lg"></ion-icon>   Disable notifications
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="star-outline"  class="pr-2 text-xl"></ion-icon>  Create a group chat
                            </a>
                        </li>
                    </ul>
                </div>


            </div>


        </div>

        <div class="absolute bg-white z-10 w-full -mt-5 lg:-mt-2 transform translate-y-1.5 py-2 border-b items-center flex"
             id="search" hidden>
            <input type="text" placeholder="Search.." class="flex-1">
            <ion-icon name="close-outline" class="text-2xl hover:bg-gray-100 p-1 rounded-full mr-4 cursor-pointer"
                      uk-toggle="target: #search;animation: uk-animation-slide-top-small"></ion-icon>
        </div>

        <nav class="responsive-nav border-b extanded mb-2 -mt-2">
            <ul uk-switcher="connect: #chats-tab; animation: uk-animation-fade">
                <li class="uk-active"><a class="active" href="#0"> Friends </a></li>
                <li><a href="#0">Groups <span> 10 </span> </a></li>
            </ul>
        </nav>

        <div class="contact-list px-2 uk-switcher" id="chats-tab">

            <div class="p-1">
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="contact-username"> Alex Dolgove</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="contact-username">Stella Johnson</div>
                </a>

                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="contact-username">Adrian Mohani </div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="contact-username"> Jonathan Madano</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>


            </div>
            <div class="p-1">
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="contact-username"> Alex Dolgove</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="contact-username">Stella Johnson</div>
                </a>

                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="contact-username">Adrian Mohani </div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="contact-username"> Jonathan Madano</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>


            </div>

        </div>
    </div>
</div>q\

<!-- story-preview -->
<div class="story-prev">

    <div class="story-sidebar uk-animation-slide-left-medium">
        <div class="md:flex justify-between items-center py-2 hidden">
            <h3 class="text-2xl font-semibold"> All Story </h3>
            <a href="#" class="text-blue-600"> Setting</a>
        </div>

        <div class="story-sidebar-scrollbar" data-simplebar>
            <h3 class="text-lg font-medium"> Your Story </h3>

            <a class="flex space-x-4 items-center hover:bg-gray-100 md:my-2 py-2 rounded-lg hover:text-gray-700" href="#">
                <svg class="w-12 h-12 p-3 bg-gray-200 rounded-full text-blue-500 ml-1" fill="none" stroke="currentColor"
                     viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                <div class="flex-1">
                    <div class="text-lg font-semibold"> Create a story </div>
                    <div class="text-sm -mt-0.5"> Share a photo or write something. </div>
                </div>
            </a>

            <h3 class="text-lg font-medium lg:mt-3 mt-1"> Friends Story </h3>

            <div class="story-users-list"  uk-switcher="connect: #story_slider ; toggle: > * ; animation: uk-animation-slide-right-medium, uk-animation-slide-left-medium ">

                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Dennis Han</div>
                        <p> <span class="story-count"> 2 new </span> <span class="story-time"> 4Mn ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p> <span class="story-count"> 1 new </span> <span class="story-time"> 1hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username">Alex Dolgove </div>
                        <p> <span class="story-count"> 3 new </span> <span class="story-time"> 2hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-4.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Stella Johnson </div>
                        <p> <span class="story-count"> 2 new </span> <span class="story-time"> 3hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani </div>
                        <p> <span class="story-count"> 1 new </span> <span class="story-time"> 4hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Dennis Han</div>
                        <p> <span class="story-count"> 2 new </span> <span class="story-time"> 8Hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p> <span class="story-count"> 1 new </span> <span class="story-time"> 12hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username">Alex Dolgove </div>
                        <p> <span class="story-count"> 3 new </span> <span class="story-time"> 22hr ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Stella Johnson </div>
                        <p> <span class="story-count"> 2 new </span> <span class="story-time"> 3Dy ago</span> </p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani </div>
                        <p> <span class="story-count"> 1 new </span> <span class="story-time"> 4Dy ago</span> </p>
                    </div>
                </a>


            </div>


        </div>

    </div>
    <div class="story-content">

        <ul class="uk-switcher uk-animation-scale-up" id="story_slider" >
            <li class="relative">

                <span uk-switcher-item="previous" class="slider-icon is-left"> </span>
                <span uk-switcher-item="next" class="slider-icon is-right"> </span>

                <div uk-lightbox>
                    <a href="assets/images/avatars/avatar-lg-2.jpg" data-alt="Image">
                        <img src="assets/images/avatars/avatar-lg-2.jpg" class="story-slider-image"  data-alt="Image">
                    </a>
                </div>

            </li>
            <li class="relative">

                <span uk-switcher-item="previous" class="slider-icon is-left"> </span>
                <span uk-switcher-item="next" class="slider-icon is-right"> </span>

                <div uk-lightbox>
                    <a href="assets/images/avatars/avatar-lg-1.jpg" data-alt="Image">
                        <img src="assets/images/avatars/avatar-lg-1.jpg" class="story-slider-image"  data-alt="Image">
                    </a>
                </div>

            </li>
            <li class="relative">

                <span uk-switcher-item="previous" class="slider-icon is-left"> </span>
                <span uk-switcher-item="next" class="slider-icon is-right"> </span>

                <div uk-lightbox>
                    <a href="assets/images/avatars/avatar-lg-4.jpg" data-alt="Image">
                        <img src="assets/images/avatars/avatar-lg-4.jpg" class="story-slider-image"  data-alt="Image">
                    </a>
                </div>

            </li>

            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
            <li class="relative">
                <div class="bg-gray-200 story-slider-placeholder shadow-none animate-pulse"> </div>
            </li>
        </ul>

    </div>

    <!-- story colose button-->
    <span class="story-btn-close" uk-toggle="target: body ; cls: story-active"
          uk-tooltip="title:Close story ; pos: left">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
        </span>

</div>

<!-- Craete post modal -->
<div id="create-post-modal" class="create-post is-story" uk-modal>
    <div
            class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">

        <div class="text-center py-3 border-b">
            <h3 class="text-lg font-semibold"> Create Post </h3>
            <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
        </div>
        <div class="flex flex-1 items-start space-x-4 p-5">
            <img src="assets/images/avatars/avatar-2.jpg"
                 class="bg-gray-200 border border-white rounded-full w-11 h-11">
            <div class="flex-1 pt-2">
                    <textarea class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5"
                              placeholder="What's Your Mind ? Stella!"></textarea>
            </div>

        </div>
        <div class="bsolute bottom-0 p-4 space-x-4 w-full">
            <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-2 shadow-sm items-center">
                <div class="lg:block hidden ml-1"> Add to your post </div>
                <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">

                    <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                    <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path></svg>
                    <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                    <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path></svg>
                    <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"> </path></svg>
                    <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"  d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"></path></svg>
                    <svg class="text-purple-600 h-9 p-1.5 rounded-full bg-purple-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19V6l12-3v13M9 19c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zm12-3c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zM9 10l12-3"></path> </svg>

                    <!-- view more -->
                    <svg class="hover:bg-gray-200 h-9 p-1.5 rounded-full w-9 cursor-pointer" id="veiw-more" uk-toggle="target: #veiw-more; animation: uk-animation-fade" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"> </path></svg>

                </div>
            </div>
        </div>
        <div class="flex items-center w-full justify-between border-t p-3">

            <select class="selectpicker mt-2 story">
                <option>Only me</option>
                <option>Every one</option>
                <option>People I Follow </option>
                <optionion>People Follow Me</optionion>
            </select>

            <div class="flex space-x-2">
                <a href="#" class="bg-red-100 flex font-medium h-9 items-center justify-center px-5 rounded-md text-red-600 text-sm">
                    <svg class="h-5 pr-1 rounded-full text-red-500 w-6 fill-current" id="veiw-more" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="false" style=""> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"></path></svg>
                    Live </a>
                <a href="#" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium">
                    Share </a>
            </div>

            <a href="#" hidden
               class="bg-blue-600 flex h-9 items-center justify-center rounded-lg text-white px-12 font-semibold">
                Share </a>
        </div>
    </div>
</div>
<!-- 프로필 설정 안하고, 게시글 작성하기 버튼 클릭 시 모달창 test -->
<div id="modal-profile" uk-modal>
    <div class="uk-modal-body uk-modal-dialog rounded-md shadow-2xl">
        <h2 class="mb-2 uk-modal-title">잠깐! 게시글 작성 전</h2>
        <p>아직 나의 프로필 설정을 안하셨나요?<br>게시글을 작성하면 보여질 나의 정보를 등록한 뒤 이용하러 가볼까요?</p>
        <div class="uk-modal-footer text-right mt-6 px-0 space-x-1">
            <button class="button gray uk-modal-close" type="button">뒤로가기</button>
            <a href="/myprofile"><button class="button" type="button">확인</button></a>
        </div>
    </div>
</div>
<!-- For Night mode -->
<script>
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

<!-- Javascript
================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="assets/js/tippy.all.min.js"></script>
<script src="assets/js/uikit.js"></script>
<script src="assets/js/simplebar.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

</body>
</html>