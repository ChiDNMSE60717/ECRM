/**
 * Created by ChiDNMSE60717 on 5/26/2015.
 */
var damagedEquipments = {};

function showMap(mapId, equipments, vrows, sDayNgang, sChoNgoi, e) {
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


    for(var i = 0; i< e.length; i++){
        var divProjector = document.createElement('div');
        if(equipments["["+ e[i].id+"]"] != undefined && equipments["["+ e[i].id+"]"].status == false) {
            divProjector.className = 'subThietBi equip damaged';
        } else {
            divProjector.className = 'equipment subThietBi equip';
        }
        divProjector.style.backgroundImage = 'url("../resource/img/equipment/' + e[i].imageUrl + '")';
        divProjector.setAttribute('data-equipment',e[i].name);
        divProjector.setAttribute('data-position','['+ e[i].id+']');
        divProjector.setAttribute("data-categoryId", e[i].id);
        divT.appendChild(divProjector);
    }
    /*//projector
    if(projector>0){
        var divProjector = document.createElement('div');
        if(equipments["[1]"] != undefined && equipments["[1]"].status == false) {
            divProjector.className = 'subThietBi projector damaged';
        } else {
            divProjector.className = 'equipment subThietBi projector';
        }
        divProjector.setAttribute('data-equipmentName','Máy chiếu');
        divProjector.setAttribute("data-position", "[1]");
        divProjector.setAttribute("data-categoryId", "1");
        divT.appendChild(divProjector);
    }

    //tivi
    if(tivi>0){
        var divTivi = document.createElement('div');
        if(equipments["[2]"] != undefined && equipments["[2]"].status == false) {
            divTivi.className = 'subThietBi tivi damaged';
        } else {
            divTivi.className = 'equipment subThietBi tivi';
        }
        divTivi.setAttribute('data-equipmentName','Tivi');
        divTivi.setAttribute("data-position", "[2]");
        divTivi.setAttribute("data-categoryId", "2");
        divT.appendChild(divTivi);
    }

    //may lanh
    if(mayLanh>0){
        var divMayLanh = document.createElement('div');
        if(equipments["[3]"] != undefined && equipments["[3]"].status == false) {
            divMayLanh.className = 'subThietBi mayLanh damaged';
        } else {
            divMayLanh.className = 'equipment subThietBi mayLanh';
        }
        divMayLanh.setAttribute('data-equipmentName','Máy lạnh');
        divMayLanh.setAttribute("data-position", "[3]");
        divMayLanh.setAttribute("data-categoryId", "3");
        divT.appendChild(divMayLanh);
    }

    //quat
    if(quat>0){
        var divQuat = document.createElement('div');
        if(equipments["[4]"] != undefined && equipments["[4]"].status == false) {
            divQuat.className = 'subThietBi quat damaged';
        } else {
            divQuat.className = 'equipment subThietBi quat';
        }

        divQuat.setAttribute('data-equipmentName','Quạt');
        divQuat.setAttribute("data-position", "[4]");
        divQuat.setAttribute("data-categoryId", "4");
        divT.appendChild(divQuat);
    }

    //loa
    if(loa>0){
        var divLoa = document.createElement('div');
        if(equipments["[5]"] != undefined && equipments["[5]"].status == false) {
            divLoa.className = 'subThietBi loa damaged';
        } else {
            divLoa.className = 'equipment subThietBi loa';
        }
        divLoa.setAttribute('data-equipmentName','Loa');
        divLoa.setAttribute("data-position", "[5]");
        divLoa.setAttribute("data-categoryId", "5");
        divT.appendChild(divLoa);
    }*/
}

function setChooseEquipment(map){
    $("#" + map +" .equipment").click(function(){
        var category = $(this).attr("data-categoryId");
        if($(this).attr("data-choose") === "true"){
            $(this).removeClass("choose");
            $(this).removeAttr("data-choose");

            delete damagedEquipments[$(this).attr("data-position")];
            Android.removeEquipment($(this).attr("data-equipmentname"), $(this).attr("data-position"));
        } else {
            $(this).addClass("choose");
            $(this).attr("data-choose", "true");

            damagedEquipments[$(this).attr("data-position")] = {position: $(this).attr("data-position"), category: category};
            Android.addEquipment($(this).attr("data-equipmentname"), $(this).attr("data-position"));
        }
    });
}