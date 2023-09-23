<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="my-2 flex items-center justify-between pb-3">
                <div>
                    <h2 class="text-xl font-semibold">나의 농장에 콜리를 키워 보세요!!</h2>
                </div>
            </div>
            <div class="lg:flex lg:space-x-10">
                <div class="lg:w-2/3">
                    <div class="flex justify-between items-center relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <h2 class="text-2xl font-semibold">콜리팜</h2>
                        </div>
                    </div>
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
                                            </div>
                                        </div>
                                    </a>
                                    <div class="mt-3">

                                        <div class="bg-gray-100 rounded-2xl h-2 w-full relative overflow-hidden">
                                            <div class="bg-blue-600 w-1/3 h-full"></div>
                                        </div>

                                        <div class="text-blue-500 font-medium mb-2"> <span> 레벨업까지 50% !</span> </div>
                                    </div>
                                </li>

                            </ul>
                            <div class="bg-gray-10 p-6 pt-0 flex">
                                <button id="registerColly_btn" type="button" class="button bg-blue-700">물 주기</button>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="divide-y divide-gray-100 card px-5 py-2">
                        <div class="flex sm:flex-row flex-col sm:space-x-5 py-5 relative w-full">
                            <a href="timeline-fundraiser.html" class="sm:w-56 w-full h-36 sm:h-auto overflow-hidden rounded-lg relative shadow flex-shrink-0">
                                <img src="assets/images/funding/funder-3.jpg" alt="" class="w-full h-full absolute inset-0 object-cover">
                            </a>
                            <div class="flex-1 relative sm:mt-0 mt-4">
                                <a href="timeline-fundraiser.html" class="text-lg font-semibold line-clamp-2"> Racing to End Duchenne </a>

                                <div class="mt-1 text-sm font-medium">${rcolly.collyNickname}</div>
                                <div class="mt-3">
                                    <div class="text-blue-500 font-medium mb-2"> <span> 2,429,000</span> <span> of</span> <span> 32,000,000</span> Raised </div>
                                    <div class="bg-gray-100 rounded-2xl h-2 w-full relative overflow-hidden">
                                        <div class="bg-blue-600 w-1/3 h-full"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <a href="/" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                            물주기
                        </a>

                    </div>


                </div>



            </div>

        </div>
    </div>

