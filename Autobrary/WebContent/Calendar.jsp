<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>calendar</title>
	<link href='fullCalendar/core/main.css' rel='stylesheet' />
	<script src='fullCalendar/core/main.js'></script>
	<script src='fullcalendar/core/locales/ko.js'></script>
	
    <link href='fullCalendar/daygrid/main.css' rel='stylesheet' />
    <script src='fullCalendar/daygrid/main.js'></script>
    
    <link href='fullCalendar/bootstrap/main.css' rel='stylesheet' />
    <script src='fullCalendar/bootstrap/main.js'></script>
    
    <script src="fullCalendar/interaction/main.min.js"></script>
    <style>
        .btn-primary {
            font-size: 0.8em;
            background: #000;
            border: none;
        }
        
        .btn-primary:disabled {
            background: gray;
        }
        .btn-primary:hover {
            background: gray;
        }
        
        .btn-primary:active {
            background: gray;
            border: none;
        }
        
        table {
            border: none;
        }
    </style>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ['interaction', 'dayGrid', 'bootstrap'],
            header: {
                left : 'title',
                right : 'today, prev, next'
            },
            titleFormat: {
                month : 'long'
            },
            editable : false,
            droppable : false,
            height:'auto',
            themeSystem : 'bootstrap',
            locale : 'ko'
        });
        
        calendar.on('dateClick', function(info) {
            console.log('clicked on ' + info.dateStr);
        })

        calendar.render();
    });
	</script>
</head>
<body>
      	<div id="calendar"></div>
</body>
</html>