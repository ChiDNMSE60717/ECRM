<%--
  Created by IntelliJ IDEA.
  User: Htang
  Date: 5/28/2015
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>ECRM - Equipment Classroom Management</title>
    <link rel="stylesheet" href="resource/css/font-awesome.css"/>
    <link rel="stylesheet" href="resource/css/layout.css"/>
    <link rel="stylesheet" href="resource/css/general.css"/>
    <link rel="stylesheet" href="resource/css/management.css"/>
    <link rel="stylesheet" href="resource/css/roomtype.css"/>
</head>
<body>
<c:set var="user" value="${sessionScope.USER}"/>
<div class="contain-layout">
    <jsp:include flush="true" page="Header.jsp"/>
</div>
<div class="container">
    <div class="title page-title right-button">
        <p>Quản lý phòng học</p>
        <input type="button" class="btn btn-orange" onclick="showModal(1, 'modal-1')" value="Tạo phòng học"/>
        <div class="clear"></div>
    </div>
    <div class="body-content">
        <div class="tab">
            <div class="tab-medium">
                <ul>
                    <li class="active" onclick="changeTab('tab1', this)">Phòng học</li>
                    <li onclick="changeTab('tab2', this)">Loại phòng</li>
                </ul>
            </div>
            <div class="content-tab">
                <div id="tab1" class="body-tab active">
                    <div class="search" style="  margin: 0 0 15px;">
                        <input type="text" placeholder="............."/>
                        <input type="button" class="btn btn-orange" value="Tìm kiếm"/>
                    </div>
                    <div class="clear"></div>
                    <div class="table small-table">
                        <div class="header-table">
                            <div class="room-number">
                                <div>Số phòng</div>
                            </div>
                            <div class="room-type">
                                <div>Loại phòng</div>
                            </div>
                            <div class="control">
                                <div>Quản lý</div>
                            </div>
                            <p class="clear"></p>
                        </div>
                        <div class="body-table">
                            <div class="row">
                                <div class="room-number">
                                    <div>101</div>
                                </div>
                                <div class="room-type">
                                    <div>Loại 1</div>
                                </div>
                                <div class="control">
                                    <div class="group-button">
                                        <div class="btn btn-detail" title="Chỉnh sửa"><i class="fa fa-pencil"></i></div>
                                        <div class="btn btn-view" title="Xem sơ đồ"><i class="fa fa-eye"></i></div>
                                        <div class="btn btn-remove" onclick="conform(2, {room: 101})" title="Xóa"><i
                                                class="fa fa-times"></i></div>
                                    </div>
                                </div>
                                <p class="clear"></p>
                            </div>
                            <div class="row">
                                <div class="room-number">
                                    <div>103</div>
                                </div>
                                <div class="room-type">
                                    <div>Loại 1</div>
                                </div>
                                <div class="control">
                                    <div class="group-button">
                                        <div class="btn btn-detail" title="Chỉnh sửa"><i class="fa fa-pencil"></i></div>
                                        <div class="btn btn-view" title="Xem sơ đồ"><i class="fa fa-eye"></i></div>
                                        <div class="btn btn-remove" onclick="conform(2, {room: 103})" title="Xóa"><i
                                                class="fa fa-times"></i></div>
                                    </div>
                                </div>
                                <p class="clear"></p>
                            </div>
                            <div class="row">
                                <div class="room-number">
                                    <div>202</div>
                                </div>
                                <div class="room-type">
                                    <div>Loại 2</div>
                                </div>
                                <div class="control">
                                    <div class="group-button">
                                        <div class="btn btn-detail" title="Chỉnh sửa"><i class="fa fa-pencil"></i></div>
                                        <div class="btn btn-view" title="Xem sơ đồ"><i class="fa fa-eye"></i></div>
                                        <div class="btn btn-remove" onclick="conform(2, {room: 202})" title="Xóa"><i
                                                class="fa fa-times"></i></div>
                                    </div>
                                </div>
                                <p class="clear"></p>
                            </div>
                            <div class="row">
                                <div class="room-number">
                                    <div>210</div>
                                </div>
                                <div class="room-type">
                                    <div>Loại 1</div>
                                </div>
                                <div class="control">
                                    <div class="group-button">
                                        <div class="btn btn-detail" title="Chỉnh sửa"><i class="fa fa-pencil"></i></div>
                                        <div class="btn btn-view" title="Xem sơ đồ"><i class="fa fa-eye"></i></div>
                                        <div class="btn btn-remove" onclick="conform(2, {room: 210})" title="Xóa"><i
                                                class="fa fa-times"></i></div>
                                    </div>
                                </div>
                                <p class="clear"></p>
                            </div>
                            <div class="row">
                                <div class="room-number">
                                    <div>506</div>
                                </div>
                                <div class="room-type">
                                    <div>Loại 3</div>
                                </div>
                                <div class="control">
                                    <div class="group-button">
                                        <div class="btn btn-detail" title="Chỉnh sửa"><i class="fa fa-pencil"></i></div>
                                        <div class="btn btn-view" title="Xem sơ đồ"><i class="fa fa-eye"></i></div>
                                        <div class="btn btn-remove" onclick="conform(2, {room: 506})" title="Xóa"><i
                                                class="fa fa-times"></i></div>
                                    </div>
                                </div>
                                <p class="clear"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab2" class="body-tab">
                    <div>
                        <input type="button" class="btn btn-orange" style="margin: 0" onclick="showModal(1, 'modal-3')"
                               value="Tạo loại phòng"/>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<form action="/createClassroom">
    <div class="modal modal-small" id="modal-1">
        <div class="content-modal">
            <div class="header-modal title">
                <p>Nhập từ file excel</p>
                <i class="fa fa-times" onclick="showModal(0,'modal-1')"></i>
            </div>
            <div class="body-modal">
                <div class="group-control">
                    <div class="name">Số phòng</div>
                    <div class="control">
                        <input type="text" name="RoomName" placeholder=".........................."/>
                    </div>
                </div>
                <div class="group-control">
                    <div class="name">Loại phòng</div>
                    <div class="value" id="loaiphong"></div>
                    <input type="hidden" name="RoomType" value="" id="roomtype">
                    <input type="button" class="btn btn-normal" onclick="showModal(2, 'modal-1','modal-2')"
                           value="Chọn"/>
                </div>
            </div>
            <div class="footer-modal">
                <input type="button" class="btn btn-normal" onclick="showModal(0, 'modal-1')" value="Thoát"/>
                <input type="submit" class="btn btn-orange" onclick="conform(1)" value="Thêm"/>
            </div>
        </div>
        <div class="black-background"></div>
    </div>
</form>
<div class="modal modal-large" id="modal-2">
    <div class="content-modal">
        <div class="header-modal title">
            <p>Loại phòng học</p>
            <i class="fa fa-times" onclick="showModal(2, 'modal-2','modal-1')"></i>
        </div>
        <c:set value="${requestScope.ALLROOMTYPE}" var="roomtypes"/>
        <div class="body-modal">
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Loại phòng</div>
                <div class="control">
                    <select onchange="changeFunc()" id="selectBox">
                        <option value="" selected>...</option>
                        <c:forEach var="r" items="${roomtypes}">
                            <option value="{id :${r.id}, verticalRows:${r.verticalRows}, horizontalRows:${r.horizontalRows}
                            , noSlotsEachHRows:${r.noSlotsEachHRows}, airConditioning:${r.airConditioning},
                            fan:${r.fan}, projector:${r.projector}, speaker:${r.speaker}, television:${r.television}}">Loai ${r.id}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="group-control">
                <div class="name">Sơ đồ</div>
            </div>
            <div class="classroom-map" id="classroommap">
            </div>
        </div>
        <div class="footer-modal">
            <input type="button" class="btn btn-normal" onclick="showModal(2, 'modal-2','modal-1')" value="Thoát"/>
            <input type="button" class="btn btn-orange" onclick="showModal(2, 'modal-2','modal-1')" value="Chọn"/>
        </div>
    </div>
    <div class="black-background"></div>
</div>
<div class="modal modal-medium" id="modal-3">
    <div class="content-modal">
        <div class="header-modal title">
            <p>Tạo loại phòng </p>
            <i class="fa fa-times" onclick="showModal(0, 'modal-3')"></i>
        </div>
        <div class="body-modal">
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Máy chiếu</div>
                <div class="control">
                    <input type="checkbox" id="projector"/>
                </div>
            </div>
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Máy quạt</div>
                <div class="control">
                    <input type="checkbox" id="quat"/>
                </div>
            </div>
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Máy lạnh</div>
                <div class="control">
                    <input type="checkbox" id="mayLanh"/>
                </div>
            </div>
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Tivi</div>
                <div class="control">
                    <input type="checkbox" id="tivi"/>
                </div>
            </div>
            <div class="group-control" style="margin: 15px 0 0">
                <div class="name">Loa</div>
                <div class="control">
                    <input type="checkbox" id="loa"/>
                </div>
            </div>
            <div class="group-control">
                <div class="name">Số dãy bàn</div>
                <div class="control">
                    <select id="vrow" onchange="createDetailMap()">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
            </div>
            <div class="room-map">
                <div class="title-map">
                    <div></div>
                    <div>Số hàng</div>
                    <div>Số ghế</div>
                    <p class="clear"></p>
                </div>
                <div id="detail">
                    <div class="row" id="row-1">

                    </div>
                    <div class="row" id="row-2">

                    </div>
                    <div class="row" id="row-3">

                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="footer-modal">
            <input type="button" class="btn btn-normal" onclick="showModal(0, 'modal-3')" value="Thoát"/>
            <input type="button" class="btn btn-orange" onclick="viewMap(); showModal(2, 'modal-3','modal-4')"
                   value="Xem trước"/>
        </div>
    </div>
    <div class="black-background"></div>
</div>
<form action="createRoomType">
    <div class="modal modal-medium" id="modal-4">
        <input type="hidden" id="Slots" name="Slots" value="">
        <input type="hidden" id="VerticalRows" name="VerticalRows" value="">
        <input type="hidden" id="HorizontalRows" name="HorizontalRows" value="">
        <input type="hidden" id="NoSlotsEachHRows" name="NoSlotsEachHRows" value="">
        <input type="hidden" id="AirConditioning" name="AirConditioning" value="">
        <input type="hidden" id="Fan" name="Fan" value="">
        <input type="hidden" id="Projectors" name="Projector" value="">
        <input type="hidden" id="Speaker" name="Speaker" value="">
        <input type="hidden" id="Television" name="Television" value="">

        <div class="content-modal">
            <div class="header-modal title">
                <p>Tạo loại phòng </p>
                <i class="fa fa-times" onclick="showModal(2, 'modal-4', 'modal-3')"></i>
            </div>
            <div class="body-modal">
                <div class="map-container" id="idContainer">
                </div>
            </div>
            <div class="footer-modal">
                <input type="button" class="btn btn-normal" onclick="showModal(2, 'modal-4', 'modal-3')"
                       value="Quay lại"/>
                <input type="submit" class="btn btn-orange" onclick="conform(2)" value="Tạo mẫu"/>
            </div>
        </div>
        <div class="black-background"></div>
    </div>
</form>
<script src="../../resource/js/script.js"></script>
<script src="../../resource/js/roomtype.js"></script>
<script>
    window.onload = createDetailMap;
    function doAction(choose, object) {
        closeConform();
        switch (choose) {
            case 1:
                showModal(0, 'modal-3');
                alert("Loại phòng đã được lưu thành công!");

                break;
            case 2:
                showModal(0, 'modal-4');
                alert("Loại phòng đã được lưu thành công!");
                break;
        }
    }
</script>
</body>
</html>