<%--
  Created by IntelliJ IDEA.
  User: ChiDNMSE60717
  Date: 7/12/2015
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="room" value="${requestScope.DAMAGEDROOM}"/>
<c:set var="rt" value="${room.roomtype}" />
<script>
  var positionEquipments = {};
  <c:forEach items="${room.equipment}" var="item">
  <c:if test="${item.position != null && '[0]'.equals(item.position) == false && item.status == false}">
    positionEquipments["${item.position.trim()}"] = {id: ${item.id}, status: ${item.status}};
  </c:if>
  </c:forEach>
</script>
<div class="left-col width-50">
  <div class="tab">
        <div class="tab-medium">
          <ul>
            <li class="active" onclick="changeTab('tab4', this)">Thông tin</li>
            <li onclick="changeTab('tab5', this)">Sơ đồ</li>
          </ul>
        </div>
        <div class="content-tab">
          <div id="tab4" class="body-tab active">
            <div class="group-control">
              <div class="name">Phòng</div>
              <div class="value">${room.roomName}</div>
            </div>
            <div class="group-control">
              <div class="name">Thiết bị</div>
              <div class="value" style="max-width: 210px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">${(room.equipmentCategory).toString().substring(2, room.equipmentCategory.toString().length()-1)}</div>
            </div>
            <div class="group-control">
              <div class="name">Người báo cáo</div>
              <div class="value" style="max-width: 210px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">${room.reporters}</div>
            </div>
            <div class="group-control">
              <div class="name">Báo cáo mới nhất</div>
              <div class="value"><fmt:formatDate value="${room.reportDate}" pattern="HH:mm dd/MM/yyyy" /></div>
            </div>
            <div class="group-control line">
              <div class="name">Giảng viên đánh giá</div>
              <div class="value">${room.evaluate}</div>
            </div>
            <div class="group-control">
              <div class="name">Đề xuất đổi phòng</div>
              <c:if test="${room.free == false}">
                <div class="change-room-text">
                  <div class="value">Phòng <b>${room.suggestRooms.get(0)}</b></div>
                  <input type="button" class="btn btn-normal" onclick="showModal(1,'change-room')" value="Đổi phòng">
                </div>
              </c:if>
              <c:if test="${room.free == true}">
                <div class="value">Phòng hiện đang trống</div>
              </c:if>
            </div>
            <div class="group-control">
              <div class="name">Hư hại của phòng</div>
              <div class="control">
                <div class="process">
                  <p>${room.damagedLevel}%</p>
                  <div class="percent" style="left:${room.damagedLevel}%"></div>
                </div>
              </div>
            </div>
          </div>
          <div id="tab5" class="body-tab" style="max-height: 390px; overflow: hidden">
            <div id="room-map"></div>
          </div>
        </div>
      </div>
</div>
<div class="right-col width-45">
  <div class="tab"><div class="tab-medium"><ul><li class="active">Danh sách hư hại</li></ul></div></div>
  <form action="/bao-cao/sua-chua" id="resolveForm" method="post" style="margin: 0;">
    <input type="hidden" value="${room.roomId}" name="RoomId"/>
    <input type="hidden" id="ListResolve" value="" name="ListResolve">
    <input type="hidden" id="ListEquip" value="" name="ListRealEquip">
  </form>

  <c:if test="${room.equipmentCategory.size() > 4}">
  <div class="scroll-list-equip">
  </c:if>
  <c:forEach items="${room.equipmentCategory}" var="item" >
    <div class="group-equipment" style="overflow: hidden;">
      <c:if test="${item.serialNumber.size() == 0}">
        <input type="checkbox" class="equipment-type" value="${item.id}"/>
      </c:if>
      <c:if test="${item.serialNumber.size() > 0}">
        <input type="checkbox" class="equipment-type" value="${item.id}"/>
      </c:if>
      <div class="equip" style="background-image: url('/resource/img/equipment/${item.urlImage}')"></div>
      <div class="equipment">${item.name}</div>
      <c:if test="${item.size == 0}">
        <div class="quantity">Số lượng: Không xác định</div>
      </c:if>
      <c:if test="${item.size > 0}">
        <div class="quantity">Số lượng: ${item.size}</div>
      </c:if>
      <div class="clear"></div>
      <c:if test="${item.serialNumber.size() > 0}">
        <div class="list-real-equipment" id="real-equip-${item.id}">
          <div class="real-equipment">${item.name}</div>
          <c:forEach items="${item.serialNumber}" var="item2">
            <div class="real-equipment" onclick="chooseRealEquipment('${item2}', ${item.id}, this)">${item2}</div>
          </c:forEach>
        </div>
      </c:if>
    </div>
  </c:forEach>
  <c:if test="${room.equipmentCategory.size() > 4}">
  </div>
  </c:if>
  <p style="margin-bottom: 0">
    <input type="button" class="btn btn-primary" onclick="conformData(3, {message:'Bạn muốn khắc phục hư hại phòng ${room.roomName}!', btnName: 'Khắc phục', choose: 1, object: {}})"  value="Khắc phục" />
    <input type="button" class="btn btn-normal" onclick="conformData(2, {message:'Bạn muốn khắc phục tất cả hư hại phòng ${room.roomName}!', btnName: 'Khắc phục', link: '/bao-cao/sua-het?roomId=${room.roomId}'})" value="Khắc phục tất cả" />
  </p>

</div>
</div>

<c:if test="${room.free == false}">
  <div class="modal modal-small" id="change-room">
  <div class="content-modal" style="height: 217px;">
      <div class="header-modal title" style=" margin: 0; height: 50px; background: -webkit-linear-gradient(top, #f4f4f4 12%,#e2e2e2 100%);">
        <p>Đổi phòng</p>
      </div>
      <div class="body-modal">
        <div class="group-control">
          <input type="hidden" id="current-room" value="${room.roomName}" />
          <div class="name">Phòng hiện tại</div>
          <div class="value">${room.roomName}</div>
        </div>
        <div class="group-control">
          <div class="name">Phòng trống</div>
          <div class="control">
            <c:if test="${room.suggestRooms != null}">
              <select id="new-room">
                <c:forEach items="${room.suggestRooms}" var="item" >
                  <option value="${item}">${item}</option>
                </c:forEach>
              </select>
            </c:if>
          </div>
        </div>
      </div>
      <div class="footer-modal" style="border-top: 1px solid #ccc;">
        <input type="button" class="btn btn-normal" onclick="showModal(0, 'change-room');" value="Đóng" />
        <input type="button" class="btn btn-primary" onclick="changeNewRoom();" value="Đổi phòng" />
      </div>
    </div>
    <div class="black-background"></div>
  </div>
</c:if>
<script>
  var listResolve = {};
  $(".equipment-type").click(function(){
    var element = document.getElementById("real-equip-" + $(this).attr("value"));

    if(listResolve[$(this).attr("value")] != undefined && listResolve[$(this).attr("value")].status == true) {
      listResolve[$(this).attr("value")].status = false;
      if(element != undefined) {
        element.style.opacity = 0;
        element.style.zIndex = -1;
        element.style.left = "0";
      }
    } else {
      listResolve[$(this).attr("value")] = {cate: $(this).attr("value"), equips: {}, status: true};
      if(element != undefined) {
        element.style.opacity = 1;
        element.style.zIndex = 1;
        element.style.left = "31px";
      }
    }
  });

  showMap('room-map', positionEquipments, ${rt.roomType.verticalRows}, '${rt.roomType.horizontalRows}', '${rt.roomType.numberOfSlotsEachHRows}', ${rt.equipment});
</script>


