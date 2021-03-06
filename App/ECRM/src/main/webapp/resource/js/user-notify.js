/**
 * Created by ChiDNMSE60717 on 6/7/2015.
 */
var damagedEquipments = {};
var noDamagedEquipments = {};

function showMap(mapId, equipments, vrows, sDayNgang, sChoNgoi, listEquipment) {
    var horizontalRows = sDayNgang.split('-');
    var noSlotsEachRows = sChoNgoi.split('-');
    var array = [];
    var o = new Object();
    var chieuDaiBan = 0;
    var chieuDaiSubDiv = 0;
    var classroommap = document.getElementById(mapId);

    classroommap.innerHTML ="";

    var container = document.createElement('div');
    container.className = 'map-container';
    classroommap.appendChild(container);

    var divT = document.createElement('div');
    divT.className = 'thietBi';
    container.appendChild(divT);
    //tao div map
    var div = document.createElement('div');
    div.className = 'map';
    container.appendChild(div);

    //tao div bang
    var divBang = document.createElement('div');
    divBang.className = 'bang';
    div.appendChild(divBang);
    var divScreen = document.createElement('div');
    divScreen.className = 'board';
    divScreen.setAttribute("data-equipmentName","Bảng");
    divScreen.innerHTML = 'Bảng';
    divBang.appendChild(divScreen);
    for (var i = 0; i < vrows; i++) {
        o = {
            soDay: horizontalRows[i],
            soChoNgoi: noSlotsEachRows[i]
        }
        array[i] = o;
    }

    //tao div con chua map
    var subDiv = document.createElement('div');
    subDiv.className = 'subDiv';
    div.appendChild(subDiv);
    var position;
    //chay vong for day doc
    for (var i = 0; i < vrows; i++) {
        var a = 0;
        //tao div day doc
        var divDay = document.createElement('div');
        divDay.className = 'day';
        subDiv.appendChild(divDay);

        //chay vong for so day ngang moi day doc
        for (var j = 0; j <= array[i].soDay; j++) {
            //tao ban giao vien
            if (j === 0) {
                if(i == 0) {
                    var divBanGheGV = document.createElement('div');
                    var divBanGV = document.createElement('div');
                    position = '[' + i + ',' + j + ']';

                    if(equipments[position] != undefined && equipments[position].status == false) {
                        divBanGV.className = 'banGV damaged';
                    } else {
                        divBanGV.className = 'equipment banGV';
                    }
                    divBanGV.setAttribute('data-equipmentName', 'Bàn');
                    divBanGV.setAttribute("data-position", position);
                    divBanGV.setAttribute("data-categoryId", "7");

                    var divDayGheGV = document.createElement('div');
                    divDayGheGV.className = 'divDayGhe';
                    var divGheGV = document.createElement('div');
                    position = '[' + i + ',' + j + ',0]';

                    if(equipments[position] != undefined && equipments[position].status == false) {
                        divGheGV.className = 'ghe damaged';
                    } else {
                        divGheGV.className = 'equipment ghe';
                    }
                    divGheGV.setAttribute('data-equipmentName', 'Ghế');
                    divGheGV.setAttribute("data-position", position);
                    divGheGV.setAttribute("data-categoryId", "8");

                    divDay.appendChild(divBanGheGV);
                    divBanGheGV.appendChild(divDayGheGV);
                    divBanGheGV.appendChild(divBanGV);
                    divDayGheGV.appendChild(divGheGV);
                } else {
                    var divBanGheGV = document.createElement('div');
                    divBanGheGV.style.height = 70 + "px";
                    divDay.appendChild(divBanGheGV);
                }
            } else {
                chieuDaiBan = 0;
                var divBanGhe = document.createElement('div');
                var divBan = document.createElement('div');
                position = '[' + i + ',' + j + ']';

                if(equipments[position] != undefined && equipments[position].status == false) {
                    divBan.className = 'ban damaged';
                } else {
                    divBan.className = 'equipment ban';
                }
                divBan.setAttribute('data-equipmentName','Bàn');
                divBan.setAttribute("data-position", position);
                divBan.setAttribute("data-categoryId", "7");

                var divDayGhe = document.createElement('div');
                divDayGhe.className = 'divDayGhe';
                divDay.appendChild(divBanGhe);
                divBanGhe.appendChild(divBan);
                divBanGhe.appendChild(divDayGhe);

                //chay vong for so cho ngoi moi ban
                for (var k = 0; k < array[i].soChoNgoi; k++) {
                    var divGhe = document.createElement('div');
                    position = '[' + i + ',' + j + ',' + k + ']';

                    if(equipments[position] != undefined && equipments[position].status == false) {
                        divGhe.className = 'ghe damaged';
                    } else {
                        divGhe.className = 'equipment ghe';
                    }
                    divGhe.setAttribute('data-equipmentName','Ghế');
                    divGhe.setAttribute("data-position", position);
                    divGhe.setAttribute("data-categoryId", "8");

                    divDayGhe.appendChild(divGhe);
                    chieuDaiBan += 34;
                }
                divBan.style.width = chieuDaiBan - 4 + "px";
            }
        }
        chieuDaiSubDiv += chieuDaiBan;
    }

    chieuDaiSubDiv = chieuDaiSubDiv + 15 * (array.length) - 15;
    subDiv.style.width = chieuDaiSubDiv + "px";
    if (chieuDaiSubDiv > 400) {
        divBang.style.width = chieuDaiSubDiv + "px";
    } else {
        divBang.style.width = "100%";
    }

    for(var i = 0; i< listEquipment.length; i++){
        if(listEquipment[i].name != "Ghế" && listEquipment[i].name != "Bàn") {
            var divEquip = document.createElement('div');
            if (equipments["[" + listEquipment[i].id + "]"] != undefined) {
                divEquip.className = 'subThietBi equip damaged';
            } else {
                divEquip.className = 'equipment subThietBi equip';
            }
            divEquip.style.backgroundImage = 'url("/resource/img/equipment/' + listEquipment[i].imageUrl + '")';
            divEquip.setAttribute('data-equipment', listEquipment[i].name);
            divEquip.setAttribute('data-position', '[' + listEquipment[i].id + ']');
            divEquip.setAttribute("data-categoryId", listEquipment[i].id);
            divT.appendChild(divEquip);
        }
    }
}

function setChooseEquipment(map){
    $("#" + map +" .equipment").click(function(){
        var category = $(this).attr("data-categoryId");
        var message = document.getElementById("category-"+category).parentNode.getElementsByClassName("message-text")[0];
        var inputT = document.getElementById("category-"+category).parentNode.getElementsByClassName("description-equipment")[0];

        if($(this).attr("data-choose") === "true"){
            $(this).removeClass("choose");
            $(this).removeAttr("data-choose");

            delete damagedEquipments[$(this).attr("data-position")];
            noDamagedEquipments[category].size--;
            if(noDamagedEquipments[category].size == 0) {
                document.getElementById("category-" + category).style.display = "none";
                document.getElementById("equipment-type-" + category).setAttribute("data-check", "false");
                document.getElementById("equipment-type-" + category).className = "check-damaged";
            }

            message.style.visibility = "visible";
            if(inputT != undefined) {
                inputT.className += " hidden";
            }
        } else {
            $(this).addClass("choose");
            $(this).attr("data-choose", "true");

            damagedEquipments[$(this).attr("data-position")] = {position: $(this).attr("data-position"), category: category, element: $(this)};
            if(noDamagedEquipments[category] != undefined) {
                noDamagedEquipments[category].size++;
            } else {
                noDamagedEquipments[category] = {size: 1, evaluate: 4};
            }

            document.getElementById("category-" + category).style.display = "block";
            document.getElementById("equipment-type-" + category).setAttribute("data-check", "true");
            document.getElementById("equipment-type-" + category).className = "check-damaged check";

            message.style.visibility = "hidden";
            var valueE = document.getElementById("category-"+category).value;
            if(inputT != undefined && parseInt(valueE) == 1) {
                inputT.className = "description-equipment";
            }
        }
    });
}




function sentReport(){
    $(".loading-page").addClass("active");

    var listEquipment = "";
    var listEvaluate = "";
    var listDesc = [];

    for (var key in damagedEquipments) {
        if (damagedEquipments.hasOwnProperty(key)){
            listEquipment += damagedEquipments[key].category + "-" + damagedEquipments[key].position + "--";
        }
    }
    listEquipment = listEquipment.substring(0, listEquipment.length-2);

    for (var key in noDamagedEquipments) {
        if (noDamagedEquipments.hasOwnProperty(key) && noDamagedEquipments[key].size > 0){
            listEvaluate += key + "-" + noDamagedEquipments[key].evaluate + ",";
            if(noDamagedEquipments[key].evaluate == 1) {
                var desc = document.getElementById("category-"+key).parentNode.getElementsByClassName("description-equipment")[0];
                listDesc.push(desc.value);
            } else {
                listDesc.push("");
            }
        }
    }

    if(listEvaluate == "") {
        conformData(1, {message: "Bạn cần chọn 1 thiết bị trước khi báo cáo!"});
        $(".loading-page").removeClass("active");
        return;
    }
    listEvaluate = listEvaluate.substring(0, listEvaluate.length-1);

    var room = document.getElementById("roomId");

    $.ajax({
        method: "POST",
        headers: {
            Accept : "text/plain; charset=utf-8",
            "Content-Type": "application/json; charset=utf-8"
        },
        url: "/giang-vien/sentReport",
        data: JSON.stringify({"roomId": room.value, "evaluate": $("#report-evaluate option:selected").text(), "listDamaged": listEquipment, "listEvaluate": listEvaluate, "listDesc": listDesc}),
        success: function(result) {
            conformData(1, {message: "Báo cáo đã được giử thành công!"});
            $(".table").css("display", "block");
            $(".none-message").remove();

            var data = result.split('-');
            var oldRow = document.getElementById("report-" + data[0]);

            if(oldRow == undefined) {
                var html = "<div class='width-10'><div>" + data[1] + "</div></div>";
                html += "<div class='width-35'><div id='list-" + data[0] + "'>" + data[2] + "</div></div>";
                var createDate = new Date(parseInt(data[3]));
                html += "<div class='width-20'><div>" + (createDate.getDate()<10?("0"+createDate.getDate()):createDate.getDate())  + "/" + ((createDate.getMonth()+1)<10?("0" + (createDate.getMonth()+1)):(createDate.getMonth()+1)) + "/" + createDate.getFullYear() + "</div></div>";
                html += "<div class='width-20'><div><p class='label red'>Chưa sửa</p></div></div>";
                html += "<div class='width-15'><div class='group-button'><div onclick='loadReportHistory(" + data[0]+ ", " + data[1] + ")' class='btn btn-normal btn-text'>Xem</div></div></div>";
                html += "<p class='clear'></p>";

                var row = document.createElement("div");
                row.className = "row";
                row.setAttribute("id", "report-" + data[0]);
                row.innerHTML = html;

                var content = document.getElementById("content-report").innerHTML;
                document.getElementById("content-report").innerHTML = "";
                document.getElementById("content-report").appendChild(row);
                document.getElementById("content-report").innerHTML += content;
            } else {
                document.getElementById("list-" + data[0]).innerHTML = data[2];
                var label = oldRow.getElementsByClassName("label")[0];
                if(label.innerHTML.trim() == 'Đã sửa') {
                    label.innerHTML = "Đang sửa";
                }
            }

            for (var key in noDamagedEquipments) {
                if (noDamagedEquipments.hasOwnProperty(key) && noDamagedEquipments[key].size > 0){
                    $("#row-type-" + key + " .width-50 p").text("Đã được báo cáo");
                    $("#row-type-" + key + " .width-50 p").css("visibility", "visible");
                }
            }

            for (var key in damagedEquipments) {
                if (damagedEquipments.hasOwnProperty(key)){
                    $(damagedEquipments[key].element).removeClass("equipment");
                    $(damagedEquipments[key].element).removeClass("choose");
                    $(damagedEquipments[key].element).removeAttr("data-choose");
                    $(damagedEquipments[key].element).addClass("damaged");
                    $(damagedEquipments[key].element).unbind( "click" );
                }
            }

            noDamagedEquipments = {};
            damagedEquipments = {};
            $(".check-damaged").attr("data-check","false");
            $(".check-damaged").removeClass("check");
            $("#room-detail-" + room.value + " .width-50 select").css("display", "none");
            $("#room-detail-" + room.value + " .width-50 select").val(4);
            $("#room-detail-" + room.value + " .width-50 input").addClass("hidden");
            $("#room-detail-" + room.value + " .width-50 input").val("");

            $(".loading-page").removeClass("active");
        }
    });
}

function loadEquipment(listDamage, mayLanh, quat, projector, loa, tivi){
    var listEquipment = new Array();
    if(projector > 0) {
        listEquipment.push({id: 1, classname: "projector", name: "Projector", message: (listDamage[1]==false?"Đã được báo cáo":"")});
    }
    if(mayLanh > 0) {
        listEquipment.push({id: 3, classname: "air-condition", name: "AirCondition", message: (listDamage[3]==false?"Đã được báo cáo":"")});
    }
    if(loa > 0) {
        listEquipment.push({id: 5, classname: "speaker", name: "Speaker", message: (listDamage[5]==false?"Đã được báo cáo":"")});
    }
    if(tivi > 0) {
        listEquipment.push({id: 2, classname: "tivi", name: "Television", message: (listDamage[2]==false?"Đã được báo cáo":"")});
    }
    if(quat > 0) {
        listEquipment.push({id: 4, classname: "fan", name: "Fan", message: (listDamage[4]==false?"Đã được báo cáo":"")});
    }
    listEquipment.push({id: 7, classname: "table-icon", name: "Table", message: (listDamage[7]==false?"Đã được báo cáo":"")});
    listEquipment.push({id: 8, classname: "chair", name: "Chair", message: (listDamage[8]==false?"Đã được báo cáo":"")});

    var contentDiv = document.getElementById("modal-1").getElementsByClassName("body-modal")[0];
    for(var i = 0; i < listEquipment.length; i++) {
        var img = document.createElement("div");
        img.className = "equipment-img " + listEquipment[i].classname;
        var div1 = document.createElement("div");
        div1.className = "width-30";
        div1.appendChild(img);

        var damageDiv = document.createElement("div");
        damageDiv.className = "check-damaged";
        damageDiv.innerHTML = "Hư hại";
        damageDiv.id = "equipment-type-" + listEquipment[i].id;
        damageDiv.setAttribute("data-check", "false");
        damageDiv.setAttribute("onclick", "changeDamaged(" + listEquipment[i].id + ")");
        var div2 = document.createElement("div");
        div2.className = "width-20";
        div2.appendChild(damageDiv);

        var div3 = document.createElement("div");
        div3.className = "width-50";
        var textP = document.createElement("p");
        textP.innerHTML = listEquipment[i].message;
        textP.className = "message-text";
        createSelect(listEquipment[i].id, div3);
        div3.appendChild(textP);

        var clear = document.createElement("p");
        clear.className = "clear";
        var row = document.createElement("div");
        row.className = "row";
        row.id = "row-type-" + listEquipment[i].id;
        row.appendChild(div1);
        row.appendChild(div2);
        row.appendChild(div3);
        row.appendChild(clear);
        contentDiv.appendChild(row);
    }
}

function createSelect(id, contentDiv){
    var select = document.createElement("select");
    select.style.display = "none";
    select.setAttribute("id","category-"+id);
    select.setAttribute("onchange", "changeEvaluate(" + id + ")");

    var listEvaluate = ["Không thể sử dụng", "Có thể sử dụng"];
    for(var i = 0; i < 2; i++){
        var option = document.createElement("option");
        option.setAttribute("value", (i+1));
        option.innerHTML = listEvaluate[i];
        select.appendChild(option);

        if(i == 1) {
            option.setAttribute("selected", "selected");
        }
    }

    contentDiv.appendChild(select);
}

function changeDamaged(id) {
    var element = document.getElementById("equipment-type-" + id);
    var message = document.getElementById("category-"+id).parentNode.getElementsByClassName("message-text")[0];
    var inputT = document.getElementById("category-"+id).parentNode.getElementsByClassName("description-equipment")[0];

    if(element.getAttribute("data-check") == "false") {
        if(id < 7) {
            damagedEquipments["[" + id + "]"] = {position: "[" + id + "]", category: id};
        }
        if(noDamagedEquipments[id] == undefined) {
            noDamagedEquipments[id] = {size: 1, evaluate: 4};
        } else {
            noDamagedEquipments[id].size = 1;
        }
        document.getElementById("category-" + id).style.display = "block";
        element.setAttribute("data-check", "true");
        element.className += " check";

        if(id < 7) {
            var thisEquip = $(".equipment[data-position='[" + id + "]']");
            $(thisEquip).addClass("choose");
            $(thisEquip).attr("data-choose", "true");
        }

        message.style.visibility = "hidden";
        var valueE = document.getElementById("category-"+id).value;
        if(inputT != undefined && parseInt(valueE) == 1) {
            inputT.className = "description-equipment";
        }
    } else {
        noDamagedEquipments[id] = {size: 0, evaluate: 4};
        document.getElementById("category-" + id).style.display = "none";
        element.setAttribute("data-check", "false");
        element.className = "check-damaged";

        for (var key in damagedEquipments) {
            if (damagedEquipments.hasOwnProperty(key) && damagedEquipments[key].category == id){
                delete damagedEquipments[key];
                var thisEquip = $(".equipment[data-position='" + key + "']");
                $(thisEquip).removeClass("choose");
                $(thisEquip).removeAttr("data-choose");
            }
        }

        message.style.visibility = "visible";
        if(inputT != undefined) {
            inputT.className += " hidden";
        }
    }
}

function changeEvaluate(category) {
    var element = document.getElementById("category-"+category);
    var inputT = element.parentNode.getElementsByClassName("description-equipment")[0];

    noDamagedEquipments[category].evaluate = parseInt(element.value);

    if(element.value == 1) {
        element.className = "small";

        if(inputT == undefined) {
            var inputT = document.createElement("input");
            inputT.className = "description-equipment";
            inputT.setAttribute("type", "text");
            inputT.setAttribute("placeholder", "Chi tiết hư hại");
            element.parentNode.appendChild(inputT);
        } else {
            inputT.className = "description-equipment"
        }
    } else {
        element.className = "";
        if(inputT != undefined) {
            inputT.className += " hidden";
        }
    }
}


function getRoom(select) {
    var room = $(select).val();
    waitLoading();

    $.ajax({
        method: "GET",
        url: "/giang-vien/mau-phong",
        data: {RoomId: room},
        success: function(data) {
            $(".content-all-modal").html(data);
            $(".content-all-modal script").remove();
            $("#roomId").val(room);
            noDamagedEquipments = {};
            damagedEquipments = {};
            closeLoading();
        }
    });
}


function loadReportHistory(reportId, roomId){
    $(".loading-page").addClass("active");

    var report = $("#hitory-report-"+ reportId);
    if(report.length == 0) {
        $.ajax({
            method: "GET",
            url: "/giang-vien/chi-tiet",
            data: {'bao-cao': reportId},
            success: function (result) {
                $(".list-data-report").html(result);
                $(".list-data-report script").remove();
                $("#room-name").html($("#room-name-" + reportId).val());
                $(".loading-page").removeClass("active");
                changePage('history-report');
            }
        });
    } else {
        $(".loading-page").removeClass("active");
        changePage('history-report');
    }
}

function viewNotify(notifyId, message){
    conformData(1, {message: message});

    $("#notify-" + notifyId).css({
        fontStyle: "normal",
        fontWeight: 100
    });
    $("#notify-" + notifyId).attr("onclick", "conformData(1, {message: '" + message + "'});");

    var number = $("#numberOfnotify").attr("data-value");
    number--;
    $("#numberOfnotify").attr("data-value", number);
    $("#numberOfnotify").html(number);
    if(number == 0) {
        $("#numberOfnotify").addClass("hidden");
    }

    $.ajax({
        method: "GET",
        url: "/giang-vien/xem-thong-bao",
        data: {id: notifyId},
        success: function(data) {}
    });
}
