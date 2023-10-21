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

