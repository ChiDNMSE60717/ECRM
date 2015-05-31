/**
 * Created by Htang on 5/30/2015.
 */
function showClassroomMap(roomname, mapId, vrows, sDayNgang, sChoNgoi, mayLanh, quat, projector, loa, tivi) {
    var a = document.get
    //add roomname
    document.getElementById('roomname').innerHTML = "Ph�ng" + roomname;
    //
    var horizontalRows = sDayNgang.split('-');
    var noSlotsEachRows = sChoNgoi.split('-');
    var classroommap = document.getElementsByClassName('classroom-map')[0];

    while (classroommap.hasChildNodes()) {
        classroommap.removeChild(classroommap.lastChild);
    }

    generateMap(classroommap, horizontalRows, noSlotsEachRows, mapId, vrows, mayLanh, quat, projector, loa, tivi);
}
