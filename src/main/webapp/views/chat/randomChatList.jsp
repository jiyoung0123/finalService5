<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script src="path/to/jquery.min.js"></script>
<script src="path/to/moment.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/5f198f7eda.js" crossorigin="anonymous"></script>

<script th:inline="javascript">
        let roomId;
        $(function(){
            let $maxUserCnt = $("#maxUserCnt");
            let $msgType = $("#msgType");
            // 모달창 열릴 때 이벤트 처리 => roomId 가져오기
            $("#enterRoomModal").on("show.bs.modal", function (event) {
                roomId = $(event.relatedTarget).data('id');
                // console.log("roomId: " + roomId);
            });

            $("#confirmPwdModal").on("show.bs.modal", function (e) {
                roomId = $(e.relatedTarget).data('id');
                // console.log("roomId: " + roomId);
            });

            // 채팅방 설정 시 비밀번호 확인
            confirmPWD();

            // 문자 채팅 누를 시 disabled 풀림
            $msgType.change(function(){
                if($msgType.is(':checked')){
                    $maxUserCnt.attr('disabled', false);
                }
            })
        })

        // 채팅방 설정 시 비밀번호 확인 - keyup 펑션 활용
        function confirmPWD(){
            $("#confirmPwd").on("keyup", function(){
                let $confirmPwd = $("#confirmPwd").val();
                const $configRoomBtn = $("#configRoomBtn");
                let $confirmLabel = $("#confirmLabel");

                $.ajax({
                    type : "post",
                    url : "/chat/confirmPwd/"+roomId,
                    data : {
                        "roomPwd" : $confirmPwd
                    },
                    success : function(result){
                        // console.log("동작완료")

                        // result 의 결과에 따라서 아래 내용 실행
                        if(result){ // true 일때는
                            // $configRoomBtn 를 활성화 상태로 만들고 비밀번호 확인 완료를 출력
                            $configRoomBtn.attr("class", "btn btn-primary");
                            $configRoomBtn.attr("aria-disabled", false);

                            $confirmLabel.html("<span id='confirm'>비밀번호 확인 완료</span>");
                            $("#confirm").css({
                                "color" : "#0D6EFD",
                                "font-weight" : "bold",
                            });

                        }else{ // false 일때는
                            // $configRoomBtn 를 비활성화 상태로 만들고 비밀번호가 틀립니다 문구를 출력
                            $configRoomBtn.attr("class", "btn btn-primary disabled");
                            $configRoomBtn.attr("aria-disabled", true);

                            $confirmLabel.html("<span id='confirm'>비밀번호가 틀립니다</span>");
                            $("#confirm").css({
                                "color" : "#FA3E3E",
                                "font-weight" : "bold",
                            });
                        }
                    }
                })
            })
        }

        // 채팅 인원 숫자만 정규식 체크
        function numberChk(){
            let check = /^[0-9]+$/;
            if (!check.test($("#maxUserCnt").val())) {
               Swal.fire ({
                    icon: 'error',
                    title: '필수값 오류',
                    text: '채팅 인원에는 숫자만 입력 가능합니다!!'
                })
                //alert("채팅 인원에는 숫자만 입력 가능합니다!!")
                return false;
            }
            return true;
        }

        // 채팅방 생성confirmPWD

        // 채팅방 입장 시 비밀번호 확인
        function enterRoom(){
            let $enterPwd = $("#enterPwd").val();

            $.ajax({
                type : "post",
                url : "/chat/confirmPwd/"+roomId,
                async : false,
                data : {
                    "roomPwd" : $enterPwd
                },
                success : function(result){
                    // console.log("동작완료")
                    // console.log("확인 : "+chkRoomUserCnt(roomId))

                    if(result){
                        if (chkRoomUserCnt(roomId)) {
                            location.href = "/chat/room?roomId="+roomId;
                        }
                    }else{
                        alert("비밀번호가 틀립니다. \n 비밀번호를 확인해주세요")
                    }
                }
            })
        }

        // 채팅방 삭제
        function delRoom(){
            location.href = "/chat/delRoom/"+roomId;
        }
        function editRoom(){
            $.ajax({
                type : "post",
                url : "/chat/editRoom/"+roomId,
                async : false,
                data : {
                    "chRoomPwd" : chRoomPwd,
                    "chRoomName" : chRoomName,
                    "chUserCount" : chUserCount,
                    "chSecretChk" : chSecretChk
                },
                success : function(result){
                    // console.log("동작완료")
                    // console.log("확인 : "+chkRoomUserCnt(roomId))

                    if(result){
                        if (chkRoomUserCnt(roomId)) {
                            location.href = "/chat/room?roomId="+roomId;
                        }
                    }else{
                        alert("비밀번호가 틀립니다. \n 비밀번호를 확인해주세요")
                    }
                }
            })

        }

        // 채팅방 입장 시 인원 수에 따라서 입장 여부 결정
        function chkRoomUserCnt(roomId){
            let chk;

            // 비동기 처리 설정 false 로 변경 => ajax 통신이 완료된 후 return 문 실행
            // 기본설정 async = true 인 경우에는 ajax 통신 후 결과가 나올 때까지 기다리지 않고 먼저 return 문이 실행되서
            // 제대로된 값 - 원하는 값 - 이 return 되지 않아서 문제가 발생한다.
            $.ajax({
                type : "GET",
                url : "/chat/chkUserCnt/"+roomId,
                async : false,
                success : function(result){

                    // console.log("여기가 먼저")
                    if (!result) {
                        alert("채팅방이 꽉 차서 입장 할 수 없습니다");
                    }
                    chk = result;
                }
            })
            return chk;
        }
</script>
<style>
        a {
            text-decoration: none;
        }

        #table {
            margin-top: 40px;
        }

        h2 {
            margin-top: 40px;
        }

        input#maxUserCnt {
            width: 160px;
        }

        span.input-group-text.input-password-hide {
            height: 40px;
        }

        span.input-group-text.input-password-show {
            height: 40px;
        }
    </style>
<section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('img/photo/restaurant-1515164783716-8e6920f3e77c.jpg');">
        <div class="container overlay-content">
            <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
                <div class="text-white mb-4 mb-lg-0">
                    <div class="badge badge-pill badge-transparent px-3 py-2 mb-4" style="color: black">실시간 채팅</div>
                    <h1 class="text-shadow verified">같은 여행을 꿈꾸는 사람들과 연결되세요&nbsp;<i class="fa fa-heart"></i></h1>
                    <p><i class="fa-map-marker-alt fas me-2"></i>공유숙소 커뮤니티 함께 만들어요!!</p>
                    <p class="mb-0 d-flex align-items-center">${list.size()}&nbsp;Chat Rooms</p>
                </div>
                <div class="calltoactions"><a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal">방 개설하기</a></div>
            </div>
        </div>
</section>


<div class="container">
    <div class="container-fluid py-5 px-lg-5">
            <c:choose>
            <c:when test="${loginGuest == null}">
                <div class="row">
                    <div class="col">
                        <a href="/login"><button type="button" class="btn btn-primary">로그인하기</button></a>
                    </div>
                </div>
            </c:when>
            </c:choose>
        <table class="table table-hover table-striped" id="table">
            <thead>
            <tr style="text-align: center;">
                <th scope="col">채팅방명</th>
                <th scope="col">지역</th>
                <th scope="col">잠금</th>
                <th scope="col">참여 인원</th>
                <th scope="col">개설일자</th>
                <th scope="col">채팅방 설정</th>
            </tr>
            </thead>
            <c:forEach var="room" items="${list}">
                <span class="hidden" id="${room.roomName}"></span>

                <tr>
                    <th style="padding-left: 20px;">
                        <c:if test="${room.secretChk}">
                            <a style="color: slategray" href="#enterRoomModal" data-bs-toggle="modal" data-target="#enterRoomModal" data-id="${room.roomId}">${room.roomName}</a>
                        </c:if>
                        <c:if test="${not room.secretChk}">
                            <a style="color: black;" href="/chat/room?roomId=${room.roomId}" roomId="${room.roomId}" onclick="return chkRoomUserCnt(this.getAttribute('roomId'));">${room.roomName}</a>
                        </c:if>
                    </th>
                    <td style="text-align: center;">${room.roomLoc}</td>
                    <td style="text-align: center;">
                        <span >
                            <c:if test="${room.secretChk}">
                                🔒︎
                            </c:if>
                        </span>
                    </td>
                    <td style="text-align: center;">
                        <span class="testimonial-text">${room.userCount}/${room.maxUserCnt}</span>
                    </td>
                    <td style="text-align: center;">
                        <span class="label-heading">
                               <fmt:formatDate value="${room.createDate}" pattern="yyyy년 MMM dd일"/>
                        </span>
                    </td>
                    <td style="text-align: center; padding-left: 20px;">
                        <button  style="font-size: 0.775rem;" class="tdate-tile me-3 btn btn-outline-primary" id="configRoom" data-bs-toggle="modal" data-bs-target="#confirmPwdModal" data-id="${room.roomId}">방 설정</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="modal fade" id="roomModal" tabindex="-1" aria-labelledby="roomModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방 생성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/chat/createroom" onsubmit="return createRoom()">
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="hidden" name="createUserId" value="${loginGuest.guestId}">
                        <label for="roomName" class="col-form-label">방 이름</label>
                        <input type="text" class="form-control" id="roomName" name="roomName">
                    </div>
                    <div class="mb-3">
                        <label for="roomPwd" class="col-form-label">방 설정 번호(방 삭제시 필요합니다)</label>
                        <div class="input-group">
                            <input type="password" name="roomPwd" id="roomPwd" class="form-control" data-toggle="password">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fa fa-eye"></i></span>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="roomLoc" class="col-form-label">채팅방 지역</label>
                        <input type="text" class="form-control" id="roomLoc" name="roomLoc">
                    </div>

                    <div class="mb-3">
                        <label for="maxUserCnt" class="col-form-label">채팅방 인원 설정
                            <!--<input class="form-check-input" type="checkbox" id="maxChk">--></label>
                        <input type="text" class="form-control" id="maxUserCnt" name="maxUserCnt">
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="secret">
                        <input type="hidden" name="secretChk" id="secretChk" value="">
                        <label class="form-check-label" for="secret">
                            채팅방 잠금
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="방 생성하기">
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="enterRoomModal" tabindex="-1" aria-labelledby="enterRoomModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방 비밀번호를 입력해주세요</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="roomName" class="col-form-label">방 비밀번호</label>
                    <div class="input-group">
                        <input type="password" name="roomPwd" id="enterPwd" class="form-control" data-toggle="password">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fa fa-eye"></i></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="enterRoom()">입장하기</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="confirmPwdModal" aria-hidden="true" aria-labelledby="ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방 설정을 위한 패스워드 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="confirmPwd" class="col-form-label" id="confirmLabel">비밀번호 확인</label>
                <div class="input-group">
                    <input type="password" name="confirmPwd" id="confirmPwd" class="form-control" data-toggle="password">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-eye"></i></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="configRoomBtn" class="btn btn-primary disabled" data-bs-target="#configRoomModal" data-bs-toggle="modal" aria-disabled="true">채팅방 설정하기</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="configRoomModal" tabindex="-1" aria-labelledby="roomModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅방 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="chRoomPwd" class="col-form-label">비밀번호 변경</label>
                    <div class="input-group">
                        <input type="password" name="chRoomPwd" id="chRoomPwd" class="form-control" data-toggle="password">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fa fa-eye"></i></span>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="chRoomName" class="col-form-label">채팅방 이름 변경</label>
                    <input type="text" class="form-control" id="chRoomName" name="chRoomName">
                </div>
                <div class="mb-3">
                    <label for="chUserCount" class="col-form-label">채팅방 인원 변경</label>
                    <input type="text" class="form-control" id="chUserCount" name="chUserCount">
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="chSecret">
                    <input type="hidden" name="secretChk" id="chSecretChk" value="">
                    <label class="form-check-label" for="secret">
                        채팅방 잠금
                    </label>
                </div>
                <br>
                <div class="mb-3">
                    <button type="button" class="btn btn-primary" onclick="delRoom()">방 삭제</button>
                </div>
            </div>
            <div class="modal-footer">
                <button id="editBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="editRoom()">변경하기</button>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>

<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
      integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
      crossorigin="anonymous">
<script src="/js/roomlist/bootstrap-show-password.min.js"></script>