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

                <div class="lg:flex lg:space-x-12">
                    
                    <div class="lg:w-2/3 flex-shirink-0">
                    
                        <!--  --> <div uk-filter="target: .js-filter">
                        <div class="flex justify-between relative md:mb-4 mb-3">
                            <div class="flex-1">
                                <h2 class="text-2xl font-semibold"> My고객관리 </h2>
                                <nav class="responsive-nav md:m-0 -mx-4 style-2">
                                    <ul uk-switcher="connect: #group-details; animation: uk-animation-fade">
                                    <li class="uk-active" uk-filter-control><a href="#" class="active lg:px-2"> 최근가입순 </a></li>
                                        <li uk-filter-control=".data-color-amount"><a href="#" class="lg:px-2"> 고투자금액 </a></li>
                                        <li uk-filter-control=".data-color-grade"><a href="#" class="lg:px-2"> 수익률관리대상 </a></li>
                                        <li uk-filter-control=".data-color-risk"><a href="#" class="lg:px-2"> 위험관리대상 </a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                       
                            <ul class="card divide-y divide-gray-100 sm:m-0 -mx-5 js-filter">
                                <li class="data-color-grade data-color-risk">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="/assets/images/starfriends/proflie1.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1">나비비  </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 1일 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3">상품명 : 한국투자 미국 배당귀족 증권자투자신탁H(주식) A-e</p>
                                        <p class="leading-6 line-clamp-2 mt-3">매월 적립 중 | 현재까지 투자금액 5,896,000원</p>
                                            <!-- 고객상담 메모이력보기 -->
                                            <ul class="list-group items-start space-y-3" style="display: none;">
                                                <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                                <hr>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                                <hr>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                                <hr>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                            
                                            </ul>
                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 4 </span>
                                        </div>
                                    </div>
                                </li>

                                <li class="data-color-risk">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="assets/images/starfriends/proflie3.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1"> 나껑충 </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 4일 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 상품명 : 피델리티 인디아 증권자투자신탁(주식)-Ce</p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 매월 적립 중 | 현재까지 투자금액 2,300,000원 </p>
                                        <!-- 고객상담 메모이력보기 -->
                                        <ul class="list-group items-start space-y-3" style="display: none;">
                                            <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                        
                                        </ul>
                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 3 </span>
                                        </div>
                                    </div>
                                </li>
                                <li class="data-color-amount">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="assets/images/starfriends/proflie4.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1"> 수콜리 </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 14일 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 상품명 : 베어링 고배당 증권자투자신탁(주식) AE </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 매월 적립 중 | 현재까지 투자금액 13,000,000원 </p>
                                        <!-- 고객상담 메모이력보기 -->
                                        <ul class="list-group items-start space-y-3" style="display: none;">
                                            <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                        </ul>
                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 1 </span>
                                        </div>
                                    </div>
                                </li>
                                <li class="data-color-grade">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="assets/images/starfriends/proflie2.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1"> 차아거 </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 3주 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 상품명 : KB스타 ESG 우량 중단기채 증권자투자신탁(채권) CE 적</p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 매월 적립 중 | 현재까지 투자금액 2,300,000원 </p>
                                            <!-- 고객상담 메모이력보기 -->
                                            <ul class="list-group items-start space-y-3" style="display: none;">
                                                <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                                <hr>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                            </ul>
                                        
                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 2 </span>
                                        </div>
                                    </div>
                                </li>
                                <li class="data-color-risk data-color-amount">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="assets/images/starfriends/proflie2.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1"> 안무러 </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 3주 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 상품명 : 일임형 ISA</p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 매월 적립 중 | 현재까지 투자금액 35,000,000원 </p>
                                            <!-- 고객상담 메모이력보기 -->
                                            <ul class="list-group items-start space-y-3" style="display: none;">
                                                <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                                <hr>
                                                <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                            </ul>
                                        
                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 2 </span>
                                        </div>
                                    </div>
                                </li>
                                <li class="data-color-amount">
                                    <div class="flex items-start space-x-5 p-7">
                                        <img src="assets/images/starfriends/proflie5.jpg" alt="" class="w-12 h-12 rounded-full">
                                        <div class="flex-1">
                                            <a href="/mycust/dashboard" class="text-lg font-semibold line-clamp-1 mb-1"> 모라무 </a>
                                            <p class="text-sm text-gray-400 mb-2"> 관리한 지 한 달 전 </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 상품명 : KB PIMCO 글로벌 인컴 셀렉션 증권자투자신탁(채권-재간접형)(H) AE </p>
                                        <p class="leading-6 line-clamp-2 mt-3"> 매월 적립 중 | 현재까지 투자금액 7,300,000원 </p>
                                        
                                        <!-- 고객상담 메모이력보기 -->
                                        <ul class="list-group items-start space-y-3" style="display: none;">
                                            <li class="mt-5"><span class="icon-material-outline-assignment font-bold"><span><span class="font-bold">  고객상담 세부이력</span></li>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32 mt-10"><span class="icon-material-outline-check"></span>  투자포트폴리오 발송 완료</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  고객 관심상품에 대한 상담요청 접수로 통화 완료</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  비대면채널에서 상품추천 분석 실시 데이터 파악으로 추가매수 권유</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  가입 후 1개월 경과로 시장동향 안내 전화</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  상품가입 후 해피콜 실시</li>
                                            <hr>
                                            <li class="list-group-item bg-gray-100 w-full h-5 rounded lg:mr-32"><span class="icon-material-outline-check"></span>  상품가입 시 고객성향 파악 메모(체계적인 단계투자 선호)</li>
                                        </ul>

                                        </div>
                                        <div class="sm:flex items-center space-x-4 hidden navbar-toggler" style="cursor: pointer;">
                                            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path><path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path></svg>
                                            <span class="text-xl"> 6 </span>
                                        </div>
                                    </div>
                             
                                </li>
                            </ul>
                        </div>
                        <h2 class="text-xl font-semibold mb-6 lg:mt-10 mt-4"> My상품별 고객관리 </h2>
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
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-green-100 text-green-500 font-semibold"> 5+</div>
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
                                            <div class="text-gray-500"> 3명 가입 중</div>
                                        </div>
                                    </div>
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
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-red-100 text-red-500 font-semibold"> 3+</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center space-x-5 p-7">
                                    <img src="/assets/images/starfriends/proflie3.jpg" alt="" class="w-12 h-12 rounded-full">
                                    <div class="flex-1">
                                        <a href="#" class="text-lg font-semibold line-clamp-1"> 피델리티 인디아 증권자투자신탁(주식)-Ce </a>
                                        <div class="flex space-x-3 text-sm pb-2 mt-1 flex-wrap font-medium"> 
                                            <a href="timeline.html" class="font-semibold"> 보통 위험 | 해외채권 </a>
                                            <div class="text-gray-500"> Oct 20Th , 2020 </div>
                                            <div class="text-gray-500"> 4명 가입 중 </div>
                                        </div>
                                    </div>
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
                                        <div class="w-10 h-10 rounded-full flex justify-center items-center bg-green-100 text-green-500 font-semibold"> 4+</div>
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
                                    <a class="bg-gray-100 py-1.5 px-4 rounded-full" href="#">2023.12.15(금)</a>
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
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 12.15(금) 오전 10:41 </div> </div>
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
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 12.15(금) 오전 10:41 </div> </div>
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
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 12.15(금) 오전 10:41 </div> </div>
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
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 12.15(금) 오전 10:41 </div> </div>
                                        	</div>
                                   	</div>
                                </li>
                                <li class="uk-filter-control">
                                <a class="bg-gray-100 py-1.5 px-4 rounded-full" href="#">2023.12.14(목)</a>
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
                                            	<i class="icon-feather-calendar pr-1"></i> <div> 12.14(목) 오전 10:41 </div> </div>
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