<%--
  Created by IntelliJ IDEA.
  User: Htang
  Date: 5/28/2015
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="user" value="${sessionScope.USER}"/>
<c:choose>
    <c:when test="${empty user}">
        <jsp:forward page="Login.jsp"/>
    </c:when>
    <c:otherwise>
        <html>
        <head>
            <meta charset="UTF-8"/>
            <title>Hệ thống quản lý thiết bị phòng học</title>
            <link rel="stylesheet" href="/resource/css/font-awesome.css"/>
            <link rel="stylesheet" href="/resource/css/general.css"/>
            <link rel="stylesheet" href="/resource/css/newTemplate.css"/>
            <link rel="stylesheet" href="/resource/css/simplePagination.css"/>
            <link rel="stylesheet" href="/resource/css/management.css"/>

            <script src="/resource/js/jquery-1.11.3.js"></script>
            <script src="/resource/js/jquery-1.11.3.min.js"></script>
            <script src="/resource/js/newTemplate.js"></script>

        </head>
        <style>
            .equip {
                width: 35px;
                height: 35px;
                background-size: 100% 100%;
            }
        </style>
        <c:set var="equipments" value="${requestScope.EQUIPMENTS}"/>
        <c:set var="mCategories" value="${requestScope.MANAGEDCATEGORIES}"/>
        <c:set var="tab1" value="${requestScope.TABCONTROL}"/>
        <c:set var="tab" value="${requestScope.ACTIVETAB}"/>
        <div class="layout-background" style="height: 0px">
            <div class="container">
                <div class="header">
                    <div class="logo">HỆ THỐNG QUẢN LÝ THIẾT BỊ PHÒNG HỌC</div>
                    <div class="account-control">
                        <p>${user.tblUserInfoByUsername.fullName}</p>
                        <img src="/resource/img/gears.png"/>
                    </div>
                </div>
                <div class="content-body">
                    <c:import url="/bao-cao/danh-muc"/>
                    <div class="right-content">
                        <div class="page active" id="equipment">
                            <div class="title" style="padding: 0; height: 70px">
                                <p>Quản lý thiết bị</p>
                                <input type="button" class="btn btn-orange" style="display: none"
                                       id="createEquipmentBtn" value="Tạo thiết bị"
                                       onclick="showModal(1, 'modal-1'); document.getElementById('equipment-action').value = 'insert';
                                                            document.getElementById('equipment-classroomId').value = '0';
                                                            document.getElementById('time-remain').style.display = 'none';
                                                            $('#modal-1 > div.content-modal').css('height','307px');
                                                            document.getElementById('equipment-category-select').disabled = false;
                                                            "/>
                                <input type="button" class="btn btn-orange" id="createEquipCategoryBtn"
                                       style="display: none; margin: 0" value="Tạo loại thiết bị"
                                       onclick="showModal(1, 'modal-category')"/>

                                <div class="clear"></div>
                                <div class="title-category">
                                    <ul>
                                        <li id="head-tab1" onclick="changeManage('tab1', this)" data-tab="equipment-tab"
                                            class="active">Thiết bị
                                        </li>
                                        <li id="head-tab2" onclick="changeManage('tab2', this)"
                                            data-tab="equipment-tab">Loại thiết bị
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab equipment-tab">
                                <div class="content-tab">
                                    <div id="tab1" class="body-tab">

                                        <jsp:include flush="false" page="Staff_ManageEquipment.jsp"/>
                                    </div>
                                    <div id="tab2" class="body-tab">

                                        <jsp:include flush="false" page="Staff_ManageCategory.jsp"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:import url="/bao-cao/thong-bao?little=false&quay-lai=equipment"/>
                        <div class="loading-page">
                            <img src="/resource/img/500.GIF">

                            <div>Đang tải! Vui lòng chờ trong giây lát!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-modal">
            <form action="/staff/createEquipment" id="createEquipment" name="createEquipment" method="post">
                <input type="hidden" name="Action" id="equipment-action">
                <input type="hidden" name="classroomId" id="equipment-classroomId">
                <input type="hidden" name="equipmentId" id="equipment-id">
                <input type="hidden" name="category" id="equipment-category">

                <div class="modal modal-medium" id="modal-1">
                    <div class="content-modal" style="height: 317px">
                        <div class="header-modal title">
                            <p id="classroomName">Tạo thiết bị</p>
                            <i class="fa fa-times" onclick="showModal(0,'modal-1'); clearEquipment()"></i>
                        </div>
                        <div class="body-modal">
                            <div class="group-control">
                                <div class="name">Loại thiết bị</div>
                                <div class="control">
                                    <select name="categoryId" id="equipment-category-select">
                                        <c:forEach items="${mCategories}" var="ca">
                                            <option value="${ca.id}">${ca.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Tên thiết bị</div>
                                <input type="text" name="name" id="equipment-name" maxlength="30">
                            </div>
                            <div class="group-control">
                                <div class="name">Số seri</div>
                                <input type="text" name="serialNumber" id="equipment-number" maxlength="20">
                            </div>
                            <div class="group-control">
                                <div class="name">Thời gian sử dụng</div>
                                <input type="text" name="usingTime" onkeydown="return ( event.ctrlKey || event.altKey
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false)
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9)
                    || (event.keyCode>34 && event.keyCode<40)
                    || (event.keyCode==46) )" maxlength="5" id="equipment-time">
                            </div>
                            <div class="group-control" id="time-remain">
                                <div class="name">Thời gian còn lại</div>
                                <input type="text" name="timeRemain" onkeydown="return ( event.ctrlKey || event.altKey
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false)
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9)
                    || (event.keyCode>34 && event.keyCode<40)
                    || (event.keyCode==46) )" maxlength="5" id="equipment-remain">
                            </div>
                        </div>
                        <div class="footer-modal">
                            <input type="button" class="btn btn-normal"
                                   onclick="showModal(0, 'modal-1'); clearEquipment();"
                                   value="Thoát"/>
                            <input type="button" class="btn btn-orange" onclick="validateEquipment();"
                                   id="equipment-button"
                                   value="Tạo"/>
                        </div>
                    </div>
                    <div class="black-background"></div>
                </div>
            </form>

            <form action="/staff/createCategory" id="createCategory" name="createCategory" enctype="multipart/form-data"
                  method="post">
                <div class="modal modal-medium" id="modal-category">
                    <div class="content-modal" style="height: 300px">
                        <div class="header-modal title">
                            <p>Tạo loại thiết bị</p>
                            <i class="fa fa-times" onclick="showModal(0,'modal-category'); clearCategory();"></i>
                        </div>
                        <div class="body-modal">
                            <div class="group-control">
                                <div class="name">Tên loại</div>
                                <div class="control">
                                    <input name="name" type="text" id="categoryName" maxlength="30">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Hình ảnh</div>
                                <div class="control"><input type="file" id="fileUpload" name="scheduleFile" size="50"
                                                            accept="image/*"/>

                                    <p id="lblError" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Giờ báo hư</div>
                                <div class="control">
                                    <input name="expiredTime" type="text" id="expiredTime"
                                           onkeydown="return ( event.ctrlKey || event.altKey
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false)
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9)
                    || (event.keyCode>34 && event.keyCode<40)
                    || (event.keyCode==46) )" maxlength="3" value="0">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Quản lý</div>
                                <input type="checkbox" id="checkManage" onclick="checkManaged();">
                                <input type="hidden" id="isManaged" name="isManaged" value="0">
                            </div>
                        </div>
                        <div class="footer-modal">
                            <input type="button" class="btn btn-normal"
                                   onclick="showModal(0, 'modal-category'); clearCategory();"
                                   value="Thoát"/>
                            <input type="button" class="btn btn-orange"
                                   value="Tạo" onclick="validateCreateCategory();"/>
                        </div>
                    </div>
                    <div class="black-background"></div>
                </div>
            </form>

            <form action="/staff/editCategory" id="editCategory" name="editCategory" enctype="multipart/form-data"
                  method="post">
                <div class="modal modal-medium" id="modal-edit-category">
                    <div class="content-modal" style="height: 265px">
                        <div class="header-modal title">
                            <p>Cập nhật loại thiết bị</p>
                            <i class="fa fa-times" onclick="showModal(0,'modal-category'); clearEditCategory();"></i>
                        </div>
                        <input type="hidden" id="edit-categoryId" name="categoryId">

                        <div class="body-modal">
                            <div class="group-control">
                                <div class="name">Tên loại thiết bị</div>
                                <div class="control">
                                    <input name="name" type="text" id="edit-categoryName" maxlength="30">
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Cập nhật hình ảnh</div>
                                <div class="control"><input type="file" id="edit-fileUpload" name="scheduleFile"
                                                            size="50" accept="image/*"/>

                                    <p id="edit-lblError" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="group-control">
                                <div class="name">Giờ báo hư</div>
                                <div class="control">
                                    <input name="expiredTime" type="text"
                                           onkeydown="return ( event.ctrlKey || event.altKey
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false)
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9)
                    || (event.keyCode>34 && event.keyCode<40)
                    || (event.keyCode==46) )" maxlength="3" id="edit-expiredTime">
                                </div>
                            </div>
                        </div>
                        <div class="footer-modal">
                            <input type="button" class="btn btn-normal"
                                   onclick="showModal(0, 'modal-edit-category'); clearEditCategory();"
                                   value="Thoát"/>
                            <input type="button" class="btn btn-orange"
                                   value="Cập nhật" onclick="validateEditCategory();"/>
                        </div>
                    </div>
                    <div class="black-background"></div>
                </div>
            </form>
        </div>


        </body>
        <script src="/resource/js/script.js"></script>
        <script src="/resource/js/jquery.simplePagination.js"></script>

        <script>
            function validateEquipment() {
                var action = document.forms["createEquipment"]["Action"].value;
                var name = document.forms["createEquipment"]["name"].value;
                var serialNumber = document.forms["createEquipment"]["serialNumber"].value;
                var usingTime = document.forms["createEquipment"]["usingTime"].value;
                var timeRemain = document.forms["createEquipment"]["timeRemain"].value;

                $.ajax({
                    type: "get",
                    url: "/ajax/checkEquipment",
                    cache: false,
                    data: 'name=' + name + '&serialNumber=' + serialNumber + '&usingTime=' + usingTime + '&timeRemain=' + timeRemain
                    + '&action=' + action,
                    success: function (data) {
                        if (data.status == true) {
                            showModal(0, 'modal-1');
                            document.getElementById('createEquipment').submit();
                            $(".loading-page").addClass("active");
                            $(".page").removeClass("active");
                        } else {
                            conformData(1, {message: data.alert});
                        }
                    },
                    error: function () {
                        conformData(1, {message: 'Xin Hãy Nhập Đầy Đủ Thông Tin!'});
                    }
                })
            }
            function ValidateExtension() {
                var fileUpload = document.getElementById("fileUpload");
                var lblError = document.getElementById("lblError");
                var regex = /^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.jpeg|.png|.gif)$/;
                if (!regex.test(fileUpload.value.toLowerCase())) {
                    conformData(1, {message: 'Hãy chọn tập tin có đuôi là: .jpg, .jpeg,.png, .gif'});
                    return false;
                }
                lblError.innerHTML = "";
                return true;
            }
            function clearCategory() {
                document.getElementById('categoryName').value = '';
                document.getElementById('fileUpload').value = '';
                document.getElementById('expiredTime').value = '0';
                document.getElementById('checkManage').checked = false;
            }
            function validateCreateCategory() {
                if (ValidateExtension()) {
                    var name = document.forms["createCategory"]["name"].value;
                    var expiredTime = document.forms["createCategory"]["expiredTime"].value;
                    $.ajax({
                        type: "get",
                        url: "/ajax/checkCategory",
                        cache: false,
                        data: 'name=' + name+'&expiredTime=' + expiredTime,
                        success: function (data) {
                            if (data.status == true) {
                                showModal(0, 'modal-category');
                                document.getElementById('createCategory').submit();
                                $(".loading-page").addClass("active");
                                $(".page").removeClass("active");
                            } else {
                                conformData(1, {message: data.alert});
                            }
                        },
                        error: function () {
                            conformData(1, {message: 'Xin Hãy Nhập Đầy Đủ Thông Tin!'});
                        }
                    })
                }
            }

            function checkManaged() {
                if (document.getElementById('checkManage').checked) {
                    document.getElementById('isManaged').value = "1";
                } else {
                    document.getElementById('isManaged').value = "0";

                }
            }

            function editCategory(categoryId, categoryName) {

            }
            function ValidateExtension2() {
                var fileUpload = document.getElementById("edit-fileUpload");
                var lblError = document.getElementById("edit-lblError");
                var regex = /^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.jpeg|.png|.gif)$/;
                if (!regex.test(fileUpload.value.toLowerCase())) {
                    conformData(1, {message: 'Hãy chọn tập tin có đuôi là: .jpg, .jpeg,.png, .gif'});
                    return false;
                }
                lblError.innerHTML = "";
                return true;
            }
            function validateEditCategory() {
                if (ValidateExtension2()) {
                    var name = document.forms["editCategory"]["name"].value;
                    var categoryId = document.forms["editCategory"]["categoryId"].value;
                    var expiredTime = document.forms["editCategory"]["expiredTime"].value;
                    $.ajax({
                        type: "get",
                        url: "/ajax/checkEditCategory",
                        cache: false,
                        data: 'name=' + name + '&categoryId=' + categoryId+'&expiredTime='+expiredTime,
                        success: function (data) {
                            if (data.status == true) {
                                showModal(0, 'modal-edit-category');
                                document.getElementById('editCategory').submit();
                                $(".loading-page").addClass("active");
                                $(".page").removeClass("active");
                            } else {
                                conformData(1, {message: data.alert});
                            }
                        },
                        error: function () {
                            conformData(1, {message: 'Xin Hãy Nhập Đầy Đủ Thông Tin!'});
                        }
                    })
                }
            }

            function clearEditCategory() {
                document.getElementById('edit-categoryName').value = '';
                document.getElementById('edit-categoryId').value = '';
                document.getElementById('edit-fileUpload').value = '';
            }

            //phan trang
            jQuery(function ($) {
                var items = $("#removeClassroom > div");

                var numItems = items.length;
                var perPage = 9;

                // only show the first 2 (or "first per_page") items initially
                items.slice(perPage).hide();
                // now setup pagination
                $("#pagination").pagination({
                    items: numItems,
                    itemsOnPage: perPage,
                    cssStyle: "compact-theme",
                    onPageClick: function (pageNumber) { // this is where the magic happens
                        // someone changed page, lets hide/show trs appropriately
                        var showFrom = perPage * (pageNumber - 1);
                        var showTo = showFrom + perPage;

                        items.hide() // first hide everything, then show for the new page
                                .slice(showFrom, showTo).show();
                    }
                });
            });
            //phan trang
            jQuery(function ($) {
                var items = $("#removeCategory > div");

                var numItems = items.length;
                var perPage = 9;

                // only show the first 2 (or "first per_page") items initially
                items.slice(perPage).hide();
                // now setup pagination
                $("#pagination2").pagination({
                    items: numItems,
                    itemsOnPage: perPage,
                    cssStyle: "compact-theme",
                    onPageClick: function (pageNumber) { // this is where the magic happens
                        // someone changed page, lets hide/show trs appropriately
                        var showFrom = perPage * (pageNumber - 1);
                        var showTo = showFrom + perPage;

                        items.hide() // first hide everything, then show for the new page
                                .slice(showFrom, showTo).show();
                    }
                });
            });

            document.getElementById("${tab1}").className += " active";
            document.getElementById("${tab1}").setAttribute("data-main", "1");

            document.getElementById("${tab}").className = "body-tab active";
            var tab = '${tab}';
            if (tab === 'tab1') {
                document.getElementById("head-tab1").className = "active";
                document.getElementById("head-tab2").className = "";
                document.getElementById("createEquipmentBtn").style.display = "block";
            } else {
                document.getElementById("head-tab2").className = "active";
                document.getElementById("head-tab1").className = "";
                document.getElementById("createEquipCategoryBtn").style.display = "block";
            }

            function changeManage(tab, thisE) {
                changeTabInTitle(tab, thisE);

                if (tab == 'tab1') {
                    document.getElementById("createEquipmentBtn").style.display = "block";
                    document.getElementById("createEquipCategoryBtn").style.display = "none";
                } else {
                    document.getElementById("createEquipmentBtn").style.display = "none";
                    document.getElementById("createEquipCategoryBtn").style.display = "block";
                }

                window.history.pushState({
                    "html": '',
                    "pageTitle": 'Hệ thống quản lý thiết bị phòng học'
                }, "", "/staff/equipment?ACTIVETAB=" + tab);
            }
            connectToSocket('${sessionScope.USER.username}', ${sessionScope.USER.roleId});
        </script>
        </html>
    </c:otherwise>
</c:choose>