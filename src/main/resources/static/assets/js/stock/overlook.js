/*
@작성자 : 최준혁
@작성일 : 2023-09-10
@라우터 : /stock
@적용 : overlook.jsp
@desc : document load 시 사전에 정의된 uri로 업비트 웹소켓 적용
 */

$(()=>{
    stock.init();
    //websocketConnect(4); //websocket 4개 활성화
    //debugger; //디버깅
});
const socketURI = "wss://api.upbit.com/websocket/v1"; // WebSocket 엔드포인트 URI
const coinArray = [ 'KRW-BTC', "KRW-ETH", "KRW-DOGE", "KRW-ADA" ]; //webSocket 송신시 들어갈 파라미터값 상수정의
//https://api.upbit.com/v1/market/all -> 티커 조회

function websocketConnect(i) {

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
            console.log(k + `k의 메세지 검증`);
            console.log(message);
            k.send(message);
        };
        //Html에 렌더링할 소켓 메세지
        k.onmessage = (event)=>{
            let reader = new FileReader();
            reader.onload = function() {
                console.log("Received message: ", reader.result);
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

const stockWebApprovalURI = 'https://openapi.koreainvestment.com:9443/oauth2/Approval';

const stock = {
    init : ()=>{

        $.ajax({
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
        })


    }

}
