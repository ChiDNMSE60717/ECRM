<%--
  Created by IntelliJ IDEA.
  User: Htang
  Date: 5/28/2015
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="user" value="${sessionScope.USER}"/>
<c:choose>
    <c:when test="${empty user}">
        <jsp:forward page="Login.jsp"/>
    </c:when>
    <c:otherwise>
        <html>
        <head>
            <c:set var="tab" value="${requestScope.ACTIVETAB}"/>
            <c:set var="classrooms" value="${requestScope.CLASSROOMS}"/>
            <c:set var="teachers" value="${requestScope.TEACHERS}"/>
            <c:set var="teachingDate" value="${requestScope.TEACHINGDATE}"/>
            <c:set var="classroomId" value="${requestScope.CLASSROOMID}"/>
            <c:set var="schedules" value="${requestScope.SCHEDULES}"/>
            <c:set var="datefrom" value="${requestScope.DATEFROM}"/>
            <c:set var="dateto" value="${requestScope.DATETO}"/>
            <c:set var="teacher" value="${requestScope.TEACHER}"/>
            <c:set var="classroom" value="${requestScope.CLASSROOM}"/>
            <c:set var="isEmpty" value="${requestScope.ISEMPTY}"/>
            <c:set var="scheduleConfig" value="${requestScope.SCHEDULECONFIG}"/>
            <meta charset="UTF-8"/>
            <title>ECRM - Equipment Classroom Management</title>
            <link rel="stylesheet" href="../../resource/css/font-awesome.css"/>
            <link rel="stylesheet" href="../../resource/css/layout.css"/>
            <link rel="stylesheet" href="../../resource/css/general.css"/>
            <link rel="stylesheet" href="../../resource/css/jquery-ui.css"/>
            <link rel="stylesheet" href="../../resource/css/component.css"/>

            <script src="../../resource/js/jquery-1.11.3.js"></script>
            <script src="../../resource/js/jquery-1.11.3.min.js"></script>
            <script src="../../resource/js/jquery-ui.js"></script>
            <script src="../../resource/js/Staff-schedule.js"></script>
            <style>
                .custom-combobox {
                    position: relative;
                    display: inline-block;
                }

                .custom-combobox-toggle {
                    position: absolute;
                    top: 0;
                    bottom: 0;
                    margin-left: -1px;
                    padding: 0;
                }

                .custom-combobox-input {
                    margin: 0;
                    padding: 5px 10px;
                    width: 170px;
                }

                .inline {
                    display: inline-block;
                    margin-left: 15px;
                }

                .inline div {
                    margin-bottom: 5px;
                }

                .show-more {
                    position: absolute;
                    width: 1.8em;
                    height: 1.8em;
                }

                .advance-search {
                    display: block;
                    position: absolute;
                    left: 50%;
                    margin-left: -8px;
                    top: 50%;
                    margin-top: -8px;
                    background-image: url("../../resource/img/ic_expand_more_48px-256.png");
                    width: 16px;
                    height: 16px;
                    text-indent: -99999px;
                    overflow: hidden;
                    background-repeat: no-repeat;
                }
            </style>
            <script>
                function findAvailableRoom() {
                    if (document.getElementById('chckBox').checked) {
                        document.getElementById('classroom').style.display = 'none';
                        document.getElementById('avai_classroom').style.display = 'block';
                        document.getElementById("all").selectedIndex = 0;
                        $.ajax({
                            type: "get",
                            url: "/ajax/findClassroom",
                            cache: false,
                            data: 'slot=' + $("#slot").val() + "&numberOfSlots=" + $("#numberOfSlots").val() +
                            "&numberOfStudent=" + $("#numberOfStudent").val() + "&date=" + $("#datepickerFrom").val(),
                            success: function (responseText) {
                                $('#avai').html(responseText);
                            },
                            error: function () {
                                alert('Error while request..');
                            }
                        })
                    } else {
                        document.getElementById('avai_classroom').style.display = 'none';
                        document.getElementById('classroom').style.display = 'block';
                        document.getElementById("avai").selectedIndex = 0;

                    }

                }
            </script>
        </head>
        <body style="background: url('../../resource/img/Calendar-600.jpg') no-repeat; background-size: cover">

        <div class="contain-layout">
            <jsp:include flush="true" page="Header.jsp"/>
        </div>
        <div class="container">
            <div class="title page-title right-button">
                <p>Xếp lịch</p>

                <div><input type="button" class="btn btn-orange" onclick="showModal(1,'Upload');" value="Nhập File"/>
                </div>
                <div><input type="button" class="btn btn-orange" onclick="showModal(1,'Manual');"
                            value="Tạo mới"/></div>
                <div class="clear"></div>
            </div>


            <form action="/staff/searchSchedule" onsubmit="return validateForm()" name="searchForm">
                <div style=" margin-top: 20px;margin-left: 20px; background-color: #ffffff; width: 490px;height: 50px; border-bottom: 1px solid #EBEEF3;">

                    <div class="search" style="  margin: 0 15px 0 15px;  display: inline-flex;padding-top: 7px">
                        <a style="margin-right: 3px;background-color: #AAAAAA; border-radius: 3px; cursor: pointer;"
                           title="Advance Search" onclick="showAdvance();"><img
                                src="../../resource/img/ic_expand_more_48px-256.png"
                                style="width:25px;height: 25px; padding-top: 6px"></a>
                        <select onchange="changeSearch();" id="selectSearch">
                            <option value="0">Giáo viên</option>
                            <option value="1">Phòng học</option>
                        </select>

                        <div class="ui-widget" style="display: block" id="teacherBox">
                            <select name="username" style="width: 150px" id="combobox2" style="display: none">
                                <option value="0"></option>
                                <c:choose>
                                    <c:when test="${not empty teacher}">
                                        <c:forEach items="${teachers}" var="t">
                                            <c:choose>
                                                <c:when test="${teacher == t.username}">
                                                    <option value="${t.username}"
                                                            selected>${t.tblUserInfoByUsername.fullName}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${t.username}">${t.tblUserInfoByUsername.fullName}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${teachers}" var="t">
                                            <option value="${t.username}">${t.tblUserInfoByUsername.fullName}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="ui-widget" style="display: none" id="classroomBox">
                            <select name="classroomId" id="combobox1" style="display: none">
                                <option value="0"></option>
                                <c:choose>
                                    <c:when test="${not empty classroom}">
                                        <c:forEach items="${classrooms}" var="c">
                                            <c:choose>
                                                <c:when test="${classroom == c.id}">
                                                    <option value="${c.id}" selected>${c.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${classrooms}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div>
                            <div style="padding: 0px 0px 0px 0px;">
                                <button type="submit" class="btn btn-orange" style="margin-left: 15px">Tìm Kiếm</button>
                            </div>
                        </div>
                    </div>
                </div>
                <c:choose>
                <c:when test="${not empty datefrom or not empty dateto}">
                <div style="margin-left: 20px; background-color: #ffffff; width: 490px;height: 50px;display: block"
                     class="date">
                    </c:when>
                    <c:otherwise>
                    <div style="margin-left: 20px; background-color: #ffffff; width: 490px;height: 50px;display: none"
                         class="date">
                        </c:otherwise>
                        </c:choose>


                        <div style="margin-left: 15px">Ngày:
                            <input type="text" id="datefrom" name="datefrom" value="${datefrom}"><label>
                                ~ </label><input
                                    type="text"
                                    id="dateto"
                                    name="dateto" value="${dateto}"></div>
                    </div>
            </form>
            <c:if test="${not isEmpty}">
                <c:if test="${not empty schedules}">
                    <div class="component">
                    <div style="background-color: #ffffff;">
                        <header style="  border-bottom: 1px solid #EBEEF3; padding: 10px;font-size: medium;
  font-weight: bold;">
                            LỊCH
                        </header>
                    </div>
                    <table class="overflow-y">
                        <thead>
                        <tr>

                            <th>Phòng</th>
                            <th>Ngày</th>

                            <c:forEach items="${teachingDate}" var="td">
                                <th>${td}</th>
                            </c:forEach>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cs" items="${schedules}">
                            <tr>
                                <th rowspan="${cs.rowspan}">${cs.roomName}</th>
                            </tr>

                            <c:forEach var="tis" items="${cs.timeSchedules}">
                                <c:if test="${ not empty tis.teacherSchedules}">
                                    <tr>
                                        <td bgcolor="yellow">${tis.timeFrom} - ${tis.timeTo}</td>

                                        <c:forEach items="${teachingDate}" var="td">
                                            <td>
                                                <c:forEach var="tes" items="${tis.teacherSchedules}">
                                                    <c:if test="${tes.date == td.toString()}">
                                                        ${tes.teacher} <span style="font-style: italic; color: red">${tes.note}</span>
                                                    </c:if>
                                                </c:forEach>
                                            </td>

                                        </c:forEach>
                                    </tr>

                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                </div>
            </c:if>
            <div class="modal modal-small" id="Upload">
                <div class="content-modal">
                    <div class="header-modal title">
                        <p>Nhập Lịch</p>
                        <i class="fa fa-times" onclick="showModal(0, 'Upload')"></i>
                    </div>
                    <div class="body-modal">
                        <a href="/staff/download">Bấm vào để tải mẫu!</a>

                        <p>Chọn file excel:</p>

                        <form action="/staff/import" method="post"
                              enctype="multipart/form-data" id="uploadSchedule">
                            <input type="file" name="scheduleFile" size="50" accept=".csv,
                        application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/>
                            <br/>
                        </form>
                    </div>
                    <div class="footer-modal">
                        <input type="button" class="btn btn-normal" onclick="showModal(0, 'Upload')"
                               value="Thoát"/>
                        <input type="button" class="btn btn-orange" onclick="conform(1);"
                               value="Nhập lịch"/>
                    </div>
                </div>
                <div class="black-background"></div>
            </div>

            <div class="modal modal-medium" id="Manual">
                <div class="content-modal" style="height: 530px">
                    <div class="header-modal title">
                        <p>Nhập Lịch Bằng Tay</p>
                        <i class="fa fa-times" onclick="showModal(0, 'Manual')"></i>
                    </div>
                    <form action="/staff/importManually" id="importManually"
                          name="ImportManually">
                        <div class="body-modal">

                            <br/>

                            <div class="group-control">
                                <div class="name">Tài khoản(*):</div>

                                <div class="ui-widget">
                                    <select id="ui-username" name="username" id="username">
                                        <option value=""></option>
                                        <c:forEach items="${teachers}" var="t">
                                            <option value="${t.username}">${t.username}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="group-control">
                                <div class="name">Tiết bắt đầu(*):</div>
                                <div class="control">
                                    <select name="slot" id="slot">
                                        <c:forEach items="${scheduleConfig}" var="sc">
                                            <option value="${sc.slot}">${sc.slot} - ${sc.timeFrom}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Số tiết(*):</div>
                                <div class="control">
                                    <select name="numberOfSlots" id="numberOfSlots">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                    </select>
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Số học sinh(*):</div>
                                <div class="control">
                                    <input type="text"
                                           onkeydown="return ( event.ctrlKey || event.altKey
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false)
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9)
                    || (event.keyCode>34 && event.keyCode<40)
                    || (event.keyCode==46) )" name="numberOfStudent" id="numberOfStudent">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Từ ngày(*):</div>
                                <div class="control">
                                    <input type="text" id="datepickerFrom" name="dateF">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Đến ngày:</div>
                                <div class="control">
                                    <input type="text" id="datepickeTo" name="dateT">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Phòng học(*):</div>
                                <div class="control">
                                    <input type="checkbox" onclick="findAvailableRoom()" id="chckBox">Tìm phòng trống
                                    <div id="classroom">
                                        <div class="ui-widget">
                                            <select id="all" name="all">
                                                <option value="0"></option>
                                                <c:forEach items="${classrooms}" var="c">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="avai_classroom" style="display: none">
                                        <div class="ui-widget">
                                            <select id="avai" name="avai">
                                                <option value="0"></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-modal">
                            <input type="button" class="btn btn-normal" onclick="showModal(0, 'Manual')"
                                   value="Thoát"/>
                            <button type="button" class="btn btn-orange" onclick="validateImportForm()">Tạo</button>
                        </div>
                    </form>
                </div>
                <div class="black-background"></div>
            </div>


        </div>
        </div>

        <script src="../../resource/js/script.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
        <script src="../../resource/js/jquery.stickyheader.js"></script>
        <script>
            if ('${teacher}' != 0) {
                var select = document.getElementById("selectSearch").selectedIndex = 0;

                changeSearch();
            }
            if ('${classroom}' != 0) {
                var select = document.getElementById("selectSearch").selectedIndex = 1;
                changeSearch();
            }
            function doAction(choose, object) {
                closeConform();
                switch (choose) {
                    case 1:
                        document.getElementById('uploadSchedule').submit();
                        waitLoading();
                        break;
                }
            }
            function validateImportForm() {
                var username = document.forms["ImportManually"]["username"].value;
                var numberOfStudent = document.forms["ImportManually"]["numberOfStudent"].value;
                var dateFrom = document.forms["ImportManually"]["dateF"].value;
                var dateTo = document.forms["ImportManually"]["dateT"].value;
                var all = document.forms["ImportManually"]["all"].value;
                var avai = document.forms["ImportManually"]["avai"].value;
                $.ajax({
                    type: "get",
                    url: "/ajax/checkClassroom",
                    cache: false,
                    data: 'all=' + all + '&numberOfStudent=' + numberOfStudent + '&dateFrom=' + dateFrom + '&username=' + username +
                    '&avai=' + avai + '&dateTo=' + dateTo,
                    success: function (data) {
                        if (data.status == true) {
                            document.getElementById('importManually').submit();
                        } else {
                            alert(data.alert);
                        }
                    },
                    error: function () {
                        alert('Error while request..');
                    }
                })

            }
            function checkClassroom(classroomId) {
                $.ajax({
                    type: "get",
                    url: "/ajax/checkClassroom",
                    cache: false,
                    data: 'classroomId=' + classroomId,
                    success: function (data) {
                        console.log(data);
                    },
                    error: function () {
                        alert('Error while request..');
                    }
                })
            }
            function changeSearch() {
                var select = document.getElementById("selectSearch");
                var sub = select.options[select.selectedIndex].value;
                if (sub == '0') {
                    document.getElementById('teacherBox').style.display = 'block';
                    document.getElementById('classroomBox').style.display = 'none';
                    $("#classroomBox  span  input").val("");
                    document.getElementById('combobox1').selectedIndex = 0;
                } else {
                    document.getElementById('teacherBox').style.display = 'none';
                    document.getElementById('classroomBox').style.display = 'block';
                    $("#teacherBox  span  input").val("");
                    document.getElementById('combobox2').selectedIndex = 0;
                }
            }
            function showAdvance() {
                $('.date').toggle();
            }
        </script>
        </body>
        </html>
    </c:otherwise>
</c:choose>