<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- 고객 대시보드 페이지 재커밋 -->
<style>
    @import url("https://code.highcharts.com/css/highcharts.css");
    @import url("https://code.highcharts.com/dashboards/css/dashboards.css");
    @import url("https://code.highcharts.com/datagrid/css/datagrid.css");
    #container{
        width: 100%;
        height: 100%;
    }
    #main-img{
        width: 60px;
        height: 60px;
    }
    #main-right-text{
        text-align: left;
        padding-left: 20px;
        padding-top: 10px;
    }
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
<%--  제이쿼리  --%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>



<script>
    $(function() {
        // 다른 차트 그리기
        Dashboards.board('container', {
            dataPool: {
                connectors: [{
                    id: 'transactions',
                    type: 'JSON',
                    options: {
                        firstRowAsNames: false,
                        columnNames: ['일자', '내용', '금액', '수익률'],
                        data: [
                            ['2023/09/23', '임의식 투자상품 전환', 10000000, 1000],
                            ['2023/06/21', 'ETF 추가상품 매입', 200, 800],
                            ['2023/02/05', '채권형 펀드 해약', 300, 500],
                            ['2022/01/23', 'IRP(적립겸용) 가입', 400, 100]
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
                    title: '투자원금(평가금액)',
                    value: new Intl.NumberFormat('en-US').format(14300000),
                    valueFormat: '{value}',
                    subtitle: '23%',
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
                    title: '실시간 투자수익(수익률)',
                    value: new Intl.NumberFormat('en-US').format(1258700),
                    valueFormat: '{value}',
                    subtitle: '8.3%',
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
                                // {
                                //     tagName: 'img',
                                //     //textContent: 'Check how you can save more!',
                                //     attributes: {
                                //         src: '/assets/images/starfriends/proflie1.jpg',
                                //         id: 'main-img'
                                //     }
                                // },
                                {
                                    tagName: 'h5',
                                    textContent: '고객명 : 나비비',
                                    attributes: {
                                        id: 'main-right-text'
                                    }
                                },
                                {
                                    tagName: 'h5',
                                    textContent: '연령 : 56세',
                                    attributes: {
                                        id: 'main-right-text'
                                    }
                                },
                                {
                                    tagName: 'h5',
                                    textContent: '투자유형 : 통찰력있는 투자 예술인(AMWL)',
                                    attributes: {
                                        id: 'main-right-text'
                                    }
                                },
                                // {
                                //     tagName: 'h5',
                                //     textContent: '통찰력있는 투자 예술인',
                                //     attributes: {
                                //         id: 'main-text'
                                //     }
                                // },
                            ]
                        }
                    ]
                },
                {
                    type: 'Highcharts',
                    cell: 'dashboard-row-2-cell-1',
                    title: '월별 수익률 현황',
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
                            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                                '7월', '8월', '9월', '10월', '11월', '12월']
                        },
                        yAxis: [
                            {
                                title: '',
                                labels: {
                                    format: '{value} %'
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
                    title: '최근 소비내역',
                    value: 358000,
                    valueFormat: '{value}',
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
                    title: '자산대비 투자비중',
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
                    title: '상품관리이력',
                    type: 'DataGrid',
                    dataGridOptions: {
                        cellHeight: 37,
                        editable: false
                    }
                }
            ]
        }, true);
    });

</script>
</head>
<body>
<div class="main_content">
    <div class="flex-shirink-0" >
        <div class="flex justify-between relative md:mb-4 mb-3">
            <div class="flex-1">
                <h2 class="text-2xl font-semibold" style="padding-left: 20px; padding-top: 10px;"> My고객 투자자산 포트폴리오</h2>
                <div id="container"></div>
            </div>
        </div>
    </div>
</div>
</body>
