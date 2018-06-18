function LoadInfo(id) {
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