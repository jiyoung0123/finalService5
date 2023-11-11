<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .list-group-item{
        color: #0c0c0c;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- My 고객관리 메인 페이지 -->
<body>
<!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                
                <div class="max mx-auto">
                    
                    <div class="card sm:p-7 p-4">

                        <div class="flex items-center space-x-3">
                            <ion-icon name="gift" class="text-yellow-500 text-xl bg-yellow-50 p-1 rounded-md"></ion-icon>
                            <div class="text-xl font-semibold">  My프로필 설정하기 </div>
                        </div>

                        <div class="space-y-8 mt-10">
                            <div class=" flex-1 sm:space-y-8 space-y-6">
                            <!-- 이미지 선택하기 -->
                             
                				 <div class="text-base font-semibold"> 나의 캐릭터 </div>
                				 <div class="font-medium text-sm text-gray-400" style="margin-top:3px;"> 나를 표현하는 이미지를 1개 선택해 주세요.</div>
                				 <div class="flex items-center justify-around" style="margin-bottom:15px;">
                				   <img src="/assets/images/starfriends/proflie1.jpg" alt="" class="sm:w-20 sm:h-20 w-14 h-14 rounded-full">
                                   <img src="/assets/images/starfriends/proflie2.jpg" alt="" class="sm:w-20 sm:h-20 w-14 h-14 rounded-full">
                                   <img src="/assets/images/starfriends/proflie3.jpg" alt="" class="sm:w-20 sm:h-20 w-14 h-14 rounded-full">
                                   <img src="/assets/images/starfriends/proflie4.jpg" alt="" class="sm:w-20 sm:h-20 w-14 h-14 rounded-full">
                                   <img src="/assets/images/starfriends/proflie5.jpg" alt="" class="sm:w-20 sm:h-20 w-14 h-14 rounded-full">
                                 </div>       
                			<!-- //이미지 선택하기 -->
                				 
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                     <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#">  나의 이름 </a> </div>
                                            <div class="font-medium text-sm text-blue-400"> 사용 가능</div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="게시판에서 사용할 닉네임, 별명 등을 설정해 주세요.">
                                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#">  나의 상태명 </a> </div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="나를 표현하고 싶은 메세지를 작성해 주세요.">
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
                                            <input type="text" name="" id="" class="with-border" placeholder="부점명">
                                        </div>
                                    </div>
                                </div>
                         
                            </div>
                            <div class="relative cursor-pointer" uk-toggle="target: #upcoming1; animation: uk-animation-fade">
                                <div class="bg-blue-50 rounded-lg px-5 py-4 font-semibold text-base"> 나의 관심종목 </div>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400" id="upcoming" hidden></i>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400" id="upcoming"></i>
                            </div>
                            <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming1" hidden>
                			<div class="font-medium text-sm text-gray-400"> 내가 관심있게 보고싶은 종목을 드래그하여 놓아주세요.</div>
                           
                          <div class="grid md:grid gap-2">
                           <div class="bg-gray-200 rounded-md p-4 pb-10">
                                        <h4 class="-m-4 mb-4 border-b border-gray-300 font-semibold mb-2 px-3 py-2 text-lg text-gray-700">나의 종목 담기</h4>
                                        <div uk-sortable="group: sortable-group">
                                             <!-- 드래그해서 끌어올 공간-->
                                             <div class="bg-gray-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-gray-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                예시) ETF/골드
                                            </div>
                                        </div>
                           </div>
                            <div class="grid md:grid-cols-3 gap-2">
    						 <!-- 관심종목 선택하기 -->
                                    <div class="bg-blue-200 rounded-md p-4 pb-10">
                                        <h4 class="-m-4 mb-4 border-b border-blue-300 font-semibold mb-2 px-3 py-2 text-lg text-blue-700">신탁</h4>
                                        <div uk-sortable="group: sortable-group">

                                            <div class="bg-blue-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-blue-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                ETF/골드
                                            </div>
                                            <div class="bg-blue-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-blue-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                ELS
                                            </div>
                                            <div class="bg-blue-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-blue-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                유언대용신탁  
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="bg-green-200 rounded-md p-4 pb-10">
                                        <h4 class="-m-4 mb-4 border-b border-green-300 font-semibold mb-2 px-3 py-2 text-lg text-green-700">펀드</h4>
                                        <div uk-sortable="group: sortable-group">
                                             
                                            <div class="bg-green-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-green-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                주식형/ELS  
                                            </div>
                                            <div class="bg-green-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-green-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                외화펀드  
                                            </div>
                                            <div class="bg-green-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-green-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                연금저축펀드  
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="bg-pink-200 rounded-md p-4 pb-10">
                                        <h4 class="-m-4 mb-4 border-b border-pink-300 font-semibold mb-2 px-3 py-2 text-lg text-pink-700">절세</h4>
                                        <div uk-sortable="group: sortable-group">
                                             
                                            <div class="bg-pink-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-pink-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                ISA 
                                            </div>
                                            <div class="bg-pink-500 rounded text-center text-white flex items-center mb-2">
                                                <span class="uk-sortable-handle rounded-l-md p-3 text-base bg-pink-600 mr-5 text-white"> <i class="icon-feather-move"></i> </span>
                                                퇴직연금 
                                            </div>
                                            
                                            
                                        </div>
                                    </div>


                                </div>
                            </div>
                            </div>
                            <!-- //관심종목 선택하기 -->
                           
                             <div class="relative cursor-pointer" uk-toggle="target: #upcoming2; animation: uk-animation-fade">
                                <div class="bg-blue-50 rounded-lg px-5 py-4 font-semibold text-base"> 나의 목표설정 </div>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400" id="upcoming" hidden></i>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400" id="upcoming"></i>
                            </div>
                            
                            <!-- 두번째 토글 -->
                            <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming2" hidden>
                				<div class="font-medium text-sm text-gray-400"> 내가 도전할 목표를 1개 선택하고 그에 대한 세부내용을 작성하세요.</div>
                				<div class="uk-child-width-1-3@m" uk-grid uk-scrollspy="cls: uk-animation-slide-bottom; target: .card; delay: 300; repeat: true">
                                   <div>
                                       <div class="card p-5">
                                           <h3 class="text-lg font-semibold mb-2">최다판매왕 되기!</h3>
                                           <p>꾸준히 오래하면 달성가능해요.<br>중요한건 꺾이지 않는 마음!</p>
                                       </div>
                                   </div>
                                   <div>
                                       <div class="card p-5" uk-scrollspy-class="uk-animation-slide-top">
                                           <h3 class="text-lg font-semibold mb-2">목표금액 초과 달성하기!</h3>
                                           <p>만기/자동예치 내점 고객을 주 타깃으로 한다면 더욱 유리하겠죠?</p>
                                       </div>
                                   </div>
                                   <div>
                                       <div class="card p-5">
                                           <h3 class="text-lg font-semibold mb-2">이번주 직원 Pick 선정되기!</h3>
                                           <p>주변 동료들에게 '나'를 보여줄 기회!<br>KB의 유명인사 나야나~!</p>
                                       </div>
                                   </div>
                               </div>
                				<!-- 수기작성칸 -->
                 				<div class="flex items-center sm:space-x-6 space-x-3">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#">  세부 목표내용 입력 </a> </div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="작성예시) 목표 판매횟수 : 15회 / 목표 판매금액 : 1억원 / 12월 31일까지 직원 Pick 선정되기">
                                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                            
                        </div>

						<div class="flex justify-center border-gray-100 py-8">
							<button class="button lg:w-1/3">프로필 설정 완료</button>
						</div>

                    </div>

                </div>

            </div>
        </div>


   
    

    <script>
// 고객상담메모이력 : 토글
$(document).ready( function(){
    $('.navbar-toggler').click( function(){
    $('.list-group').toggle('slow');
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
