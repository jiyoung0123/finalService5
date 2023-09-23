<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="relative" uk-slider="finite: true">
                <div class="uk-slider-container px-1 py-3">
                    <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                        <li>
                            <a href="timeline-page.html" class="uk-link-reset">
                                <div class="card">
                                    <img src="assets/images/avatars/avatar-1.jpg" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                    <div class="p-4">
                                        <h4 class="text-base font-semibold mb-1">콜리 이미지 넣기</h4>
                                        <p class="font-medium text-sm">Level 1
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                       href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                       href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>
                </div>
            </div>

            <div class="lg:flex lg:space-x-15">
                <div class="lg:w-2/3">
                    <div class="card mb-6">
                        <div class="card-media h-28">
                            <div class="card-media-overly"></div>
                            <img src="assets/images/funding/funder-1.jpg" alt="" class="">
                        </div>
                        <div class="p-5">
                            <h4 class="text-xl font-semibold mb-1">나만의 콜리를 키워보세요!!!</h4>
                            <p class="font-medium"> Fundraiser make it easy to support friends, family and the causes that are important to you such as:</p>

                            <div class="mt-4 text-base font-medium space-y-2">
                                <div class="flex items-center">
                                    <ion-icon name="medkit"  class="text-lg mr-3"></ion-icon> Medical
                                </div>
                                <div class="flex items-center">
                                    <ion-icon name="school" class="text-lg mr-3"></ion-icon> Education
                                </div>
                                <div class="flex items-center">
                                    <ion-icon name="heart-circle" class="text-lg mr-3"></ion-icon>  Nunprofits and more
                                </div>
                            </div>
                            <a href="#" class="bg-gray-100 rounded-lg text-center py-2 block mt-6 font-medium">물 받으러 가기</a>
                        </div>
                    </div>
                </div>
            </div>

            <form id="registerColly_form">
             <div class="grid lg:grid-cols-3 mt-12 gap-8">
                <div class="bg-white rounded-md lg:shadow-md shadow col-span-2 lg:mx-16">
                    <div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
                        <div>
                            <label for="userId">직원번호</label>
                            <input type="text" name="userId" id="userId" placeholder="" class="shadow-none with-border">
                        </div>

                        <div>
                            <label for="userName">이름</label>
                            <input type="text" name="userName" id="userName"  placeholder="" class="shadow-none with-border">
                        </div>

                        <div class="col-span-2">
                            <label for="collyNickname"> 콜리닉네임</label>
                            <input type="text" name="collyNickname" id="collyNickname" placeholder="" class="shadow-none with-border">
                        </div>
                        <div>
                            <label for="groupName">소속그룹</label>
                            <input type="text" name="groupName" id="groupName" placeholder="" class="shadow-none with-border">
                        </div>

                        <div>
                            <label for="branchName">소속부점</label>
                            <input type="text" name="branchName" id="branchName" placeholder="" class="shadow-none with-border">
                        </div>
                        <div>
                            <label for="userLevel">직급</label>
                            <input type="number" name="userLevel" id="userLevel" placeholder="" class="shadow-none with-border">
                        </div>

                        <div>
                            <label for="yearOfEmp">입행년도</label>
                            <input type="date" name="yearOfEmp" id="yearOfEmp" placeholder="" class="shadow-none with-border">
                        </div>

                        <div>
                            <label for="typeOfCrops">작물 키우기</label>
                            <select id="typeOfCrops" name="typeOfCrops"  class="shadow-none selectpicker with-border ">
                                <option value="colly">브로콜리</option>
                                <option value="1">사과</option>
                                <option value="2">오렌지</option>
                                <option value="3">Married</option>
                                <option value="4">Engaged</option>
                            </select>
                        </div>
                    </div>

                    <div class="bg-gray-10 p-6 pt-0 flex justify-end space-x-3">
                        <button class="p-2 px-4 rounded bg-gray-50 text-red-500">취소</button>
                        <button id="registerColly_btn" type="button" class="button bg-blue-700">콜리 키우러 가기</button>
                    </div>
                </div>
             </div>
            </form>
        </div>
    </div>

