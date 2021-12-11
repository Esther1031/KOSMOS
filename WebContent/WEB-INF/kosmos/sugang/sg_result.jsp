<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.sugang.vo.KosmosSugangSubjectVO" %>
<%@ page import="com.kosmos.sugang.vo.KosmosSugangListVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수강신청</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/testing.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    </style>

    <%
        Object ob_listAll = request.getAttribute("listAll");
        List<KosmosSugangListVO> listAll = (List) ob_listAll;
    %>

</head>
<body>

<!-- 사이드메뉴 -->
<div class="d-flex flex-column flex-shrink-0 vh-100" style="width: 150px; float:left;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <li class="nav-item">
            <a href="registration.k?year=2&subjectBefore=" class="nav-link active py-3 border-bottom"> <i
                    class="fa fa-home"></i> 홈 </a></li>
        <li><a href="subjectGroup.k?code=01" class="nav-link py-3 border-bottom"> <i class="fa fa-dashboard"></i>수강신청
        </a></li>
        <li><a href="sugangListAll.k" class="nav-link py-3 border-bottom"> <i class="fa fa-first-order"></i> 수강신청현황
        </a></li>

        <!-- 학교홈페이 연결부분 -->
        <li><a href="mainHome.k" class="nav-link py-3 border-bottom"> <i class="fa fa-first-order"></i> 학교 홈페이지
        </a></li>


    </ul>
    <div class="dropdown border-top">
        <a href="#"
           class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle"
           id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false"> <img src="https://github.com/mdo.png"
                                                                                    alt="mdo" width="24" height="24"
                                                                                    class="rounded-circle"> </a>
        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
        </ul>
    </div>
</div>
</div>


<div class="container">
    <div class="blank" style="height: 10px">
    </div>

    <!-- 상단 알림 부분용 svg -->
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>

    <div class="alert alert-sophie d-flex align-items-center" role="alert">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:">
            <use xlink:href="#info-fill"/>
        </svg>
        <div style="width: 10px">
        </div>
        <div>
            도움말은 <a href="#" class="alert-link">여기</a>를 클릭하세요.
        </div>
    </div>

    <div class="blank" style="height: 150px">
    </div>

    <strong>${user}</strong>님이 수강신청 하신 목록입니다! :)
    <div class="button_container" align="center">

    </div>

    <li class="list-group-item list-group-item-sophie">
        <div class="blank" style="height: 40px"></div>

        <table class="table table-hover">
            <%
                int total = 0;
                for (int i = 0; i < listAll.size(); i++) {


            %>
            <tr>
                <td>
                    <div style="width: 80%; float:left;"><%=listAll.get(i).getSb_name()%>
                    </div>
                    <div style="width: 10%; float:left"><%=listAll.get(i).getSb_creditunit()%>학점</div>
                    <div style="float:left">정원 <%=listAll.get(i).getSb_maxstu()%>명</div>
                    <% total += Integer.parseInt(listAll.get(i).getSb_creditunit()); %>

                </td>
            </tr>
            <% } %>
        </table>
        <div style="width: 70%; float:left;"></div>
        <div style="margin-right:15%; float:right;"> 전체 : <%=total %> 학점</div>
        <div style="float:left"></div>

        <p class="blank_p"></p>

    </li>

    <script type="text/javascript" src="/resource/js/bootstrap.js"></script>
</div>
</body>
</html>
