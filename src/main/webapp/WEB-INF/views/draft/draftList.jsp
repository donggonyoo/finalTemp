<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전자결재 - LDBSOFT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            max-width: 1200px;
            margin-top: 40px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>전자결재</h2>
        <a href="draftForm" class="btn btn-primary">+ 새 결재문서 작성</a>
    </div>

    <!-- ✅ 검색 영역 -->
    <div class="row mb-3">
        <div class="col-md-3">
            <select id="searchType" class="form-select">
                <option value="title">제목</option>
                <option value="writer">기안자</option>
            </select>
        </div>
        <div class="col-md-6">
            <input type="text" id="searchInput" class="form-control" placeholder="검색어 입력">
        </div>
    </div>

    <!-- 결재문서 리스트 -->
    <h5 class="mb-3">내 결재문서 목록</h5>

    <table class="table table-hover table-bordered text-center align-middle" id="documentTable">
        <thead class="table-light">
            <tr>
                <th>문서번호</th>
                <th>제목</th>
                <th>문서종료일</th>
                <th>기안자</th>
                <th>1차 결재</th>
                <th>2차 결재</th>
                <th>상태</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>A00001</td>
                <td><a href="draftDetail?id=A00001">휴가신청서(5/1~5/3)</a></td>
                <td>2025-05-01</td>
                <td>동곤</td>
                <td>김부장</td>
                <td>김이사</td>
                <td><span class="badge bg-warning text-dark">1차결재 승인</span></td>
                <td><a href="draftDelete?id=A00001" class="btn btn-sm btn-outline-danger">삭제</a></td>
            </tr>
            <tr>
                <td>A00002</td>
                <td><a href="draftDetail?id=A00002">지출결의서(회의비)</a></td>
                <td>2025-05-10</td>
                <td>동곤</td>
                <td>박부장</td>
                <td>대표</td>
                <td><span class="badge bg-success">2차결재 승인</span></td>
                <td>-</td>
            </tr>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const searchInput = document.getElementById('searchInput');
    const searchType = document.getElementById('searchType');

    searchInput.addEventListener('keyup', function () {
        const keyword = searchInput.value.toLowerCase();
        const type = searchType.value; // title or writer

        const rows = document.querySelectorAll('#documentTable tbody tr');

        rows.forEach(row => {
            const titleCell = row.children[1].innerText.toLowerCase();
            const writerCell = row.children[3].innerText.toLowerCase();

            const isMatch =
                (type === 'title' && titleCell.includes(keyword)) ||
                (type === 'writer' && writerCell.includes(keyword));

            row.style.display = isMatch ? '' : 'none';
        });
    });
</script>

</body>
</html>
