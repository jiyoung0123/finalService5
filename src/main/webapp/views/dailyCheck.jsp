<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<html lang='kr'>
<head>
    <meta charset='utf-8' />
</head>
<body>
<div class="main_content">
    <div class="mcontainer">
        <!-- Feeds -->
        <div class="lg-flex justify-content-center" style="align-content: flex-start">

                <div class="calendar-container">
                    <!-- FullCalendar 캘린더 -->
                    <div id='calendar'></div>
                </div>

        </div>
    </div>
</div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            dateClick: function (info) {
                var clickedDate = info.date;
                var today = new Date();

                if (clickedDate.toDateString() === today.toDateString()) {
                    showCheckInAlert();
                    updateCalendarEvent(clickedDate);
                } else {
                    Swal.fire({
                        title: '잠깐!',
                        text: '출석체크는 오늘 날짜만 가능해요',
                        icon: 'error',
                        width: 650, // 추가로 입력한 옵션
                        confirmButtonText: '확인'
                    })
                }
            },
            customButtons: {
                myCustomButton: {
                    text: '출석체크',
                    click: function () {
                        var today = new Date();
                        updateCalendarEvent(today);
                        showCheckInAlert();
                    }
                }
            },
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'myCustomButton'
            }
        });
        calendar.render();

        function showCheckInAlert() {
            Swal.fire({
                title: "최고에요 !",
                text: "오늘의 출석체크가 완료되었어요",
                imageUrl: "https://cdnimage.dailian.co.kr/news/202112/news_1638323610_1058458_m_1.jpeg",
                imageWidth: 500,
                imageHeight: 400,
                imageAlt: "Custom image"
            });
        }

        function updateCalendarEvent(date) {
            calendar.addEvent({
                title: '출석체크 완료',
                start: date,
                allDay: true,
                color: 'blue'
            });
        }
    });
</script>

</html>