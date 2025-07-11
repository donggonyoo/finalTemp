<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>캘린더 관리 - LDBSOFT 그룹웨어</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.css" rel="stylesheet">
  <style>
    body { background-color: #f4f6f9; }
    .container { max-width: 1000px; margin-top: 40px; }
    #calendar {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="mb-4">📅 캘린더 관리</h2>
  <div id="calendar"></div>
</div>

<!-- 일정 상세/수정 모달 -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="eventForm">
        <div class="modal-header">
          <h5 class="modal-title">일정 정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="eventId">
          <div class="mb-3">
            <label for="eventTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="eventTitle" required>
          </div>
          <div class="mb-3">
            <label for="eventContent" class="form-label">내용</label>
            <textarea class="form-control" id="eventContent" rows="3"></textarea>
          </div>
          <div class="mb-3">
            <label for="eventStart" class="form-label">시작일</label>
            <input type="date" class="form-control" id="eventStart" required>
          </div>
          <div class="mb-3">
            <label for="eventEnd" class="form-label">종료일</label>
            <input type="date" class="form-control" id="eventEnd">
          </div>
        </div>
        <!-- 이부분을 관리자 혹은 수정권한이 있는사람만 보이게끔하고 위에 텍스트상자도 권한이 없다면 모두 readonly처리할것-->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">수정</button>
          <button type="button" class="btn btn-danger" id="deleteEventBtn">삭제</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var currentEvent = null;

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: ''
      },
      events: [
        {
          id: '1',
          title: '프로젝트 A 시작',
          start: '2025-07-10',
          end: '2025-07-15',
          color: '#0d6efd',
          extendedProps: {
            content: '프로젝트 A를 본격적으로 시작합니다.'
          }
        },
        {
          id: '2',
          title: '전체 회의',
          start: '2025-07-12',
          color: '#20c997',
          extendedProps: {
            content: '부서 전체 회의가 진행됩니다.'
          }
        }
      ],
      eventClick: function(info) {
        currentEvent = info.event;
        document.getElementById('eventId').value = currentEvent.id;
        document.getElementById('eventTitle').value = currentEvent.title;
        document.getElementById('eventContent').value = currentEvent.extendedProps.content || '';
        document.getElementById('eventStart').value = currentEvent.startStr;
        document.getElementById('eventEnd').value = currentEvent.endStr || '';

        var modal = new bootstrap.Modal(document.getElementById('eventModal'));
        modal.show();
      }
    });

    calendar.render();

    // 수정 이벤트 처리
    document.getElementById('eventForm').addEventListener('submit', function (e) {
      e.preventDefault();
      if (!currentEvent) return;

      currentEvent.setProp('title', document.getElementById('eventTitle').value);
      currentEvent.setExtendedProp('content', document.getElementById('eventContent').value);
      currentEvent.setStart(document.getElementById('eventStart').value);
      const endVal = document.getElementById('eventEnd').value;
      if (endVal) {
        currentEvent.setEnd(endVal);
      } else {
        currentEvent.setEnd(null);
      }

      bootstrap.Modal.getInstance(document.getElementById('eventModal')).hide();
    });

    // 삭제 이벤트 처리
    document.getElementById('deleteEventBtn').addEventListener('click', function () {
      if (currentEvent && confirm('정말 삭제하시겠습니까?')) {
        currentEvent.remove();
        bootstrap.Modal.getInstance(document.getElementById('eventModal')).hide();
      }
    });
  });
</script>
</body>
</html>
