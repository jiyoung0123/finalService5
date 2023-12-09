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


<style>
  a {
    text-decoration: none !important;
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


<-- Main Contents -->
  <div class="main_content">
    <div class="mcontainer">
      <div class="flex justify-between relative md:mb-4 mb-3">
        <div class="flex-1">
          <%--<h2 class="text-2xl font-semibold"> Groups </h2>--%>
          <nav class="responsive-nav border-b md:m-0 -mx-4">
            <ul>
              <li class="active"><a href="#" class="lg:px-2">추천 </a></li>
              <li><a href="#" class="lg:px-2"> 최근 개설 </a></li>
              <li><a href="#" class="lg:px-2"> 우리 지점 </a></li>
            </ul>
          </nav>
        </div>
        <a href="/" class="flex items-center justify-center h-9 lg:px-5 px-2 rounded-md bg-blue-600 text-white space-x-1.5 absolute right-0"
           data-bs-toggle="modal" data-bs-target="#roomModal">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5">
            <path fill-rule="evenodd"
                  d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z"
                  clip-rule="evenodd"></path>
          </svg>
          <span class="md:block hidden"> 개설하기 </span>

        </a>

        <div class="calltoactions"><a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal">방 개설하기</a></div>
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
                  <input type="hidden" name="createUserId" value="taebin100@hanmail.net">
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
                  <label for="roomLoc" class="col-form-label">채팅방 주제</label>
                  <input type="text" class="form-control" id="roomLoc" name="roomLoc">
                </div>

                <div class="mb-3">
                  <label for="maxUserCnt" class="col-form-label">채팅방 인원 설정
                    <!--<input class="form-check-input" type="checkbox" id="maxChk">--></label>
                  <input type="text" class="form-control" id="maxUserCnt" name="maxUserCnt">
                </div>

                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="secretChk" name="secretChk" value="true">
                  <input type="hidden" name="secretChk" value="false">
                  <label class="form-check-label" >
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

      <div class="relative" uk-slider="finite: true">

        <div class="uk-slider-container px-1 py-3">
          <ul class="uk-slider-items uk-child-width-1-4@m uk-child-width-1-3@s uk-grid-small uk-grid">
            <c:forEach var="room" items="${list}">
            <li>
              <div class="card">
                <div class="card-media h-28">
                  <div class="card-media-overly"></div>
                  <img src="assets/images/els.png" alt="" class="">
                  <c:if test="${room.secretChk}">
                    <div class="absolute bg-red-100 font-semibold px-2.5 py-1 rounded-lg text-red-500 text-xs top-2.5 left-2.5">잠금🔒︎</div>
                  </c:if>

                </div>

                <div class="card-body">
                  <span class="hidden" id="${room.roomName}"></span>
                  <c:if test="${room.secretChk}">
                  <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" class="font-semibold text-lg truncate" data-id="${room.roomId}">${room.roomName}</a>
                  </c:if>

                  <c:if test="${not room.secretChk}">
                    <a href="/chat/room?roomId=${room.roomId}" roomId="${room.roomId}"  class="font-semibold text-lg truncate" roomId="${room.roomId}" onclick="return chkRoomUserCnt(this.getAttribute('roomId'));">${room.roomName}</a>
                  </c:if>

                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#"> <span>주제 : ${room.roomLoc}</span> </a>
                  </div>

                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#">
                      <span>
                          <fmt:formatDate value="${room.createDate}" pattern="yyyy년 MMM dd일"/>

                      </span> </a>
                  </div>
                  <div class="flex mt-3.5 space-x-2">
                    <%--<div class="flex items-center -space-x-2 -mt-1">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-6.jpg" class="border-2 border-white rounded-full w-7">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-5.jpg" class="border-2 border-white rounded-full w-7">
                    </div>--%>
                    <div class="flex-1 leading-5 text-sm">
                      <div> <strong>${room.userCount}명 참여중</strong> /${room.maxUserCnt}명</div>
                    </div>
                  </div>

                  <div class="flex mt-3.5 space-x-2 text-sm font-medium">
                    <c:if test="${room.secretChk}">
                    <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" data-id="${room.roomId}" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                      입장
                    </a>
                    </c:if>

                    <c:if test="${not room.secretChk}">
                      <a href="/chat/room?roomId=${room.roomId}" roomId="${room.roomId}"  class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize" roomId="${room.roomId}" onclick="return chkRoomUserCnt(this.getAttribute('roomId'));">입장</a>
                    </c:if>
                    <a href="#" class="bg-gray-200 flex flex-1 h-8 items-center justify-center rounded-md capitalize">
                      방 설정
                    </a>

                  </div>

                </div>


              </div>
            </li>

            </c:forEach>

            <li>
              <div class="card">
                <div class="card-media h-28">
                  <div class="card-media-overly"></div>
                  <img src="assets/images/항셍.png" alt="" class="">
                    <div class="absolute bg-red-100 font-semibold px-2.5 py-1 rounded-lg text-red-500 text-xs top-2.5 left-2.5">Full🔒</div>
                </div>

                <div class="card-body">
                  <span class="hidden" id="${room.roomName}"></span>

                    <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" class="font-semibold text-lg truncate">홍콩 H지수 전망 토론</a>




                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#"> <span>주제 : H지수 관련 (훈수금지)</span> </a>
                  </div>

                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#">
                      <span>
                          2023년 12월 14일
                      </span> </a>
                  </div>
                  <div class="flex mt-3.5 space-x-2">
                    <%--<div class="flex items-center -space-x-2 -mt-1">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-6.jpg" class="border-2 border-white rounded-full w-7">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-5.jpg" class="border-2 border-white rounded-full w-7">
                    </div>--%>
                    <div class="flex-1 leading-5 text-sm">
                      <div> <strong>50명 참여중</strong> /50명</div>
                    </div>
                  </div>

                  <div class="flex mt-3.5 space-x-2 text-sm font-medium">
                    <c:if test="${room.secretChk}">
                      <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" data-id="${room.roomId}" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                        입장
                      </a>
                    </c:if>

                    <c:if test="${not room.secretChk}">
                      <a href="/chat/room?roomId=${room.roomId}" roomId="${room.roomId}"  class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize" roomId="${room.roomId}" onclick="return chkRoomUserCnt(this.getAttribute('roomId'));">입장</a>
                    </c:if>
                    <a href="#" class="bg-gray-200 flex flex-1 h-8 items-center justify-center rounded-md capitalize">
                      방 설정
                    </a>

                  </div>

                </div>


              </div>
            </li>

            <li>
              <div class="card">
                <div class="card-media h-28">
                  <div class="card-media-overly"></div>
                  <img src="assets/images/엔화약세.png" alt="" class="">
                  <div class="absolute bg-red-100 font-semibold px-2.5 py-1 rounded-lg text-red-500 text-xs top-2.5 left-2.5">잠금🔒︎</div>

                </div>

                <div class="card-body">
                  <span class="hidden" id="${room.roomName}"></span>

                  <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" class="font-semibold text-lg truncate">강동 8PG 외환담당</a>




                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#"> <span>주제 : 엔화약세 언제까지...?</span> </a>
                  </div>

                  <div class="flex items-center flex-wrap space-x-1 mt-1 text-sm text-gray-500 capitalize">
                    <a href="#">
                      <span>
                          2023년 12월 15일
                      </span> </a>
                  </div>
                  <div class="flex mt-3.5 space-x-2">
                    <%--<div class="flex items-center -space-x-2 -mt-1">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-6.jpg" class="border-2 border-white rounded-full w-7">
                      <img alt="Image placeholder" src="assets/images/avatars/avatar-5.jpg" class="border-2 border-white rounded-full w-7">
                    </div>--%>
                    <div class="flex-1 leading-5 text-sm">
                      <div> <strong>8명 참여중</strong> /10명</div>
                    </div>
                  </div>

                  <div class="flex mt-3.5 space-x-2 text-sm font-medium">
                    <c:if test="${room.secretChk}">
                      <a href="#enterRoomModal"  data-bs-toggle="modal" data-target="#enterRoomModal" data-id="${room.roomId}" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                        입장
                      </a>
                    </c:if>

                    <c:if test="${not room.secretChk}">
                      <a href="/chat/room?roomId=${room.roomId}" roomId="${room.roomId}"  class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize" roomId="${room.roomId}" onclick="return chkRoomUserCnt(this.getAttribute('roomId'));">입장</a>
                    </c:if>
                    <a href="#" class="bg-gray-200 flex flex-1 h-8 items-center justify-center rounded-md capitalize">
                      방 설정
                    </a>

                  </div>

                </div>


              </div>
            </li>





          </ul>

          <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white" href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
          <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white" href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

        </div>
      </div>
      <br>
      <br>

      <div class="sm:my-6 my-3 flex items-center justify-between border-b pb-3">
        <div>
          <h2 class="text-xl font-semibold">관심사 별 채팅방 둘러보기</h2>
          <%--<p class="font-medium text-gray-500 leading-6"> Find a group by browsing top categories. </p>--%>
        </div>
        <a href="#" class="text-blue-500 sm:block hidden"> 전체 보기 </a>
      </div>

      <div class="relative -mt-3" uk-slider="finite: true">

        <div class="uk-slider-container px-1 py-3">
          <ul class="uk-slider-items uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">

            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/new.png" class="absolute w-full h-full object-cover" alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg">신상품 정보 공유 </div>
              </div>
            </li>
            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/협업.png" class="absolute w-full h-full object-cover" alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg">판매 스킬 공유</div>
              </div>
            </li>
            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/증권.png" class="absolute w-full h-full object-cover" alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg"> 증권시황 </div>
              </div>
            </li>
            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/퇴직연금.png" class="absolute w-full h-full object-cover"
                     alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg">퇴직연금 꿀팁</div>
              </div>
            </li>
            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/부동산.png" class="absolute w-full h-full object-cover"
                     alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg">부동산 이슈</div>
              </div>
            </li>
            <li>
              <div class="rounded-md overflow-hidden relative w-full h-36">
                <div class="absolute w-full h-3/4 -bottom-12 bg-gradient-to-b from-transparent to-gray-800 z-10">
                </div>
                <img src="assets/images/환율정보.png" class="absolute w-full h-full object-cover" alt="">
                <div class="absolute bottom-0 w-full p-3 text-white z-20 font-semibold text-lg">환율정보</div>
              </div>
            </li>

          </ul>
        </div>

        <a class="absolute bg-white top-16 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white" href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
        <a class="absolute bg-white top-16 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white" href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

      </div>

      <br>

<%--      <div class="lg:flex lg:space-x-12">

        <div class="lg:w-3/4">


          &lt;%&ndash;<h3 class="text-xl font-semibold"> Your Groups </h3>
          <nav class="responsive-nav border-b">
            <ul>
              <li class="active"><a href="#" class="lg:px-2"> All Groups <span> 3,4510 </span> </a></li>
              <li><a href="#" class="lg:px-2"> Recently added </a></li>
              <li><a href="#" class="lg:px-2"> Family </a></li>
              <li><a href="#" class="lg:px-2"> University </a></li>
              <li><a href="#" class="lg:px-2"> more </a></li>
            </ul>
          </nav>
&ndash;%&gt;

          <div class="grid md:grid-cols-2 divide divide-gray-200 gap-x-4 mt-4">

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Graphic Design </a>
                <div class="text-sm text-gray-500 mt-0.5"> 215K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-4.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Mountain Riders  </a>
                <div class="text-sm text-gray-500 mt-0.5"> 845K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>
            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Coffee Addicts</a>
                <div class="text-sm text-gray-500 mt-0.5"> 845K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Graphic Design</a>
                <div class="text-sm text-gray-500 mt-0.5"> 315K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-5.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize">Property Rent</a>
                <div class="text-sm text-gray-500 mt-0.5"> 285K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-1.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize">Architecture</a>
                <div class="text-sm text-gray-500 mt-0.5"> 845K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-4.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Mountain Riders  </a>
                <div class="text-sm text-gray-500 mt-0.5"> 845K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Coffee Addicts</a>
                <div class="text-sm text-gray-500 mt-0.5"> 180K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize">Delicious Foods</a>
                <div class="text-sm text-gray-500 mt-0.5"> 235K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>
            <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
              <div class="w-14 h-14 flex-shrink-0 rounded-md relative">
                <img src="assets/images/events/img-2.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
              </div>
              <div class="flex-1">
                <a href="timeline-group.html"  class="text-lg font-semibold capitalize">Wedding Ideas</a>
                <div class="text-sm text-gray-500 mt-0.5"> 845K Member</div>
              </div>
              <a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold">
                Join
              </a>
            </div>

          </div>
        </div>
        <div class="lg:w-1/4 flex-shrink-0 space-y-5">

          <h2 class="text-xl font-semibold mt-7"> Suggested For You </h2>

          <div class="card">
            <div class="card-media h-28">
              <div class="card-media-overly"></div>
              <img src="assets/images/events/img-2.jpg" alt="" class="">
            </div>
            <div class="card-body">
              <a href="timeline-group.html"  class="font-semibold text-lg truncate mb-1">   Graphic Design </a>
              <div class="flex items-center space-x-1 text-sm text-gray-500 capitalize">
                <a href="#"> <span> 232k members </span> </a>
                <a href="#"> <span> 1.7k post a day </span> </a>
              </div>

              <div class="flex mt-3 space-x-2 text-sm">
                <a href="#" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                  Join
                </a>
              </div>

            </div>
          </div>
          <div class="card">
            <div class="card-media h-28">
              <div class="card-media-overly"></div>
              <img src="assets/images/events/img-2.jpg" alt="" class="">
            </div>
            <div class="card-body">
              <a href="timeline-group.html"  class="font-semibold text-lg truncate mb-1">   Graphic Design </a>
              <div class="flex items-center space-x-1 text-sm text-gray-500 capitalize">
                <a href="#"> <span> 232k members </span> </a>
                <a href="#"> <span> 1.7k post a day </span> </a>
              </div>

              <div class="flex mt-3 space-x-2 text-sm">
                <a href="#" class="bg-blue-600 flex flex-1 h-8 items-center justify-center rounded-md text-white capitalize">
                  Join
                </a>
              </div>

            </div>
          </div>

        </div>

      </div>--%>
<%--

      <div class="my-6 flex items-center justify-between border-b pb-3">
        <div>
          <h2 class="text-xl font-semibold"> Suggestions  </h2>
          <p class="font-medium text-gray-500 leading-6"> Find a groups You Might Be Interested In. </p>
        </div>
        <a href="#" class="text-blue-500 sm:block hidden"> See all </a>
      </div>

      <div class="grid md:grid-cols-2 divide divide-gray-200 gap-x-6 gap-y-4">

        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-4.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Mountain Riders</a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>
        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-5.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize">  Property Rent And Sale </a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>
        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Graphic Design </a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>
        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Coffee Addicts </a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>
        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-1.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize">  Property Rent And Sale </a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>

        <div class="flex items-center space-x-4">
          <div class="w-20 h-20 flex-shrink-0 rounded-md relative mb-3">
            <img src="assets/images/group/group-cover-3.jpg" class="absolute w-full h-full inset-0 rounded-md object-cover shadow-sm" alt="">
          </div>
          <div class="flex-1 border-b pb-3">
            <a href="timeline-group.html"  class="text-lg font-semibold capitalize"> Architecture </a>
            <div class="flex space-x-2 items-center text-sm">
              <div> 16K Members</div>
              <div>·</div>
              <div> 12 posts a week</div>
            </div>
            <div class="flex items-center mt-2">
              <img src="assets/images/avatars/avatar-2.jpg" class="w-6 rounded-full border-2 border-gray-200 -mr-2" alt="">
              <img src="assets/images/avatars/avatar-4.jpg" class="w-6 rounded-full border-2 border-gray-200" alt="">
              <div class="text-sm text-gray-500 ml-2"> 2 friends are members</div>
            </div>

          </div>
          <a href="#" class="flex items-center justify-center h-9 px-3 rounded-md bg-blue-100 text-blue-500">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 mr-2">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path>
            </svg>Follow
          </a>
        </div>
      </div>
--%>


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
<script src="assets/js/roomlist/bootstrap-show-password.min.js"></script>

