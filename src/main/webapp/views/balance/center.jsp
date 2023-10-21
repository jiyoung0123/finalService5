<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- 현재 페이지 스크립트 정의 -->


<script>



    //@작성자 : 최준혁
    //@작성일 : 2023-09-10
    //@라우터 : /stock
    //@적용 : center.jsp
    //@desc : document load 시 사전에 정의된 uri로 업비트 웹소켓 적용







    $(()=>{
        stockApi.init();
        websocketConnect(4); //websocket 4개 활성화
        //stockApi.searchPrice('tsla');
        //debugger; //디버깅
        crwalStock.init();
    });






</script>




    <div class="main_content">
        <div class="mcontainer">




        </div>
    </div>

















