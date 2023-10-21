<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 고객 대시보드 페이지 -->
<style>
    @import url("https://code.highcharts.com/css/highcharts.css");
    @import url("https://code.highcharts.com/dashboards/css/dashboards.css");
    @import url("https://code.highcharts.com/datagrid/css/datagrid.css");

    /* Colors */
    :root {
        --highcharts-dashboards-green: #20d17e;
        --highcharts-dashboards-orange: #feaa61;
    }

    /* General */
    .highcharts-dashboards,
    .highcharts-dashboards-wrapper {
        background-color: var(--highcharts-neutral-color-3);
    }

    .highcharts-background {
        fill: var(--highcharts-neutral-color-0);
    }

    .highcharts-color-0 {
        stroke: var(--highcharts-dashboards-green);
        fill: var(--highcharts-dashboards-green);
    }

    .highcharts-color-1 {
        stroke: var(--highcharts-dashboards-orange);
        fill: var(--highcharts-dashboards-orange);
    }

    /* Rows and cells */
    .highcharts-dashboards-row#row-1 {
        background-color: var(--highcharts-neutral-color-5);
        border-radius: 20px;
        padding: 10px;
    }

    .highcharts-dashboards-cell > .highcharts-dashboards-component {
        background-color: var(--highcharts-neutral-color-0);
        border-radius: 20px;
        text-align: left;
    }

    /* Components general */
    .highcharts-dashboards-component-title {
        padding-left: 10px;
        font-size: 0.8rem;
        font-weight: 100;
    }

    .highcharts-dashboards-component-subtitle {
        font-size: 0.8rem;
        font-weight: 100;
        padding-left: 20px;
        color: var(--highcharts-dashboards-green);
    }

    .highcharts-dashboards-component-kpi-value {
        padding-left: 20px;
        font-weight: bold;
    }

    /* Components specific */
    #dashboard-row-1-cell-2 .highcharts-dashboards-component-subtitle {
        color: var(--highcharts-dashboards-orange);
    }

    #dashboard-row-1-cell-2 .highcharts-color-0 {
        stroke: var(--highcharts-dashboards-orange);
        fill: var(--highcharts-dashboards-orange);
    }

    #dashboard-row-1-cell-3 .highcharts-dashboards-component-content {
        text-align: center;
    }

    #dashboard-row-2-cell-1 .highcharts-color-0 .highcharts-area {
        fill-opacity: 1;
        fill: url(#gradient-0);
    }

    #dashboard-row-3-cell-1 .highcharts-color-0 {
        stroke: var(--highcharts-dashboards-orange);
        fill: var(--highcharts-dashboards-orange);
    }

    #dashboard-row-3-cell-3 .highcharts-dashboards-component-content {
        padding: 10px 0 !important;
        height: 165px !important;
    }

    #dashboard-row-3-cell-3 .highcharts-datagrid-container3 {
        border: none;
        font-weight: 100;
    }

    #dashboard-row-3-cell-3 .highcharts-datagrid-column-header {
        background-color: var(--highcharts-neutral-color-0);
    }

    #dashboard-row-3-cell-3 .highcharts-datagrid-row {
        background-color: var(--highcharts-neutral-color-0);
    }

    /* Custom classes and ids */
    #saving-button {
        border: none;
        border-radius: 10px;
        padding: 10px 20px;
        background-color: var(--highcharts-dashboards-orange);
        cursor: pointer;
    }

    /* Gradient  */
    #gradient-0 stop {
        stop-color: var(--highcharts-dashboards-green);
    }

    #gradient-0 stop[offset="0"] {
        stop-opacity: 0.75;
    }

    #gradient-0 stop[offset="1"] {
        stop-opacity: 0;
    }

</style>
<script src="https://code.highcharts.com/dashboards/dashboards.js"></script>
<script src="https://code.highcharts.com/dashboards/datagrid.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/dashboards/modules/dashboards-plugin.js"></script>
<!-- 대시보드 : Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<%-- 한데 모은 자바스크립트 파일 가져오기   --%>
<script src="/js/index0509.js"></script>
<!-- 차트 -->
<script src="https://code.highcharts.com/dashboards/dashboards.js"></script>
<script src="https://code.highcharts.com/dashboards/datagrid.js"></script>
<%-- chart01 : 차트 생성 --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<%--  chart 02...  --%>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<%-- 라이브 차트 만들기  --%>
<script src="https://code.highcharts.com/modules/data.js"></script>
<%-- jquery --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%-- 웹소켓 사용하기 위한 라이브러리 --%>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<%-- 대시보드 : 중간 우측 차트 --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script>
    let websocket_center = {
        stompClient:null,
        init:function(){
            this.connect();
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('${adminserver}/wss');
            this.stompClient = Stomp.over(socket);
            this.stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                this.subscribe('/sendadm', function(msg) {
                    $('#content1_msg').text(JSON.parse(msg.body).content1);
                    $('#content2_msg').text(JSON.parse(msg.body).content2);
                    $('#content3_msg').text(JSON.parse(msg.body).content3);
                    $('#content4_msg').text(JSON.parse(msg.body).content4);
                    $('#progress1').css('width',JSON.parse(msg.body).content1/100*100+'%');
                    $('#progress1').attr('aria-valuenow',JSON.parse(msg.body).content1/100*100);
                    $('#progress2').css('width',JSON.parse(msg.body).content2/1000*100+'%');
                    $('#progress2').attr('aria-valuenow',JSON.parse(msg.body).content2/1000*100);
                    $('#progress3').css('width',JSON.parse(msg.body).content3/500*100+'%');
                    $('#progress3').attr('aria-valuenow',JSON.parse(msg.body).content3/500*100);
                    $('#progress4').css('width',JSON.parse(msg.body).content4/10*100+'%');
                    $('#progress4').attr('aria-valuenow',JSON.parse(msg.body).content4/10*100);
                });
            });
        }
    };

    // 다른 차트 그리기
    Dashboards.board('container3', {
        dataPool: {
            connectors: [{
                id: 'transactions',
                type: 'JSON',
                options: {
                    firstRowAsNames: false,
                    columnNames: ['id', 'Receiver', 'Amount', 'Balance'],
                    data: [
                        ['rsf934fds', 'John Doe', 100, 1000],
                        ['f0efnakr', 'Anna Smith', 200, 800],
                        ['mfaiks12', 'Robert Johnson', 300, 500],
                        ['15fqmfk', 'Susan Williams', 400, 100]
                    ]
                }
            }]
        },
        gui: {
            layouts: [
                {
                    rows: [
                        {
                            id: 'row-1',
                            cells: [
                                {
                                    id: 'dashboard-row-1-cell-1',
                                    height: '160px',
                                    responsive: {
                                        small: {
                                            width: '50%'
                                        },
                                        medium: {
                                            width: '50%'
                                        },
                                        large: {
                                            width: '33,3%'
                                        }
                                    }
                                },
                                {
                                    id: 'dashboard-row-1-cell-2',
                                    height: '160px',
                                    responsive: {
                                        small: {
                                            width: '50%'
                                        },
                                        medium: {
                                            width: '50%'
                                        },
                                        large: {
                                            width: '33,3%'
                                        }
                                    }
                                },
                                {
                                    id: 'dashboard-row-1-cell-3',
                                    height: '160px',
                                    responsive: {
                                        small: {
                                            width: '100%'
                                        },
                                        medium: {
                                            width: '100%'
                                        },
                                        large: {
                                            width: '33,3%'
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            cells: [
                                {
                                    id: 'dashboard-row-2-cell-1'
                                }
                            ]
                        },
                        {
                            cells: [
                                {
                                    id: 'dashboard-row-3-cell-1',
                                    height: '260px',
                                    width: '20%',
                                    responsive: {
                                        small: {
                                            width: '100%'
                                        },
                                        medium: {
                                            width: '50%'
                                        },
                                        large: {
                                            width: '20%'
                                        }
                                    }
                                },
                                {
                                    id: 'dashboard-row-3-cell-2',
                                    height: '260px',
                                    width: '20%',
                                    responsive: {
                                        small: {
                                            width: '100%'
                                        },
                                        medium: {
                                            width: '50%'
                                        },
                                        large: {
                                            width: '20%'
                                        }
                                    }
                                }, {
                                    id: 'dashboard-row-3-cell-3',
                                    height: '260px',
                                    width: '60%',
                                    responsive: {
                                        small: {
                                            width: '100%'
                                        },
                                        medium: {
                                            width: '100%'
                                        },
                                        large: {
                                            width: '60%'
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        components: [
            {
                type: 'KPI',
                cell: 'dashboard-row-1-cell-1',
                title: 'Total balance',
                value: 1430,
                valueFormat: '$ {value}',
                subtitle: '43%',
                chartOptions: {
                    chart: {
                        styledMode: true
                    },
                    series: [
                        {
                            type: 'spline',
                            enableMouseTracking: false,
                            dataLabels: {
                                enabled: false
                            },
                            data: [1870, 1210, 1500, 1900, 1430]
                        }
                    ]
                }
            },
            {
                type: 'KPI',
                cell: 'dashboard-row-1-cell-2',
                title: 'Savings',
                value: 6500,
                valueFormat: '$ {value}',
                subtitle: '22%',
                chartOptions: {
                    chart: {
                        styledMode: true
                    },
                    series: [
                        {
                            type: 'spline',
                            enableMouseTracking: false,
                            dataLabels: {
                                enabled: false
                            },
                            data: [0, 1000, 1000, 4500, 5300, 6500]
                        }
                    ]
                }
            },
            {
                type: 'HTML',
                cell: 'dashboard-row-1-cell-3',
                elements: [
                    {
                        tagName: 'div',
                        children: [
                            {
                                tagName: 'h4',
                                textContent: 'Check how you can save more!',
                                attributes: {
                                    class: 'main-title'
                                }
                            },
                            {
                                tagName: 'button',
                                textContent: 'Go to the saving account',
                                attributes: {
                                    id: 'saving-button'
                                }
                            }
                        ]
                    }
                ]
            },
            {
                type: 'Highcharts',
                cell: 'dashboard-row-2-cell-1',
                title: 'Earnings',
                chartOptions: {
                    chart: {
                        marginTop: 50
                    },
                    defs: {
                        gradient0: {
                            tagName: 'linearGradient',
                            id: 'gradient-0',
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1,
                            children: [
                                {
                                    tagName: 'stop',
                                    offset: 0
                                },
                                {
                                    tagName: 'stop',
                                    offset: 1
                                }
                            ]
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    title: {
                        text: ''
                    },
                    legend: {
                        enabled: false
                    },
                    xAxis: {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                    },
                    yAxis: [
                        {
                            title: '',
                            labels: {
                                format: '{value} k'
                            }
                        }
                    ],
                    series: [
                        {
                            type: 'areaspline',
                            dataLabels: {
                                enabled: false
                            },
                            marker: {
                                enabled: false
                            },
                            name: 'Earnings',
                            data: [10, 20, 30, 40, 12, 11, 10, 23, 4, 34, 50, 20]
                        }
                    ]
                }
            },
            {
                type: 'KPI',
                cell: 'dashboard-row-3-cell-1',
                title: 'Spendings',
                value: 350,
                valueFormat: '$ {value}',
                chartOptions: {
                    series: [
                        {
                            type: 'column',
                            enableMouseTracking: false,
                            dataLabels: {
                                enabled: false
                            },
                            name: 'Spendings',
                            data: [45, 30, 50, 80, 10, 45, 30, 59, 39, 15, 62]
                        }
                    ]
                }
            },
            {
                type: 'KPI',
                cell: 'dashboard-row-3-cell-2',
                title: 'Your wallet condition',
                value: '',
                subtitle: 'You saved 1450$ this month',
                chartOptions: {
                    title: {
                        verticalAlign: 'middle',
                        floating: true,
                        text: '58%'
                    },
                    series: [
                        {
                            type: 'pie',
                            enableMouseTracking: false,
                            data: [58, 42],
                            size: '100%',
                            innerSize: '75%',
                            dataLabels: {
                                enabled: false
                            }
                        }
                    ]
                }
            }, {
                cell: 'dashboard-row-3-cell-3',
                connector: {
                    id: 'transactions'
                },
                title: 'Transactions',
                type: 'DataGrid',
                dataGridOptions: {
                    cellHeight: 37,
                    editable: false
                }
            }
        ]
    }, true);
    $(function(){
        websocket_center.init();
        dash_chart01.init();
        dash_chart02.init();
        // 정해진 시간마다 주기적으로 차트의 data 업데이트 하기
        setInterval(dash_chart01.init, 5000);
        setInterval(dash_chart02.init, 15000);
    });
</script>
<div class="main_content w-100">
    <div class="mcontainer w-100 m-0">
<%--        <div class="flex justify-between">--%>
            <!-- 고객 대시보드 페이지 -->
            <div class="container-fluid w-100">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">고객별 투자자산 상세현황</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> 리포트 다운로드</a>
                </div>
                <!-- Content Row -->
                <div class="row">
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div id="content1_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div id="progress1" class="progress-bar bg-success" role="progressbar"
                                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
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
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div id="content2_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div id="progress2" class="progress-bar bg-primary" role="progressbar"
                                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
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
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-dark shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div id="content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div id="progress3" class="progress-bar bg-dark" role="progressbar"
                                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
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
                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-danger shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div id="content4_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div id="progress4" class="progress-bar bg-danger" role="progressbar"
                                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
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
                <!-- 첫번째 차트 : Content Row -->
                <div class="row">
                    <!-- Area Chart -->
                    <div class="col-xl-6 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div id="container1" class="chart-area">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 두번째 차트 : Pie Chart -->
                    <div class="col-xl-6 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">자산 비중</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div id="container2" class="chart-area">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Content Row -->
            </div>
            <!-- //고객 대시보드 페이지 -->
<%--        </div>--%>
    <%--    다른 차트 그리기    --%>
    <div id="container3" class="chart-area">
    </div>
    </div>
</div>



<!-- 대시보드 : Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>


<!-- Page level plugins -->
<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/datatables-demo.js"></script>