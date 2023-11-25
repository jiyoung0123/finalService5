<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- My 고객관리 메인 페이지 -->
<body>
<!-- Main Contents -->
          <div class="main_content">
            <div class="mcontainer">

                <div class="profile is_page">

                    <div class="profiles_banner">
                        <img src="/assets/images/profile/backimg1.png" alt="">
                    </div>
                    <div class="profiles_content">
                        <div class="profile_avatar">
                            <div class="profile_avatar_holder"> 
                                <img src="/assets/images/profile/backimg1.png" alt="">
                            </div>
                            <div class="icon_change_photo" hidden> <ion-icon name="camera" class="text-xl"></ion-icon> </div>
                        </div>
                        <div class="profile_info">
                            <h1> 지영언니야 </h1>
                            <p> 열심히 하는데 왜 안돼요? 열심히 안한 것 뿐이에요!</p>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="flex items-center -space-x-4">
                                <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                 <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                              </svg>
                            </div>
                            <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                            data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                          </svg>
                        </div>
                        <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                        data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                         <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                      </svg>
                    </div>
                                <div class="w-10 h-10 rounded-full flex justify-center items-center bg-red-100 text-red-500 font-semibold"> 12+
                                </div>
                            </div>
                        
                            <a href="#" class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
                                <ion-icon name="thumbs-up"></ion-icon>
                                <span> 좋아요 </span>
                            </a>
                        </div>

                    </div>

                    <nav class="responsive-nav border-t -mb-0.5 lg:pl-2">
                        <ul>
                            <li class="active"><a href="#0"> 작성한 글</a></li>
                            <li><a href="#0">직원 정보</a></li>
                            <li><a href="#0">활동 이력</a></li>
                        </ul>
                    </nav>
                </div>
                    
                <div class="md:flex md:space-x-6 lg:mx-16">
                    <div class="space-y-5 flex-shrink-0 md:w-7/12">

                        <!-- create post  -->
                        <div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal">
                            <div class="flex space-x-3">
                                <div class="rounded-full border-2 bg-gray-200 border-gray-100" style="padding: 5px 0px 0px 5px; width: 38px;"
                                data-tippy-placement="top" >
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                    </svg>
                                 </div>
                                <!-- <img src="assets/images/avatars/avatar-2.jpg" class="w-10 h-10 rounded-full"> -->
                                <input placeholder="직원에게 남기고싶은 메세지를 작성해 보세요!" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full"> 
                            </div>
                            <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                                 <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                     <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                     사진
                                 </div>
                                 <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                     <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                     직원태그
                                 </div>
                                 <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                     <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                     이모티콘
                                 </div>
                            </div> 
                        </div>
                
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                
                           <!-- post header-->
                            <div class="flex justify-between items-center lg:p-4 p-2.5">
                                <div class="flex flex-1 items-center space-x-4">
                                    <a href="#">
                                        <img src=/assets/images/profile/backimg1.png class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                    </a>
                                    <div class="flex-1 font-semibold capitalize">
                                        <a href="#" class="text-black dark:text-gray-100"> 지영언니야 </a>
                                        <div class="text-gray-700 flex items-center space-x-2"> 5 <span> 시간 전 </span> <ion-icon name="people"></ion-icon></div>
                                    </div>
                                </div>
                              
                                <div>
                                    <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                         uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
        
                                        <ul class="space-y-1">
                                            <li>
                                                <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                    <i class="uil-share-alt mr-1"></i> Share
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                    <i class="uil-edit-alt mr-1"></i>  Edit Post
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                    <i class="uil-comment-slash mr-1"></i>   Disable comments
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                    <i class="uil-favorite mr-1"></i>  Add favorites
                                                </a>
                                            </li>
                                            <li>
                                                <hr class="-mx-2 my-2 dark:border-gray-800">
                                            </li>
                                            <li>
                                                <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                    <i class="uil-trash-alt mr-1"></i>  Delete
                                                </a>
                                            </li>
                                        </ul>
        
                                    </div>
                                </div>
                            </div>

                            <div>
                                <img src="/assets/images/postimg/post1.jpg" alt="" class="max-h-96 w-full object-cover">
                            </div>

                            <div class="p-5 pt-0 border-b dark:border-gray-700">
                                직원분들께서 근무하랴 공부하랴 바쁘실텐데, 하루 1분 동향정리 해드려요!!<br>
                                유가 상승의 영향으로 CPI의 헤드라인 2%대 진입은 내년 3분기 즈음으로 지연될 전망입니다. <br>
                                연준의 물가 참조지표인 핵심PCE 물가는 24년 4월에 2%대 진입이 예상되며, 물가가 2%대로 안착되는 9월경 미국의 첫 번째 금리인하가 예상되네요. <br>
                                시중 금리는 근원 물가가 2%대로 진입하게 될 2분기부터 금리인하 기대를 선제적으로 반영할 것으로 보인다고 하니<br>
                                모두 어려운 시기에 고객에게 권유/상담하느라 힘드시겠지만 해뜰 날 조금만 기다려 보자구요~!!^^  
                               
                            </div>
                            
                
                            <div class="p-4 space-y-3"> 
                               
                                <div class="flex space-x-4 lg:font-bold">
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                            </svg>
                                        </div>
                                        <div> 좋아요</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <div> 댓글</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                            </svg>
                                        </div>
                                        <div> 공유</div>
                                    </a>
                                </div>
                                <div class="flex items-center space-x-3 pt-2"> 
                                    <div class="flex items-center">
                                        <div class="sm:flex items-center -space-x-4 hidden">
                                        <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                            data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                          </svg>
                                        </div>
                                        <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                            data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                          </svg>
                                        </div>
                                        <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                            data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                          </svg>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="dark:text-gray-100">
                                        <strong> 나는야판매왕</strong> 님 외 <strong> 209 명</strong>이 좋아해요 
                                    </div>
                                </div>
                
                                <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6">지영님 게시글 덕분에 오늘도 짬내서 공부 완료<!DOCTYPE html>
                                                 </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i>  </a>
                                                <a href="#"> 답글 </a>
                                                <span> 3시간 전 </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-xs flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                                <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                
                                <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                    <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                    <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                        <a href="#">
                                            <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a> 
                                    </div>
                                </div>
                
                            </div>
                
                        </div>  
                        
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                
                            <!-- post header-->
                             <div class="flex justify-between items-center lg:p-4 p-2.5">
                                 <div class="flex flex-1 items-center space-x-4">
                                     <a href="#">
                                         <img src=/assets/images/profile/backimg1.png class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                     </a>
                                     <div class="flex-1 font-semibold capitalize">
                                         <a href="#" class="text-black dark:text-gray-100"> 지영언니야 </a>
                                         <div class="text-gray-700 flex items-center space-x-2"> 5 <span> 시간 전 </span> <ion-icon name="people"></ion-icon></div>
                                     </div>
                                 </div>
                               
                                 <div>
                                     <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                     <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                          uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
         
                                         <ul class="space-y-1">
                                             <li>
                                                 <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                     <i class="uil-share-alt mr-1"></i> Share
                                                 </a>
                                             </li>
                                             <li>
                                                 <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                     <i class="uil-edit-alt mr-1"></i>  Edit Post
                                                 </a>
                                             </li>
                                             <li>
                                                 <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                     <i class="uil-comment-slash mr-1"></i>   Disable comments
                                                 </a>
                                             </li>
                                             <li>
                                                 <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                     <i class="uil-favorite mr-1"></i>  Add favorites
                                                 </a>
                                             </li>
                                             <li>
                                                 <hr class="-mx-2 my-2 dark:border-gray-800">
                                             </li>
                                             <li>
                                                 <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                     <i class="uil-trash-alt mr-1"></i>  Delete
                                                 </a>
                                             </li>
                                         </ul>
         
                                     </div>
                                 </div>
                             </div>
 
                             <div>
                                 <img src="/assets/images/post/post3.jpg" alt="" class="max-h-96 w-full object-cover">
                             </div>
 
                             <!-- <div class="p-5 pt-0 border-b dark:border-gray-700">
                                 직원분들께서 근무하랴 공부하랴 바쁘실텐데, 하루 1분 동향정리 해드려요!!<br>
                                 유가 상승의 영향으로 CPI의 헤드라인 2%대 진입은 내년 3분기 즈음으로 지연될 전망입니다. <br>
                                 연준의 물가 참조지표인 핵심PCE 물가는 24년 4월에 2%대 진입이 예상되며, 물가가 2%대로 안착되는 9월경 미국의 첫 번째 금리인하가 예상되네요. <br>
                                 시중 금리는 근원 물가가 2%대로 진입하게 될 2분기부터 금리인하 기대를 선제적으로 반영할 것으로 보인다고 하니<br>
                                 모두 어려운 시기에 고객에게 권유/상담하느라 힘드시겠지만 해뜰 날 조금만 기다려 보자구요~!!^^  
                                
                             </div> -->
                             
                 
                             <div class="p-4 space-y-3"> 
                                
                                 <div class="flex space-x-4 lg:font-bold">
                                     <a href="#" class="flex items-center space-x-2">
                                         <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                             <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                 <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                             </svg>
                                         </div>
                                         <div> 좋아요</div>
                                     </a>
                                     <a href="#" class="flex items-center space-x-2">
                                         <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                             <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                 <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                             </svg>
                                         </div>
                                         <div> 댓글</div>
                                     </a>
                                     <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                         <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                             <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                 <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                             </svg>
                                         </div>
                                         <div> 공유</div>
                                     </a>
                                 </div>
                                 <div class="flex items-center space-x-3 pt-2"> 
                                     <div class="flex items-center">
                                         <div class="sm:flex items-center -space-x-4 hidden">
                                         <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                             data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                           </svg>
                                         </div>
                                         <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                             data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                           </svg>
                                         </div>
                                         <div class="w-10 h-10 rounded-full border-2 bg-gray-100 border-white" style="padding: 5px 0px 0px 5px"
                                             data-tippy-placement="top" ><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="25" height="25" class="bi bi-person" viewBox="0 0 16 16">
                                              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                           </svg>
                                         </div>
                                     </div>
                                     </div>
                                     <div class="dark:text-gray-100">
                                         Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                     </div>
                                 </div>
                 
                                 <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                     <div class="flex">
                                         <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                             <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                         </div>
                                         <div>
                                             <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                 <p class="leading-6">In ut odio libero vulputate <urna class="i uil-heart"></urna> <i
                                                         class="uil-grin-tongue-wink"> </i> </p>
                                                 <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                             </div>
                                             <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                 <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                 <a href="#"> Replay </a>
                                                 <span> 3d </span>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="flex">
                                         <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                             <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                         </div>
                                         <div>
                                             <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                 <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
                                                 <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                             </div>
                                             <div class="text-xs flex items-center space-x-3 mt-2 ml-5">
                                                 <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                 <a href="#"> Replay </a>
                                                 <span> 3d </span>
                                             </div>
                                         </div>
                                     </div>
                                    
                                 </div>
                                 
                                 <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                 
                                 <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                     <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                     <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                         <a href="#">
                                             <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                         </a>
                                         <a href="#">
                                             <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                         </a>
                                         <a href="#">
                                             <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                         </a> 
                                     </div>
                                 </div>
                 
                             </div>
                 
                         </div>  
                
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                
                            <!-- post header-->
                            <div class="flex justify-between items-center lg:p-4 p-2.5">
                                <div class="flex flex-1 items-center space-x-4">
                                    <a href="#">
                                        <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                    </a>
                                    <div class="flex-1 font-semibold capitalize">
                                        <a href="#" class="text-black dark:text-gray-100"> 지영언니야 </a>
                                        <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                    </div>
                                </div>
                              <div>
                                <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                              
                                    <ul class="space-y-1">
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                      </li> 
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                      </li>
                                      <li>
                                        <hr class="-mx-2 my-2 dark:border-gray-800">
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                           <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                      </li>
                                    </ul>
                                
                                </div>
                              </div>
                            </div>
                
                
                            <div class="p-5 pt-0 border-b dark:border-gray-700">
                
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                
                            </div>
                            
                
                            <div class="p-4 space-y-3"> 
                               
                                <div class="flex space-x-4 lg:font-bold">
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                            </svg>
                                        </div>
                                        <div> Like</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <div> Comment</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                            </svg>
                                        </div>
                                        <div> Share</div>
                                    </a>
                                </div>
                                <div class="flex items-center space-x-3 pt-2"> 
                                    <div class="flex items-center">
                                        <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                        <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                        <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    </div>
                                    <div class="dark:text-gray-100">
                                        Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                    </div>
                                </div>
                
                                <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6">In ut odio libero vulputate <urna class="i uil-heart"></urna> <i
                                                        class="uil-grin-tongue-wink"> </i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-xs flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                                <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                
                                <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                    <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                    <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                        <a href="#">
                                            <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a> 
                                    </div>
                                </div>
                
                            </div>
                
                        </div>  
                        
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                
                            <!-- post header-->
                            <div class="flex justify-between items-center lg:p-4 p-2.5">
                                <div class="flex flex-1 items-center space-x-4">
                                    <a href="#">
                                        <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                    </a>
                                    <div class="flex-1 font-semibold capitalize">
                                        <a href="#" class="text-black dark:text-gray-100"> 지영언니야 </a>
                                        <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                    </div>
                                </div>
                              <div>
                                <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                              
                                    <ul class="space-y-1">
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                      </li> 
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                      </li>
                                      <li>
                                        <hr class="-mx-2 my-2 dark:border-gray-800">
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                           <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                      </li>
                                    </ul>
                                
                                </div>
                              </div>
                            </div>
                
                            <div class="w-full h-full">
                                <img src="/assets/images/post/post3.jpg">
                            </div>
                
                            <div class="p-4 space-y-3"> 
                               
                                <div class="flex space-x-4 lg:font-bold">
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                            </svg>
                                        </div>
                                        <div> Like</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <div> Comment</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                            </svg>
                                        </div>
                                        <div> Share</div>
                                    </a>
                                </div>
                                <div class="flex items-center space-x-3 pt-2"> 
                                    <div class="flex items-center">
                                        <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                        <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                        <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    </div>
                                    <div class="dark:text-gray-100">
                                        Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                    </div>
                                </div>
                
                                <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6">In ut odio libero vulputate <urna class="i uil-heart"></urna> <i
                                                        class="uil-grin-tongue-wink"> </i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-xs flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                                <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                
                                <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                    <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                    <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                        <a href="#">
                                            <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a>
                                        <a href="#">
                                            <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                        </a> 
                                    </div>
                                </div>
                
                            </div>
                
                        </div> 
                
                        <div class="flex justify-center mt-6">
                            <a href="#" class="bg-white font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
                                Load more ..</a>
                        </div>
    
                    </div>
                    <div class="w-full flex-shirink-0">

                        <div class="card p-5 mb-5">

                            <h1 class="block text-lg font-bold"> 직원 정보  </h1>

                            <div class="space-y-4 mt-3">
                                
                                <div class="flex items-center space-x-3">
                                    <ion-icon name="alert-circle" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                    <div class="flex-1">
                                        <div>  DIGI Campus 파견근무 중 </div>
                                    </div>
                                </div> 
                                <div class="flex items-center space-x-3">
                                    <ion-icon name="thumbs-up" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                    <div class="flex-1">
                                        <div class="font-semibold">  347 명에게 좋아요를 받은 직원 </div>
                                    </div>
                                </div> 
                                <div class="flex items-center space-x-3">
                                    <ion-icon name="globe" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                    <div class="flex-1">
                                        <div>  <a href="#" class="text-blue-500"> 인재개발부 | 경영지원그룹 </a> </div> 
                                    </div>
                                </div>
                                <div class="flex items-center space-x-3">
                                    <ion-icon name="albums" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                    <div class="flex-1">
                                        <div>  <a href="#" class="text-blue-500">IT개발 및 운영</a> </div> 
                                    </div>
                                </div>
                                <div class="flex items-center space-x-3">
                                    <ion-icon name="mail-open" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                    <div class="flex-1">
                                        <div>  <a href="#" class="text-blue-500">jiyoung123@kbfg.com</a> </div> 
                                    </div>
                                </div>

                                 
                            </div>
                            

                        </div>

                        <div class="widget card p-5 border-t">
                            <div class="flex items-center justify-between mb-2">
                                <div>
                                    <h4 class="text-lg font-semibold"> 활동 이력 </h4>
                                </div>
                                <a href="#" class="text-blue-600 "> See all</a>
                            </div>
                            <div>
                          
                                <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                  <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                      <img src="assets/images/avatars/avatar-3.jpg" class="absolute w-full h-full inset-0 " alt="">
                                  </a>
                                  <div class="flex-1">
                                      <a href="timeline-page.html" class="text-base font-semibold capitalize"> Monroe Parker  </a>
                                      <div class="text-sm text-gray-500 mt-0.5"> 345K  Following</div>
                                  </div>
                                  <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                      Flow
                                  </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                  <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                      <img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 " alt="">
                                  </a>
                                  <div class="flex-1">
                                      <a href="timeline-page.html" class="text-base font-semibold capitalize"> Graphic Design  </a>
                                      <div class="text-sm text-gray-500 mt-0.5"> 345K  Following</div>
                                  </div>
                                  <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                      Flow
                                  </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                  <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                      <img src="assets/images/avatars/avatar-4.jpg" class="absolute w-full h-full inset-0 " alt="">
                                  </a>
                                  <div class="flex-1">
                                      <a href="timeline-page.html" class="text-base font-semibold capitalize"> Martin Gray  </a>
                                      <div class="text-sm text-gray-500 mt-0.5"> 452k Following </div>
                                  </div>
                                  <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                      Flow
                                  </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                  <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                      <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0" alt="">
                                  </a>
                                  <div class="flex-1">
                                      <a href="timeline-page.html" class="text-base font-semibold capitalize">  Coffee Addicts  </a>
                                      <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                  </div>
                                  <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                      Flow
                                  </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                  <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                      <img src="assets/images/group/group-1.jpg" class="absolute w-full h-full inset-0" alt="">
                                  </a>
                                  <div class="flex-1">
                                      <a href="timeline-page.html" class="text-base font-semibold capitalize"> Architecture    </a>
                                      <div class="text-sm text-gray-500 mt-0.5"> 237K Following</div>
                                  </div>
                                  <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                      Flow
                                  </a>
                              </div>
                      
                            </div>
                        </div>
 

                    </div>
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
