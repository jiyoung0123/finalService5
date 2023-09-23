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
    //@적용 : overlook.jsp
    //@desc : document load 시 사전에 정의된 uri로 업비트 웹소켓 적용

    //https://api.upbit.com/v1/market/all -> 티커 조회

    function websocketConnect(i) {
        const socketURI = "wss://api.upbit.com/websocket/v1"; // WebSocket 엔드포인트 URI
        const coinArray = [ 'KRW-BTC', "KRW-ETH", "KRW-DOGE", "KRW-ADA" ]; //webSocket 송신시 들어갈 파라미터값 상수정의

        const socketMap = new Map();
        for(j=0; j <i ; j++){
            socketMap.set(`socket`+j , coinArray[j]);
        };
        // 확인완료(090923-최준혁)
        // console.log('socketMap을 담을 그릇을 확인 ==================');
        console.log(socketMap);

        socketMap.forEach((v, k)=>{
            // 확인완료(090924-최준혁)
            // console.log('value 값' + v);
            // console.log('key 값' + k);
            // console.log(typeof(k)); //string
            let socketHtml = `socket_msg` + k.substring(6,7);
            // console.log(socketHtml);

            // WebSocket 생성
            k = new WebSocket(socketURI);
            // WebSocket 이벤트 핸들러 정의
            k.onopen = (event)=>{
                console.log("WebSocket opened");
                // 서버로 메시지 전송 예시
                // https://docs.upbit.com/reference/test-and-request-sample
                let message = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes": [v]}]);
                //console.log(k + `k의 메세지 검증`);
                //console.log(message);
                k.send(message);
            };
            //Html에 렌더링할 소켓 메세지
            k.onmessage = (event)=>{
                let reader = new FileReader();
                reader.onload = function() {
                    //console.log("Received message: ", reader.result);
                    // let key = "trade_price";
                    let jsonString = reader.result; // 문자열 값
                    let json = JSON.parse(jsonString); // JSON 형식으로 변환된 객체
                    let trade_price = Number(json["trade_price"]); // 숫자로 변환
                    let formatted_trade_price = trade_price.toLocaleString("ko-KR", { style: "currency", currency: "KRW" });
                    $(`#`+ socketHtml).text(formatted_trade_price);
                };
                reader.readAsText(event.data);
                // $('#bitcoin').text(json["trade_price"]);
            };
            // 소켓 Close 이벤트 핸들러
            k.onclose = (event)=>{
                console.log("WebSocket closed");
            };
            // 소켓 이벤트 에러 핸들러
            k.onerror = (event)=>{
                console.error("WebSocket error:", error);
            }
        });

    };



    function websocketDisconnect() {
        if (socket) {
            socket.close();
            console.log("WebSocket disconnected");
        }
    }


    const stockApi = {

        //(1) websocket
        init : ()=>{
            let stockWebApprovalURI = 'https://openapi.koreainvestment.com:9443/oauth2/Approval';

           /* $.ajax({
                url : stockWebApprovalURI,
                data : {
                    "grant_type": "client_credentials",
                    "appkey": key,
                    "secretkey": secret
                },
                method : POST,
                headers : {"content-type": "application/json"}
            }).done((res)=>{
                console.log('200');
                res.toString();
                JSON.parse(res);
            }).fail((res)=>{
                console.log('400');
                res.toString();
            })*/

        },
        //(2) code를 통한 price 검색
        searchPrice : (codes)=>{
            $.ajax({
                url : '/stock/price',
                data : {
                    'function' : 'TIME_SERIES_DAILY',
                'stockCodes' : codes
                }
            }).done((data)=>{
                let parsedData = data.replace(/\n/gi, '\\n');
                console.log(parsedData);
            }).fail(()=>{

            })
        },
        //(3) codes 검색
        searchCodes : (keywords)=>{
            $.ajax({
                url : '/stock/codes',
                data : {'keywords' : keywords}
            }).done((data)=>{
                console.log(data.toString());
            }).fail(()=>{

            })
        }

    }


    $(()=>{
        stockApi.init();
        websocketConnect(4); //websocket 4개 활성화
        stockApi.searchPrice('tsla');
        //debugger; //디버깅
    });

</script>




    <div class="main_content">
        <div class="mcontainer">

            <!--  Feeds  -->
            <div class="lg-flex justify-content-center" style="align-content: flex-start">

                <!-- ======= About Section ======= -->
                <section id="about" class="about">
                    <div class="container" data-aos="fade-up">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div id="socket_msg0" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이더리움
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div id="socket_msg1" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-dark shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">도지코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div id="socket_msg2" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-danger shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">에이다
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div id="socket_msg3" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class=" justify-content-center" style="align-content: flex-start">

                <div class="moving-container">
                    <H6>현재 주가</H6>

                    <div class="moving-content">
                        <div class="row">
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2  mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div  class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

















