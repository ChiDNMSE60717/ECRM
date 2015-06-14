<%--
  Created by IntelliJ IDEA.
  User: ChiDNMSE60717
  Date: 5/30/2015
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>ECRM - Equipment Classroom Management</title>
    <link rel="stylesheet" href="../resource/css/font-awesome.css"/>
    <link rel="stylesheet" href="../resource/css/layout.css"/>
    <link rel="stylesheet" href="../resource/css/general.css"/>
    <link rel="stylesheet" href="../resource/css/roomtype-2.css"/>
    <link rel="stylesheet" href="../resource/css/notify.css"/>

    <script src="../resource/js/jquery-1.11.3.js"></script>
    <script src="../resource/js/script.js"></script>
    <script src="../resource/js/user-notify.js"></script>
</head>
<body>
<c:set var="room" value="${requestScope.ROOM}"/>
<c:set var="notifies" value="${requestScope.NOTIFICATIONS}"/>
<input type="hidden" id="roomId" value="${room.id}"/>
<div class="contain-layout">
    <jsp:include page="../Header.jsp"/>
</div>
<div class="container">
    <div class="title page-title right-button">
        <p>Lịch sử báo cáo</p>
        <input type="button" id="report-btn" class="btn btn-orange" onclick="showModal(1, 'modal-1')"
               value="Tạo báo cáo"/>

        <div class="clear"></div>
    </div>
    <div class="body-content">
        <div class="search">
            <div class="control">
                <select>
                    <option>Phòng</option>
                    <option>101</option>
                    <option>102</option>
                    <option>103</option>
                    <option>205</option>
                    <option>213</option>
                </select>
            </div>
            <div class="control">
                <select>
                    <option>Thiết bị</option>
                    <option>Ghế</option>
                    <option>Bàn</option>
                    <option>Đèn</option>
                    <option>Máy chiếu</option>
                    <option>Máy lạnh</option>
                    <option>Máy quạt</option>
                </select>
            </div>
            <div class="control">
                <select>
                    <option>Trạng thái</option>
                    <option>Đã sửa</option>
                    <option>Mới báo cáo</option>
                </select>
            </div>
            <div class="control">
                <select>
                    <option>Ngày báo cáo</option>
                    <option>02/03/2015</option>
                </select>
            </div>
            <div class="clear"></div>
        </div>

        <div class="table">
            <div class="header-table">
                <div class="width-10">
                    <div>Phòng</div>
                </div>
                <div class="width-35">
                    <div>Thiết bị</div>
                </div>
                <div class="width-20">
                    <div>Ngày báo cáo</div>
                </div>
                <div class="width-20">
                    <div>Trạng thái</div>
                </div>
                <div class="width-15">
                    <div>Quản lý</div>
                </div>
                <p class="clear"></p>
            </div>
            <div class="body-table" id="content-report">
                <c:if test="${notifies.size() > 0}">
                     <c:forEach var="i" begin="0" end="${notifies.size()-1}">
                    <div class="row">
                        <div class="width-10">
                            <div>${notifies[i].room}</div>
                        </div>
                        <div class="width-35">
                            <div id="list-${notifies[i].reportId}" title="${notifies[i].listEquipment}">${notifies[i].listEquipment}</div>
                        </div>
                        <div class="width-20">
                            <div>${notifies[i].createDate}</div>
                        </div>
                        <div class="width-20">
                            <div>
                                <c:if test="${notifies[i].status == 1}">
                                    <p class="label red">Chưa sửa</p>
                                </c:if>
                                <c:if test="${notifies[i].status == 2}">
                                    <p class="label yellow">Đang sửa</p>
                                </c:if>
                                <c:if test="${notifies[i].status == 3}">
                                    <p class="label green">Đã sửa</p>
                                </c:if>
                                <c:if test="${notifies[i].status == 4}">
                                    <p class="label">Đã hủy</p>
                                </c:if>
                            </div>
                        </div>
                        <div class="width-15">
                            <div class="group-button">
                                <div onclick="loadReportHistory(${notifies[i].reportId}, ${notifies[i].room})" class="btn btn-detail"><i
                                        class="fa fa-file"></i>
                                </div>
                                <div href="javascript:void(0)" class="btn btn-remove"><i class="fa fa-times"></i></div>
                            </div>
                        </div>
                        <p class="clear"></p>
                    </div>
                </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div class="content-all-modal">
    <div class="modal modal-medium" id="modal-1">
        <div class="content-modal">
            <div class="header-modal title">
                <p>Tạo báo cáo</p>
                <i class="fa fa-times" onclick="showModal(0, 'modal-1')"></i>
            </div>
            <div class="body-modal">
                <div class="group-control" style="margin: 20px 0">
                    <div class="name">Đánh giá của bạn</div>
                    <div class="control" style="width: 300px">
                        <select id="report-evaluate" style="width: 200px; float: right">
                            <option value="1">Phải đổi phòng</option>
                            <option value="2" selected="selected">Cẫn sửa ngay</option>
                            <option value="3">Vẫn dạy được</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="footer-modal">
                <input type="button" class="btn btn-orange" onclick="conform(1)" value="Gửi báo cáo"/>
                <input type="button" class="btn btn-normal" onclick="showModal(2, 'modal-1', 'modal-2')" value="Chọn vị trí"/>
            </div>
        </div>
        <div class="black-background"></div>
    </div>
    <div class="modal modal-medium" id="modal-2">
        <div class="content-modal">
            <div class="header-modal title">
                <p>Sơ đồ phòng</p>
                <i class="fa fa-times" onclick="showModal(2, 'modal-2', 'modal-1')"></i>
            </div>
            <div class="body-modal">
                <div id="classroom-map">

                </div>
            </div>
            <div class="footer-modal">
                <input type="button" class="btn btn-normal" onclick="showModal(2, 'modal-2', 'modal-1')" value="Quay lại"/>
            </div>
            </div>
        <div class="black-background"></div>
    </div>
    <div class="modal modal-medium" id="modal-3">
        <div class="content-modal">
            <div class="header-modal title">
                <p>Lịch sử báo cáo</p>
                <i class="fa fa-times" onclick="showModal(0, 'modal-3')"></i>
            </div>
            <div class="body-modal" id="report-history"></div>
            <div class="footer-modal">
                <input type="button" class="btn btn-normal" onclick="showModal(0, 'modal-3')" value="Thoát"/>
            </div>
        </div>
        <div class="black-background"></div>
    </div>
</div>
<div class="content-notification">

</div>

<script>
    <c:if test="${room.id != 0}">
    <c:set var="rt" value="${requestScope.ROOMTYPE}" />
    <c:set var="equip" value="${requestScope.EQUIPMENTS}" />
    var positionEquipments = {};
    var damageEquip = {};
    <c:if test="${equip.size() > 0}" >
        <c:forEach begin="0" end="${equip.size() -1}" var="i">
            <c:if test="${equip[i].position != null && equip[i].status == true}">
                positionEquipments["${equip[i].position.trim()}"] = {id: ${equip[i].id}, status: ${equip[i].status}};
            </c:if>
            if(damageEquip[${equip[i].categoryId}] == undefined) {
                damageEquip[${equip[i].categoryId}] = ${equip[i].status};
            } else if(damageEquip[${equip[i].categoryId}] == false) {
                damageEquip[${equip[i].categoryId}] = ${equip[i].status};
            }
        </c:forEach>
    </c:if>

    window.onload = function () {
        loadEquipment(damageEquip, ${rt.airConditioning}, ${rt.fan}, ${rt.projector}, ${rt.speaker}, ${rt.television});
        showMap('classroom-map', positionEquipments, ${rt.verticalRows}, '${rt.horizontalRows}', '${rt.numberOfSlotsEachHRows}', ${rt.airConditioning},
                ${rt.fan}, ${rt.projector}, ${rt.speaker}, ${rt.television});
        setChooseEquipment('classroom-map');
    }
    </c:if>
    <c:if test="${room.id == 0}">
        document.getElementById("report-btn").className += " disable";
        document.getElementById("modal-1").setAttribute("data-lock", "true");
    </c:if>

    <c:if test="${requestScope.MESSAGE != null}">
        alert("${requestScope.MESSAGE}");
    </c:if>

    function doAction(choose, object) {
        closeConform();
        switch (choose) {
            case 1:
                sentReport();
                showModal(0, 'modal-1');
                //location.reload();
                break;
        }
    }
</script>
</body>
</html>