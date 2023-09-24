<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- My 고객관리 메인 페이지 -->
<body>
	<!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">

                <div class="lg:flex lg:space-x-12">
                    
                    <div class="lg:w-2/3 flex-shirink-0">
                    
                        <div class="flex justify-between relative md:mb-4 mb-3">
                            <div class="flex-1">
                                <h2 class="text-2xl font-semibold"> My고객관리 </h2>
                                <nav class="responsive-nav md:m-0 -mx-4 style-2">
                                    <ul uk-switcher="connect: #group-details; animation: uk-animation-fade">
                                    <li class="uk-active"><a href="#" class="active lg:px-2"> 최근가입순 </a></li>
                                        <li><a href="#" class="lg:px-2"> 투자금액순 </a></li>
                                        <li><a href="#" class="lg:px-2"> 수익률순 </a></li>
                                        <li><a href="#" class="lg:px-2"> 위험관리순 </a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        
                        <ul class="card divide-y divide-gray-100 sm:m-0 -mx-5">
                            <li>
                                <div class="flex items-start space-x-5 p-7">
                                     <img src="/assets/images/starfriends/proflie1.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1">나비비  </a>
                                        <p class="text-sm text-gray-400 mb-2"> 관리한 지 1일 전 </p>
                                      <p class="leading-6 line-clamp-2 mt-3">피델리티 인디아 증권자투자신탁(주식)-Ce</p>
                                      <p class="leading-6 line-clamp-2 mt-3">매월 적립 중 | 현재까지 투자금액 5,896,000원</p>
                                    </div>
                                    <div class="sm:flex items-center space-x-4 hidden">
                                        <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                        <span class="text-xl"> 4 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-start space-x-5 p-7">
                                    <img src="/assets/images/avatars/avatar-1.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> Stuck on Please wait for hosting to be configured  </a>
                                        <p class="text-sm text-gray-400 mb-2"> Posted By: <span data-href="%40tag-dev.html">Tag-dev</span> 8 hours ago</span> </p>
                                      <p class="leading-6 line-clamp-2 mt-3">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                                    </div>
                                    <div class="sm:flex items-center space-x-4 hidden">
                                        <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                        <span class="text-xl"> 6 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-start space-x-5 p-7">
                                    <img src="/assets/images/avatars/avatar-3.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                      <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> Messing around with it, one use I found is by overriding </a>
                                  <p class="text-sm text-gray-400 mb-2"> Posted By: <span data-href="%40tag-dev.html">Tag-dev</span> 8 hours ago</span> </p>
                                      <p class="leading-6 line-clamp-2 mt-3">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                                    </div>
                                    <div class="sm:flex items-center space-x-4 hidden">
                                        <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                        <span class="text-xl"> 3 </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-start space-x-5 p-7">
                                    <img src="/assets/images/avatars/avatar-2.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1 mb-1"> Stuck on Please wait for hosting to be configured  </a>
                                        <p class="text-sm text-gray-400 mb-2"> Posted By: <span data-href="%40tag-dev.html">Tag-dev</span> 8 hours ago</span> </p>
                                        <p class="leading-6 line-clamp-2 mt-3">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                                    </div>
                                    <div class="sm:flex items-center space-x-4 hidden">
                                        <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                        <span class="text-xl"> 2 </span>
                                    </div>
                                </div>
                          </li>
                        </ul>

                        <h2 class="text-xl font-semibold mb-6 lg:mt-10 mt-4"> My고객 상품별관리 </h2>
                        <ul class="card divide-y divide-gray-100">
                            <li>
                                <div class="flex items-center space-x-5 p-7">
                                    <img src="/assets/images/starfriends/proflie1.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1">  한국투자 미국 배당귀족 증권자투자신탁H(주식) A-e </a>
                                        <div class="flex space-x-3 text-sm pb-2 mt-1 flex-wrap font-medium"> 
                                            <a href="timeline.html" class="font-semibold"> 높은 위험 | 임의식 </a>
                                            <div class="text-gray-500"> Oct 20Th , 2020 </div>
                                            <div class="text-gray-500"> 12 명 가입 중</div>
                                        </div>
                                    </div>
                                    <div class="sm:flex items-center -space-x-4 hidden">
                                        <img src="/assets/images/avatars/avatar-1.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Jesse Stevens">
                                        <img src="/assets/images/avatars/avatar-2.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Stella Johnson">
                                        <img src="/assets/images/avatars/avatar-3.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Adrian Mohani">
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-red-100 text-red-500 font-semibold"> 12+</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-5 p-7">
                                    <img src="/assets/images/starfriends/proflie4.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1"> 베어링 고배당 증권자투자신탁(주식) AE  </a>
                                        <div class="flex space-x-3 text-sm pb-2 flex-wrap"> 
                                            <a href="timeline.html" class="font-semibold">  높은위험 | 국내주식  </a>
                                            <div class="text-gray-500"> Oct 20Th , 2020 </div>
                                            <div class="text-gray-500"> 5명 가입 중</div>
                                        </div>
                                    </div>
                                    <div class="sm:flex items-center -space-x-4 hidden">
                                        <img src="/assets/images/avatars/avatar-2.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Adrian Mohani">
                                        <img src="/assets/images/avatars/avatar-1.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Jesse Stevens">
                                        <img src="/assets/images/avatars/avatar-4.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Stella Johnson">
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-green-100 text-green-500 font-semibold"> 12+</div>
                                    </div>
                                </div>
                            </li> 
                            <li>
                                <div class="flex items-center space-x-5 p-7">
                                    <img src="/assets/images/starfriends/proflie5.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1"> KB PIMCO 글로벌 인컴 셀렉션 증권자투자신탁(채권-재간접형)(H) AE  </a>
                                        <div class="flex space-x-3 text-sm pb-2 mt-1 flex-wrap font-medium"> 
                                            <a href="timeline.html" class="font-semibold">  보통 위험 | 해외채권  </a>
                                            <div class="text-gray-500"> Oct 20Th , 2020 </div>
                                            <div class="text-gray-500"> 2명 가입 중</div>
                                        </div>
                                    </div>
                                    <div class="sm:flex items-center -space-x-4 hidden">
                                        <img src="/assets/images/avatars/avatar-3.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Adrian Mohani">
                                        <img src="/assets/images/avatars/avatar-4.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Steven Jesse">
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-red-100 text-red-500 font-semibold"> 24+</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-5 p-7">
                                    <img src="/assets/images/avatars/avatar-2.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1"> Messing around with it, one use I found is by overriding  </a>
                                        <div class="flex space-x-3 text-sm pb-2 mt-1 flex-wrap font-medium"> 
                                            <a href="timeline.html" class="font-semibold"> Jesse Stevens </a>
                                            <div class="text-gray-500"> Oct 20Th , 2020 </div>
                                            <div class="text-gray-500"> 12 replies</div>
                                        </div>
                                    </div>
                                    <div class="sm:flex items-center -space-x-4 hidden">
                                        <img src="/assets/images/avatars/avatar-5.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white hover:z-10" data-tippy-placement="top" title="Adrian Mohani">
                                        <img src="/assets/images/avatars/avatar-6.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Jesse Stevens">
                                        <img src="/assets/images/avatars/avatar-2.jpg" alt="" class="w-10 h-10 rounded-full border-2 border-white" data-tippy-placement="top" title="Stella Johnson">
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-green-100 text-green-500 font-semibold"> 18+</div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                      
                    </div>
  
                    <div class="lg:w-1/3 pt-5">
  
                        <div uk-sticky="offset:100">
                            
                            <h2 class="text-xl font-semibold mb-2"> My고객 타임라인 </h2>
                            <p> 직원이 관심을 가질 수록<br> 고객들의 <span class="point">자산관리 관심도</span>는 더욱 높아져요.  </p>
                            <br>
                            <ul class="space-y-3">
                                <li class="uk-filter-control">
                                <a class="bg-gray-100 py-1.5 px-4 rounded-full" href="#">2023.9.16(토)</a>
                                 	<div class="bg-white rounded-lg shadow-md p-3 flex "> 
                                        <div class="bg-blue-600 rounded-lg w-1.5"></div>
                                        <div class="ml-4 flex-1">
                                        	<div class="flex items-center space-x-3">
	                                            <img src="/assets/images/starfriends/proflie3.jpg" alt="" class="w-8 h-8 rounded-full">
	                                       		<a href="#" class="font-semibold"> 나껑충 </a>
	                                       		<div class="flex items-center space-x-2">
                                            		<span> 4시간 전 </span>
                                        		</div>
                                            </div>
                                            <p class="text-sm"> 가입한 상품의 수익률을 조회했어요. </p> 
                                            <div class="flex items-center space-x-1 text-red-400 text-xs mt-2">
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 9.16(토) 오전 10:41 </div> </div>
                                        	</div>
                                   	</div>
                                </li>
                               <li>
                                 	<div class="bg-white rounded-lg shadow-md p-3 flex "> 
                                        <div class="bg-green-600 rounded-lg w-1.5"></div>
                                        <div class="ml-4 flex-1">
                                        	<div class="flex items-center space-x-3">
	                                            <img src="/assets/images/starfriends/proflie2.jpg" alt="" class="w-8 h-8 rounded-full">
	                                       		<a href="#" class="font-semibold"> 차아거 </a>
	                                       		<div class="flex items-center space-x-2">
                                            		<span> 6시간 전 </span>
                                        		</div>
                                            </div>
                                            <p class="text-sm"> 가입한 상품의 일부를 매도했어요. </p> 
                                            <div class="flex items-center space-x-1 text-red-400 text-xs mt-2">
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 9.16(토) 오전 10:41 </div> </div>
                                        	</div>
                                   	</div>
                                </li>
                                <li>
                                 	<div class="bg-white rounded-lg shadow-md p-3 flex "> 
                                        <div class="bg-pink-600 rounded-lg w-1.5"></div>
                                        <div class="ml-4 flex-1">
                                        	<div class="flex items-center space-x-3">
	                                            <img src="/assets/images/starfriends/proflie5.jpg" alt="" class="w-8 h-8 rounded-full">
	                                       		<a href="#" class="font-semibold"> 모라무 </a>
	                                       		<div class="flex items-center space-x-2">
                                            		<span> 8시간 전 </span>
                                        		</div>
                                            </div>
                                            <p class="text-sm"> 투자상품을 추가로 가입했어요. </p> 
                                            <div class="flex items-center space-x-1 text-red-400 text-xs mt-2">
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 9.16(토) 오전 10:41 </div> </div>
                                        	</div>
                                   	</div>
                                </li>
                                <li>
                                 	<div class="bg-white rounded-lg shadow-md p-3 flex "> 
                                        <div class="bg-blue-600 rounded-lg w-1.5"></div>
                                        <div class="ml-4 flex-1">
                                        	<div class="flex items-center space-x-3">
	                                            <img src="/assets/images/starfriends/proflie1.jpg" alt="" class="w-8 h-8 rounded-full">
	                                       		<a href="#" class="font-semibold"> 나비비 </a>
	                                       		<div class="flex items-center space-x-2">
                                            		<span> 10시간 전 </span>
                                        		</div>
                                            </div>
                                            <p class="text-sm"> 가입한 상품의 수익률을 조회했어요. </p> 
                                            <div class="flex items-center space-x-1 text-red-400 text-xs mt-2">
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 9.16(토) 오전 10:41 </div> </div>
                                        	</div>
                                   	</div>
                                </li>
                                <li class="uk-filter-control">
                                <a class="bg-gray-100 py-1.5 px-4 rounded-full" href="#">2023.9.14(목)</a>
                                 	<div class="bg-white rounded-lg shadow-md p-3 flex "> 
                                        <div class="bg-yellow-600 rounded-lg w-1.5"></div>
                                        <div class="ml-4 flex-1">
                                        	<div class="flex items-center space-x-3">
	                                            <img src="/assets/images/starfriends/proflie3.jpg" alt="" class="w-8 h-8 rounded-full">
	                                       		<a href="#" class="font-semibold"> 나껑충 </a>
	                                       		<div class="flex items-center space-x-2">
                                            		<span> 2일 전 </span>
                                        		</div>
                                            </div>
                                            <p class="text-sm"> 다른 종류의 상품을 검색하고 있어요. </p> 
                                            <div class="flex items-center space-x-1 text-red-400 text-xs mt-2">
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 9.14(목) 오전 10:41 </div> </div>
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
                            <img src="/assets/images/avatars/avatar-7.jpg" alt="">
                        </div>
                        <div class="contact-username"> Alex Dolgove</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-8.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-3.jpg" alt="">
                        </div>
                        <div class="contact-username">Stella Johnson</div>
                    </a>
                    
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-5.jpg" alt="">
                        </div>
                        <div class="contact-username">Adrian Mohani </div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-6.jpg" alt="">
                        </div>
                        <div class="contact-username"> Jonathan Madano</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-1.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                   

                </div>
               <div class="p-1">
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-7.jpg" alt="">
                        </div>
                        <div class="contact-username"> Alex Dolgove</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-8.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-3.jpg" alt="">
                        </div>
                        <div class="contact-username">Stella Johnson</div>
                    </a>
                    
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-5.jpg" alt="">
                        </div>
                        <div class="contact-username">Adrian Mohani </div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-6.jpg" alt="">
                        </div>
                        <div class="contact-username"> Jonathan Madano</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="/assets/images/avatars/avatar-1.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                   

                </div>

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
    

     
  


</body>
