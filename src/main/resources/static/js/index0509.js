// center : 대시보드 중간, 좌측 차트(월별 매출액)
let dash_chart01={
    init:function () {
        $.ajax({
            url : '/dashchat01',
            success : function (data){
               // 데이터 가져오는 것 성공하면 화면에 차트로 뿌려줘.
               dash_chart01.display1(data);
            }
        });

    },
    display1:function (data){
        Highcharts.chart('container1', {
            chart: {
                type: 'line'
            },
            title: {
                text: 'Monthly Average Temperature'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                    'target="_blank">Wikipedia.com</a>'
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct']
            },
            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },
            series: data  //  // 1. series 라는 배열 안에( [{다지우기}] ) 2. 담긴 객체는 이런모양 {name : '', data :  []},  {name : '', data :  []}
        });

    }
};

//  center : 대시보드 중간, 우측 차트(월별 매출액-성별기준)
let dash_chart02 ={
    init:function () {
        $.ajax({
            url : '/dashchat01', // 화면에 뿌릴 data 모양이 차트1 과 똑같아.
            success : function (data){
                // 데이터 가져오는 것 성공하면 화면에 차트로 뿌려줘.
                dash_chart02.display2(data);
            }
        });
        },

        display2:function (data){
            Highcharts.chart('container2', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Monthly Average Rainfall'
                },
                subtitle: {
                    text: 'Source: WorldClimate.com'
                },
                xAxis: {
                    categories: [
                        'Jan',
                        'Feb',
                        'Mar',
                        'Apr',
                        'May',
                        'Jun',
                        'Jul',
                        'Aug',
                        'Sep',
                        'Oct',
                        'Nov',
                        'Dec'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Rainfall (mm)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: data // 1. series 라는 배열 안에 2. 객체{} 가 담긴 형태. [ {name : '', data :  []}, {name : '', data :  []} ]
            });
        }
}
