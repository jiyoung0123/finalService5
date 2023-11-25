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
                url : '/stock/v1/price',
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
        searchCodes : (keywords)=> {
            $.ajax({
                url: '/stock/v1/codes',
                data: {'keywords': keywords}
            }).done((data) => {
                console.log(data.toString());
            }).fail(() => {

            })
        }

    }

    const crwalStock = {
        init : ()=>{
            $.ajax({
                url : '/stock/v1/crawl'

            }).done((data)=>{
                console.log(JSON.stringify(data));
                console.log(data[0]["nasdaq"]);

                $('#stock0').text(data[0]["nasdaq"]);
                $('#stock1').text(data[0]["russell2000"]);
                $('#stock2').text(data[0]["dow30Price"]);
                $('#stock3').text(data[0]["snp500"]);


            }).fail(()=>{
                console.log('failed');
            })

        }



    }

    let retrieveStockPrice = {
        init : ()=>{
            $('#stockSearch_btn').click(()=>{
                console.log('button Clicked');
                console.log($('#companyNameSearch').val());
                $.get({
                    url : '/stock/v1/price',
                    data : {
                        'stockCodes' : $('#companyNameSearch').val()
                    }
                }).done((data)=>{
                    resData = JSON.parse(data.result);
                    // JSON 형태로 이미 데이터가 넘어왔으면, JSON.parse를 써야한다.
                    console.log(resData);
                    //JSON 형태로 이미 데이터가 넘어왔는데,stringify를 쓰면 \n 이 붙는다.
                    //console.log(JSON.stringify(data));
                    chart(resData["Time Series (Daily)"]);
                    console.log(resData["Time Series (Daily)"]);

                }).fail((e)=>{
                    console.log('failed');
                    console.log(e.toString());
                })
            })
        }
    }




    let stockexchange = {
        init : ()=>{
            // $('#stockSearch_btn').click(()=>{
            //     $.ajax({
            //         url:'/stock/codes',
            //         type: 'GET',
            //         data: {
            //             symbol : $('#companyNameSearch').val()
            //         }
            //     }).done(
            //         (data)=>{
            //             stockexchange.display(data);
            //         }
            //     )
            //         .fail(
            //             ()=>{
            //                 console.log("failure");
            //             }
            //         );
            //
            //     stockexchange.display();
            // })

        },
        display : (data)=>{
            const obj = JSON.parse(data);
            console.log(obj);
            $('#companyname').val(obj["Meta Data"]["2. Symbol"].toUpperCase());
            $('#stockprice').val(obj["Time Series (Daily)"]["2023-05-15"]["1. open"]);
            //chart
            const set = obj["Time Series (Daily)"];
            let ranges = [];
            let averages = [];
            for (let date in set) {
                let item = set[date];
                let low = parseInt(item["3. low"]);
                let high = parseInt(item["2. high"]);
                let open = parseInt(item["1. open"]);
                ranges.push([low, high]);
                averages.push([open]);
            }
            console.log("=====1======");
            console.log(ranges);
            console.log("=====2======");
            console.log(averages);
            Highcharts.chart('container', {

                title: {
                    text: 'STOCK TREND : ' + obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    align: 'left'
                },

                subtitle: {
                    text: '통화기준 : $USD'+' __ powered by Alpha Vantage in NYSE',
                    align: 'left'
                },

                xAxis: {
                    type: 'datetime',
                    accessibility: {
                        rangeDescription: 'Range: Jul 1st 2022 to Jul 31st 2022.'
                    }
                },

                yAxis: {
                    title: {
                        text: 'Stock Price - USD'
                    }
                },

                tooltip: {
                    crosshairs: true,
                    shared: true,
                    valueSuffix: '$'
                },

                plotOptions: {
                    series: {
                        pointStart: Date.UTC(2022, 12, 19),
                        pointIntervalUnit: 'day'
                    }
                },

                series: [{
                    name: obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    data: averages,//변수 data
                    zIndex: 1,
                    marker: {
                        fillColor: 'white',
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '최고가 - 최저가',
                    data: ranges,//변수 data
                    type: 'arearange',
                    lineWidth: 0,
                    linkedTo: ':previous',
                    color: Highcharts.getOptions().colors[0],
                    fillOpacity: 0.3,
                    zIndex: 0,
                    marker: {
                        enabled: false
                    }
                }]
            });

        }//display
    }//

    const chart = ((resData)=>{
        console.log("highchart");
        console.log(resData);
        Highcharts.chart('chartContainer', {
            chart: {
                scrollablePlotArea: {
                    minWidth: 700
                }
            },

            data: resData,

            title: {
                text: 'Daily sessions at www.highcharts.com',
                align: 'left'
            },

            subtitle: {
                text: 'Source: Google Analytics',
                align: 'left'
            },

            xAxis: {
                tickInterval: 7 * 24 * 3600 * 1000, // one week
                tickWidth: 0,
                gridLineWidth: 1,
                labels: {
                    align: 'left',
                    x: 3,
                    y: -3
                }
            },

            yAxis: [{ // left y axis
                title: {
                    text: null
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                showFirstLabel: false
            }, { // right y axis
                linkedTo: 0,
                gridLineWidth: 0,
                opposite: true,
                title: {
                    text: null
                },
                labels: {
                    align: 'right',
                    x: -3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                showFirstLabel: false
            }],

            legend: {
                align: 'left',
                verticalAlign: 'top',
                borderWidth: 0
            },

            tooltip: {
                shared: true,
                crosshairs: true
            },

            plotOptions: {
                series: {
                    cursor: 'pointer',
                    className: 'popup-on-click',
                    marker: {
                        lineWidth: 1
                    }
                }
            },

            series: [{
                name: 'All sessions',
                lineWidth: 4,
                marker: {
                    radius: 4
                }
            }, {
                name: 'New users'
            }]
        });
    })







    $(()=>{
        //stockApi.init();
         websocketConnect(4); //websocket 4개 활성화
        //stockApi.searchPrice('tsla');
        //debugger; //디버깅
        //crwalStock.init();
        retrieveStockPrice.init();
        //chart
        //chart();
    });








</script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
<style>
    .highcharts-figure,
    .highcharts-data-table table {
        min-width: 360px;
        max-width: 800px;
        margin: 1em auto;
    }

    .highcharts-data-table table {
        font-family: Verdana, sans-serif;
        border-collapse: collapse;
        border: 1px solid #ebebeb;
        margin: 10px auto;
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
    }

    .highcharts-data-table th {
        font-weight: 600;
        padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
        padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
        background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
        background: #f1f7ff;
    }
</style>



    <div class="main_content">




        <div class="mcontainer">
            <!--  Feeds  -->
            <div class="lg-flex justify-content-center" style="align-content: flex-start">

                <!-- ======= About Section ======= -->
                <section id="about" class="about">
                    <div class="relative -mt-3" uk-slider="finite: true">
                        <div class="uk-slider-container px-1 py-3">
                            <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-2@s uk-grid-small uk-grid">

                                <li>
                                    <div class="card p-2 flex space-x-4 border border-gray-100">
                                        <div class="w-20 h-24 overflow-hidden rounded-lg">
                                            <div class="card-media h-24">
                                                <img src="/assets/images/logo/bitcoin.png" alt="비트코인"/>
                                            </div>
                                        </div>
                                        <div class="flex-1 pt-2.5 relative">

                                            <div class="text-xs font-semibold uppercase text-yellow-500"> 업비트 </div>
                                            <div class="text-lg mt-3 2.5 text-gray-700">비트코인</div>
                                            <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                <div> 15명의 추천 </div>
                                                <div>·</div>
                                                <div> 286명이 지켜보는 중 </div>
                                            </div>
                                            <div id="socket_msg1" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                $12.99
                                            </div>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="card p-2 flex space-x-4 border border-gray-100">
                                        <div class="w-20 h-24 overflow-hidden rounded-lg">
                                            <div class="card-media h-24">
                                                <img src="/assets/images/product/ethurium.png" alt="이더리움">
                                            </div>
                                        </div>
                                        <div class="flex-1 pt-2.5 relative">

                                            <div class="text-xs font-semibold uppercase text-yellow-500"> 업비트 </div>
                                            <div class="text-lg mt-3 2.5 text-gray-700"> 이더리움 </div>
                                            <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                <div> 75명의 추천 </div>
                                                <div>·</div>
                                                <div> 148명이 지켜보는 중 </div>
                                            </div>

                                            <div id="socket_msg2" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                $12.99
                                            </div>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="card p-2 flex space-x-4 border border-gray-100">
                                        <div class="w-20 h-24 overflow-hidden rounded-lg">
                                            <div class="card-media h-24">
                                                <img src="/assets/images/product/dodge.png" alt="dodgeCoin">
                                            </div>
                                        </div>
                                        <div class="flex-1 pt-2.5 relative">

                                            <div class="text-xs font-semibold uppercase text-yellow-500"> 업비트 </div>
                                            <div class="text-lg mt-3 2.5 text-gray-700"> 도지코인 </div>
                                            <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                <div> 32명의 추천 </div>
                                                <div>·</div>
                                                <div> 126명이 지켜보는 중 </div>
                                            </div>
                                            <div id="socket_msg3" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                $12.99
                                            </div>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="card p-2 flex space-x-4 border border-gray-100">
                                        <div class="w-20 h-24 overflow-hidden rounded-lg">
                                            <div class="card-media h-24">
                                                <img src="/assets/images/product/adacoin.png" alt="adaCoin">
                                            </div>
                                        </div>
                                        <div class="flex-1 pt-2.5 relative">

                                            <div class="text-xs font-semibold uppercase text-yellow-500"> 업비트 </div>
                                            <div class="text-lg mt-3 2.5 text-gray-700"> 에이다 </div>
                                            <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                <div> 4명의 추천 </div>
                                                <div>·</div>
                                                <div> 286명이 지켜보는 중 </div>
                                            </div>
                                            <div id="socket_msg4" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                $12.99
                                            </div>

                                        </div>
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <a class="absolute bg-white top-11 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                           href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                        <a class="absolute bg-white top-11 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                           href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

                    </div>






<%--                    <div class="container" data-aos="fade-up">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-xl-3 col-md-6 mb-4">--%>
<%--                                <div class="card border-left-success shadow h-100 py-2">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="row no-gutters align-items-center">--%>
<%--                                            <div class="col mr-2">--%>
<%--                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인--%>
<%--                                                </div>--%>
<%--                                                <div class="row no-gutters align-items-center">--%>
<%--                                                    <div class="col-auto">--%>
<%--                                                        <div id="socket_msg0" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-auto">--%>
<%--                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-xl-3 col-md-6 mb-4">--%>
<%--                                <div class="card border-left-primary shadow h-100 py-2">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="row no-gutters align-items-center">--%>
<%--                                            <div class="col mr-2">--%>
<%--                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이더리움--%>
<%--                                                </div>--%>
<%--                                                <div class="row no-gutters align-items-center">--%>
<%--                                                    <div class="col-auto">--%>
<%--                                                        <div id="socket_msg1" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-auto">--%>
<%--                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-xl-3 col-md-6 mb-4">--%>
<%--                                <div class="card border-left-dark shadow h-100 py-2">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="row no-gutters align-items-center">--%>
<%--                                            <div class="col mr-2">--%>
<%--                                                <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">도지코인--%>
<%--                                                </div>--%>
<%--                                                <div class="row no-gutters align-items-center">--%>
<%--                                                    <div class="col-auto">--%>
<%--                                                        <div id="socket_msg2" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-auto">--%>
<%--                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-xl-3 col-md-6 mb-4">--%>
<%--                                <div class="card border-left-danger shadow h-100 py-2">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="row no-gutters align-items-center">--%>
<%--                                            <div class="col mr-2">--%>
<%--                                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">에이다--%>
<%--                                                </div>--%>
<%--                                                <div class="row no-gutters align-items-center">--%>
<%--                                                    <div class="col-auto">--%>
<%--                                                        <div id="socket_msg3" class="h5 mb-0 mr-3 font-weight-bold text-white-800">50%</div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-auto">--%>
<%--                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </section>
            </div>

            <div class=" justify-content-center" style="align-content: flex-start">


                <div class="moving-container">
                    <section id="about" class="about">
                        <div class="relative -mt-3" uk-slider="finite: true">
                            <div class="uk-slider-container px-1 py-3">
                                <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-2@s uk-grid-small uk-grid">

                                    <li>
                                        <div class="card p-2 flex space-x-4 border border-gray-100">
                                            <div class="w-20 h-24 overflow-hidden rounded-lg">
                                                <div class="card-media h-24">
                                                    <img src="/assets/images/logo/nasdaq.jpeg" alt="나스닥"/>
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-2.5 relative">

                                                <div class="text-xs font-semibold uppercase text-yellow-500"> Yahoo Finance </div>
                                                <div class="text-lg mt-3 2.5 text-gray-700"> NASDAQ </div>
                                                <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                    <div> 15명의 추천 </div>
                                                    <div>·</div>
                                                    <div> 286명이 지켜보는 중 </div>
                                                </div>
                                                <div id="stock0" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                    $12.99
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="card p-2 flex space-x-4 border border-gray-100">
                                            <div class="w-20 h-24 overflow-hidden rounded-lg">
                                                <div class="card-media h-24">
                                                    <img src="/assets/images/logo/russell.png" alt="이더리움">
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-2.5 relative">

                                                <div class="text-xs font-semibold uppercase text-yellow-500"> Yahoo Finance </div>
                                                <div class="text-lg mt-3 2.5 text-gray-700"> RUSSELL2000 </div>
                                                <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                    <div> 75명의 추천 </div>
                                                    <div>·</div>
                                                    <div> 148명이 지켜보는 중 </div>
                                                </div>

                                                <div id="stock1" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                    $12.99
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="card p-2 flex space-x-4 border border-gray-100">
                                            <div class="w-20 h-24 overflow-hidden rounded-lg">
                                                <div class="card-media h-24">
                                                    <img src="/assets/images/logo/dow.png" alt="dow">
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-2.5 relative">

                                                <div class="text-xs font-semibold uppercase text-yellow-500"> Yahoo Finance </div>
                                                <div class="text-lg mt-3 2.5 text-gray-700"> DOW30 </div>
                                                <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                    <div> 32명의 추천 </div>
                                                    <div>·</div>
                                                    <div> 126명이 지켜보는 중 </div>
                                                </div>
                                                <div id="stock2" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                    $12.99
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="card p-2 flex space-x-4 border border-gray-100">
                                            <div class="w-20 h-24 overflow-hidden rounded-lg">
                                                <div class="card-media h-24">
                                                    <img src="/assets/images/logo/snp500.png" alt="snp500">
                                                </div>
                                            </div>
                                            <div class="flex-1 pt-2.5 relative">

                                                <div class="text-xs font-semibold uppercase text-yellow-500"> Yahoo Finance </div>
                                                <div class="text-lg mt-3 2.5 text-gray-700"> S&P 500 </div>
                                                <div class="flex items-center space-x-2 text-sm text-gray-400 capitalize">
                                                    <div> 4명의 추천 </div>
                                                    <div>·</div>
                                                    <div> 286명이 지켜보는 중 </div>
                                                </div>
                                                <div id="stock3" class="top-1.5 absolute bg-gray-100 font-semibold px-2.5 py-1 right-1 rounded-full text text-blude-500 text-sm">
                                                    $12.99
                                                </div>

                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>

                            <a class="absolute bg-white top-11 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                               href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                            <a class="absolute bg-white top-11 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                               href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

                        </div>

                    </section>


            <br>
            <br>
                    <div class="contact-list my-2 ml-1">
                        <div class="contact-avatar">
                            <img src="/assets/images/starfriends/proflie1.jpg" alt="">
                        </div>
                        <div class="contact-username"> KB 금융그룹 E-HRD Cloud 추천 동영상 </div>
                    </div>

            <div class=" justify-content-center" style="align-content: flex-start">


                <div class="moving-container">

                    <div>
                        <div class="row">
                            <div class="col-lg-6">
                                <iframe width="500" height="280" src="https://www.youtube.com/embed/qSTxan6rjxc?si=2SoNlpWezh10wCP-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                            <div class="col-lg-6">
                                <iframe width="500" height="280"  src="https://www.youtube.com/embed/ZeGURwPIb44?si=ya-aWFD4rP-tAV3q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>






            </div>
    </div>



















