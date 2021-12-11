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
        
        .list-group {
		    color: #856404;
		    border: 1px solid black;
		    border-radius: 8px; 
		}
		.btn-outline-primary {
 		  	color: black;
		    border-color: black;
		}

    </style>
    <script>
        $().alert('close')
    </script>
    <%

        String code_num = (String) request.getAttribute("code");
        String sub_name = "";
        switch (code_num) {
            case ("01"):
                sub_name = "국어";
                break;
            case ("02"):
                sub_name = "수학";
                break;
            case ("03"):
                sub_name = "영어";
                break;
            case ("04"):
                sub_name = "한국사";
                break;
            case ("05"):
                sub_name = "사회";
                break;
            case ("06"):
                sub_name = "과학";
                break;
            case ("07"):
                sub_name = "체육";
                break;
            case ("08"):
                sub_name = "예술";
                break;
            case ("09"):
                sub_name = "교양";
                break;
            case ("10"):
                sub_name = "생활";
                break;
            case ("11"):
                sub_name = "진로";
                break;
        }

        String[] li_names = {"",
                "list-group-item list-group-item-warning",
                "list-group-item list-group-item-info",
                "list-group-item list-group-item-success",
                "list-group-item list-group-item-primary",
                "list-group-item list-group-item-secondary",
                "list-group-item list-group-item-warning",
                "list-group-item list-group-item-info",
                "list-group-item list-group-item-success",
                "list-group-item list-group-item-primary",
                "list-group-item list-group-item-secondary",
                "list-group-item list-group-item-warning"
        };

    %>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#list.get(i).getSb_name()').click(function () {
                alert("selectedName:" + selectedName);
                $(selectedName).prop('checked', true);
                $(selectedName).trigger('change');
            });
            // $("input[name='radio01']").checked
            $(".radio01").click
                //		$("input[name='radio01']").checked
                (function () {

                    $("#test").attr({

                        "action": "update.k",
                        "method": "GET"

                    }).submit();

                });

        });


    </script>


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
        <!-- 학교홈페이지 연결부분 -->
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
    <form name="test" id="test" method="get">

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


        <div class="blank" style="height: 135px">

            <%if (request.getAttribute("name") != null) {%>
            <div class="alert alert-sophie alert-dismissible fade show" role="alert">
                <strong><%=sub_name%>
                </strong>에서 <strong>${name}</strong>을 선택하셨습니다.
            </div>
            <%} %>
        </div>

        <!-- 박스 색깔 바꾸기용 -->
        <div class="button_container" align="center">

            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="국어"
                   onclick="location='subjectGroup.k?code=01'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="수학"
                   onclick="location='subjectGroup.k?code=02'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="영어"
                   onclick="location='subjectGroup.k?code=03'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="한국사"
                   onclick="location='subjectGroup.k?code=04'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="사회"
                   onclick="location='subjectGroup.k?code=05'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="과학"
                   onclick="location='subjectGroup.k?code=06'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="체육"
                   onclick="location='subjectGroup.k?code=07'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="예술"
                   onclick="location='subjectGroup.k?code=08'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="교양"
                   onclick="location='subjectGroup.k?code=09'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="생활"
                   onclick="location='subjectGroup.k?code=10'">
            <input type="button" class="btn btn-outline-primary"
                   id="sb_groupNum" name="sb_groupNum" value="진로"
                   onclick="location='subjectGroup.k?code=11'">

        </div>
        <ul class="list-group">

            <li class="<%=li_names[Integer.parseInt(code_num)]%>">
                <div class="category" style="margin-left: 50px; margin-top: 40px; margin-bottom:-20px;">
                    <%=sub_name %> 과목군
                </div>


                <div class="d-flex justify-content-left mt-5 align-items-center">
                    <section id="first" class="section">

                            <%
                            Object ob_groupRowNum = request.getAttribute("groupRowNum");
                            String groupRowString = (String) ob_groupRowNum;
                            Object ob_sugangList = request.getAttribute("groupList");
                            List<KosmosSugangListVO> list = (List) ob_sugangList;
                            Object ob_selectedName = request.getAttribute("selectedName");
//							out.println("selectedName : "+request.getAttribute("selectedName"));
                            String selectedName = "";
                            String checked = "";
                            if (ob_selectedName != null) {
                                selectedName = (String) ob_selectedName;
                            }
                            int groupRowInt = Integer.parseInt(groupRowString);

                            String buttonID = "radioID";
                            String buttonIDWithNum = "";

                            for (int i = 0; i < groupRowInt; i++) {
                                //   buttonNameWithNum = buttonName+String.valueOf(i);
                                buttonIDWithNum = buttonID + String.valueOf(i);
                                //   System.out.println(buttonNameWithNum);

                        %>
                        <table class="table table-hover">
                            <tr>
                                <td>
                                    <div style="width :30%; float:right;"><input type="radio" name="radio01"
                                                                                 id="<%=list.get(i).getSb_name()%>"
                                                                                 onclick="location='update.k?name=<%=list.get(i).getSb_name()%>&code=<%=code_num%>'">
                                    </div>
                                    <label style="width:100%;" for="<%=list.get(i).getSb_name()%>">
                                        <span class="radio"><%=list.get(i).getSb_name()%></span>


                                        <!--                         <tr><td><div class="radio-container"> -->


                                        <div style="width: 10%; float:right"><%=list.get(i).getSb_creditunit()%>학점</div>
                                        <div style="width: 15%; float:right">정원<%=list.get(i).getSb_maxstu()%>명</div>
                                    </label>
                </div>

                </td>
                </tr>
                </section>
                    <%} %>
                </table>

</div>

</li>
</ul>

<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
</form>

</div>
</body>
</html>
