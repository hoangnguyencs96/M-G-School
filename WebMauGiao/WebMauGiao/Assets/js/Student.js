<<<<<<< HEAD
﻿$.formattedDate = function (dateToFormat) {
    var dateObject = new Date(dateToFormat);
    var day = dateObject.getDate();
    var month = dateObject.getMonth() + 1;
    var year = dateObject.getFullYear();
    day = day < 10 ? "0" + day : day;
    month = month < 10 ? "0" + month : month;
    var formattedDate = day + "/" + month + "/" + year;
    return formattedDate;
};

$('#select_Class').on('change', function () {        
    $('#contain_table').hide();
    var classid = $('#select_Class').val();
    if(classid == 0) { return;}
    var month = $('#select_Month').val();
    var year = 0
    if (month <= 6) {
        year = $('select#select_Year option:selected').data('end');
    }
    else {
        year = $('select#select_Year option:selected').data('start');
    }

    var weekday = new Array(7);
    weekday[0] = "CN";
    weekday[1] = "T2";
    weekday[2] = "T3";
    weekday[3] = "T4";
    weekday[4] = "T5";
    weekday[5] = "T6";
    weekday[6] = "T7";
    $('#table-head').empty();
    $('#table-head').append('<tr id="table-head-tr">')
    $('#table-head-tr').append(
                             '<th>Mã</th>' +
                             '<th style="witdh:150px;   ">Họ và tên</th>'
                            );
    var days = new Date(year, month, 0).getDate();
    for (i = 1; i <= days; i++) {
        var x = new Date(year, month - 1, i).getDay();
        $('#table-head-tr').append('<th>Ngày<br>' + i + '(' + weekday[x] + ')</th>');
    }


    $.ajax({
        url: '/Student/GetStudentByClass',
        dataType: 'Json',
        data: { classid: classid },
        type: 'get',
        success: function (data) {

            $('#table-data').empty();
            $.each(data, function (i, item) {
                $('#table-data').append('<tr data-id="' + item.StudentID + '" data-name="' + item.Name + '"></tr>')
                $('tr[data-id = "' + item.StudentID + '"]').append(
                                                                 '<td>' + item.StudentID + '</td>' +
                                                                 '<td>' + item.Name + '</td>');
                $.ajax({
                    url: '/Student/GetAbsence',
                    dataType: 'json',
                    data: { studentid: item.StudentID, month: month, year: year },
                    type: 'get',
                    success: function (data) {
                        var rows = '';
                        var j = 0;
                        var t = data.length;
                        for (i = 1; i <= days; i++) {
                            var date = new Date(year, month - 1, i);
                            var date2 = new Date();
                            if (j < t) { date2 = new Date(parseInt(data[j].Date.substr(6))); }
                            if (date.getTime() == date2.getTime()) {
                                rows += '<td data-date="' + $.formattedDate(date) + '" title="' + data[j].Reasons + '" data-id="' + data[j].AbsenceID + '" data-parent = "' + item.StudentID + '">' + 'x' + '</td>';
                                j++;
                            }
                            else {
                                if (date.getDay() == 0) {
                                    rows += '<td data-date="' + $.formattedDate(date) + '" style="background: #c35454"></td>';
                                }
                                else {
                                    rows += '<td data-date="' + $.formattedDate(date) + '" data-parent = "' + item.StudentID + '"></td>';
                                }
                            }
                        }
                        $('tr[data-id = "' + item.StudentID + '"]').append(rows);
                    }
                })
            })

        }
    })

})
$.wait = function (callback, seconds) {
    return window.setTimeout(callback, seconds * 1000);
}
$('#btn_view').off('click').on('click', function () {
    $.wait(function () {
        $('#dynamic-table').DataTable().destroy();
        $('#dynamic-table').DataTable({ "scrollX": true });
        $('#contain_table').show();
    }, 2);

})

$('#dynamic-table').off('click').on('click', 'td', function () {
    if ($(this).attr('style') == 'background: #c35454') {
        return;
    }
    else {

        $('#ModalAdd').attr('data-date', $(this).data('date'));
        $('#ModalAdd').attr('data-stid', $(this).parent().data('id'));
        $('#modal_title').html('Báo vắng bé ' + $(this).parent().data('name') + ' ngày ' + $(this).data('date'));
        absenceid = document.querySelector('td[data-date="' + $(this).data('date') + '"][data-parent="' + $(this).parent().data('id') + '"]').getAttribute('data-id');
        if (absenceid != null) {
            $('#ModalAdd').attr('data-id', absenceid);
            $('#txt_reason').val($(this).attr('title'));
            $('#btn_update').html('Cập nhật');
            $('#btn_del').show();
        }
        else {
            $('#ModalAdd').removeAttr('data-id');
            $('#btn_del').hide();
            $('#btn_update').html('Báo vắng');
            $('#txt_reason').val("");
        }
        $('#ModalAdd').modal('show');
    }
})

$('#btn_update').off('click').on('click', function () {
    var absenceid = document.getElementById('ModalAdd').getAttribute('data-id');
    var studentid = document.getElementById('ModalAdd').getAttribute('data-stid');
    var date = document.getElementById('ModalAdd').getAttribute('data-date');
    if (absenceid != null) {
        bootbox.confirm({
            size: "small",
            message: "Bạn muốn cập nhật?",
            callback: function (result) {
                if (result) {
                    $.ajax({
                        url: '/Student/UpdateAbsence',
                        type: 'post',
                        dataType: 'json',
                        data: { absenceid: absenceid, studentid: studentid, date: date, reasons: $('#txt_reason').val() },
                        success: function (res) {
                            $('#ModalAdd').modal('hide');
                            $('td[data-date="' + date + '"][data-id ="' + absenceid + '"]').attr('title', $('#txt_reason').val());
                            bootbox.alert({
                                size: "small",
                                title: "Cập nhật",
                                message: "Cập nhật thành công…"
                            });

                        }
                    })
                }
            }
        });
    }
    else {
        bootbox.confirm({
            size: "small",
            message: "Bạn muốn báo vắng ?",
            callback: function (result) {
                if (result) {
                    $.ajax({
                        url: '/Student/AddAbsence',
                        type: 'post',
                        dataType: 'json',
                        data: { studentid: studentid, date: date, reasons: $('#txt_reason').val() },
                        success: function (res) {
                            $('#ModalAdd').modal('hide');
                            $('td[data-date="' + date + '"][data-parent ="' + studentid + '"]').attr('title', $('#txt_reason').val());
                            $('td[data-date="' + date + '"][data-parent ="' + studentid + '"]').append('x');
                            $('td[data-date="' + date + '"][data-parent ="' + studentid + '"]').attr('data-id', res.value);
                            bootbox.alert({
                                size: "small",
                                title: "Báo vắng",
                                message: "Báo vắng thành công…"
                            });

                        }
                    })
                }
            }
        });
    }
})

$('#btn_del').off('click').on('click', function () {
    bootbox.confirm({
        size: "small",
        message: "Bạn muốn xóa?",
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: '/Student/DeleteAbsence',
                    type: 'post',
                    dataType: 'json',
                    data: { absenceid: document.getElementById('ModalAdd').getAttribute('data-id') },
                    success: function (res) {
                        $('#ModalAdd').modal('hide');
                        $('td[data-date="' + document.getElementById('ModalAdd').getAttribute('data-date') + '"][data-parent ="' + document.getElementById('ModalAdd').getAttribute('data-stid') + '"]').html('');
                        $('td[data-date="' + document.getElementById('ModalAdd').getAttribute('data-date') + '"][data-parent ="' + document.getElementById('ModalAdd').getAttribute('data-stid') + '"]').removeAttr('data-id');
                        $('td[data-date="' + document.getElementById('ModalAdd').getAttribute('data-date') + '"][data-parent ="' + document.getElementById('ModalAdd').getAttribute('data-stid') + '"]').removeAttr('title');
                        document.getElementById('ModalAdd').removeAttribute('data-id');
                        $('#txt_reason').val("");
                        bootbox.alert({
                            size: "small",
                            title: "Xóa",
                            message: "Xóa thành công..."
                        });

                    }
                })
            }
        }
    });
})
=======
﻿function LoadInfo(id) {
    $.session.set("CurrentFormID", id);
    $.ajax({
        url: '/Student/GetAStudent',
        data:{ID:id},
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $('#fullname-field').val(data.Name);
            if (data.Sex == true)
                $('#sex-field').val(1);
            else if (data.Sex == false)
                $('#sex-field').val(2);
            $('#dob-field').val(data.DateOfBirth);
            $('#address-field').val(data.Address);
            $('#parent-name').val(data.Parent);
            $('#note-field').val(data.Comment);
            $('#parent-phone').val(data.ParentPhone);
            $('#email-field').val(data.Email);
            $('#folk-field').val(data.Folk);
            var classID = data.ClassID;
            $.ajax({
                url: '/Student/GetAClass',
                data: { ID:classID},
                dataType: 'json',
                type: 'GET',
                success: function (data) {
                    $('#class-field').val(data.Name);
                },
                error: function () {
                    alert("Some errors occured");
                }
            });
        },
        error: function () {
            alert("Some errors occured");
        }
    });

    $.session.set("fullname", true);
    $.session.set("address", true);
    $.session.set("folk", true);
    $.session.set("parentname", true);
    $.session.set("email", true);
}

function CheckParams() {
    var fn = $.session.set("fullname");
    var addr = $.session.set("address");
    var folk = $.session.set("folk");
    var pn = $.session.set("parentname");
    var eml = $.session.set("email");

    if (fn == true && addr == true && folk == true && pn == true && eml == true)
        return true;
    else
        return false;
}

// Ready Function
$(document).ready(function () {
    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    $('#dob-field').val(today);
  
    $.session.set("fullname", false);
    $.session.set("address", false);
    $.session.set("folk", false);
    $.session.set("parentname", false);
    $.session.set("email", false);
    
    $.ajax({
        url: '/Student/GetAllStudents',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            listData = data;
            var displayHTML = "";
            for (let i = 0; i < listData.length; i++) {
                displayHTML += "<tr role=\"button\" class=\"studentDisplay\" id=\"student" + listData[i].StudentID + "\">";
                displayHTML += "<td> " + listData[i].Name + "</td>";
                if (listData[i].Sex == true) {
                    displayHTML += "<td>Nam</td></tr><script>$('#student" + listData[i].StudentID + "').click(function(){ LoadInfo("+listData[i].StudentID+"); });</script>";
                } else {
                    displayHTML += "<td>Nữ</td></tr><script>$('#student" + listData[i].StudentID + "').click(function(){ LoadInfo(" + listData[i].StudentID + "); });</script>";
                }
            }
            $('#list-students-by-class').html(displayHTML);
        },
        error: function () {
            alert("Some errors occured");
        }
    });

});


// Phone Regex
$('.input-mask-phone').mask('(999) 999-9999');

//Load list of students
$('#list-of-class').on('change', function (e) {
    var valueSelected = this.value;
    if (valueSelected != "Tất cả") {
        $.ajax({
            url: '/Student/GetStudentByClass',
            dataType: 'json',
            data: { Name: valueSelected },
            type: 'GET',
            success: function (data) {
                listData = data;
                var displayHTML = "";
                for (let i = 0; i < listData.length; i++) {
                    displayHTML += "<tr role=\"button\"  id=\"student" + listData[i].StudentID + "\">";
                    displayHTML += "<td> " + listData[i].Name + "</td>";
                    if (listData[i].Sex == true) {
                        displayHTML += "<td>Nam</td></tr> <script> $('#student" + listData[i].StudentID + "').click(function(){ LoadInfo(" + listData[i].StudentID + "); });</script>";
                    } else {
                        displayHTML += "<td>Nữ</td></tr> <script> $('#student" + listData[i].StudentID + "').click(function(){ LoadInfo(" + listData[i].StudentID + "); });</script>";
                    }
                }
                $('#list-students-by-class').html(displayHTML);
            },
            error: function () {
                alert("Some errors occured");
            }
        });
    } else {
        $.ajax({
            url: '/Student/GetAllStudents',
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                listData = data;
                var displayHTML = "";
                for (let i = 0; i < listData.length; i++) {
                    displayHTML += "<tr role=\"button\" id=\"student"+listData[i].StudentID+"\">";
                    displayHTML += "<td> " + listData[i].Name + "</td>";
                    if (listData[i].Sex == true) {
                        displayHTML += "<td>Nam</td></tr> <script> $('#student" + listData[i].StudentID + "').click(function(){ LoadInfo(" + listData[i].StudentID + "); });</script>";
                    } else {
                        displayHTML += "<td>Nữ</td></tr> <script> $('#student" + listData[i].StudentID + "').click(function(){ LoadInfo(" + listData[i].StudentID + "); });</script>";
                    }
                }
                $('#list-students-by-class').html(displayHTML);
            },
            error: function () {
                alert("Some errors occured");
            }
        });
    }
});

// Field add and regex checking
//$('#religious-field').on('change', function (e) {
//    var valueSelected = this.value;
//    if (valueSelected == 2) {
//        var displayHTML = "";
//        displayHTML = "<input type=\"text\" id=\"add-religious\" placeholder=\"Nhập tôn giáo...\" style=\"width:387px;height:30px;\" /> <script> $(\"#add-religious\").keyup(function (e) { var str = this.value; var patt = new RegExp(\"^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$\"); var res = patt.test(str);if (res == true) { $('#add-religious').css(\"border\", \"2px solid green\");} else {$('#add-religious').css(\"border\", \"2px solid red\");}}); </script>";
//        $('#religious-container').html(displayHTML);
//    } else if (valueSelected==1){
//        var displayHTML = "";
//        $('#religious-container').html(displayHTML);
//    }
//});


$('#submit-action').on('click', function (e) {
    var hoten = $('#fullname-field').val();
    var diachi = $('#address-field').val();
    var ngaysinh = $('#dob-field').val();
    var dantoc = $('#folk-field').val();
    var tenlop = $('#class-field').val();
    var tenbo = $('#parent-name').val();
    var sodtbo = $('#parent-phone').val();
    var email = $('#email-field').val();
    var note = $('#note-field').val();
    alert($.session.get("CurrentFormID"));
});

$("#fullname-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#fullname-field').css("border", "2px solid green");
        $.session.set("fullname", true);
    } else {
        $('#fullname-field').css("border", "2px solid red");
        $.session.set("fullname", false);
    }
});

$("#email-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$");
    var res = patt.test(str);
    if (res == true) {
        $('#email-field').css("border", "2px solid green");
        $.session.set("email", true);
    } else {
        $('#email-field').css("border", "2px solid red");
        $.session.set("email", false);
    }
});

$("#parent-name").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#parent-name').css("border", "2px solid green");
        $.session.set("parentname", true);
    } else {
        $('#parent-name').css("border", "2px solid red");
        $.session.set("parentname", false);
    }
});

$("#folk-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#folk-field').css("border", "2px solid green");
        $.session.set("folk", true);
    } else {
        $('#folk-field').css("border", "2px solid red");
        $.session.set("folk", false);
    }
});

$("#address-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-Z0-9-ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#address-field').css("border", "2px solid green");
        $.session.set("address", true);
    } else {
        $('#address-field').css("border", "2px solid red");
        $.session.set("address", false);
    }
});
>>>>>>> 742d03454a6ef64d1725900bd232e7c99d65f08f
