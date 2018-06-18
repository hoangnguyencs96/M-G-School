function LoadInfo(id) {
    $.session.set("CurrentFormID", id);
    $.ajax({
        url: '/Student/GetAStudent',
        data:{ID:id},
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            $('#fullname-field').val(data.Name);
            $('#dob-field').val(data.DateOfBirth);
            $('#address-field').val(data.Address);
            $('#parent-name').val(data.Parent);
            $('#parent-phone').val(data.ParentPhone);
        },
        error: function () {
            alert("Some errors occured");
        }
    });

}


// Ready Function
$(document).ready(function () {
    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    $('#dob-field').val(today);

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
$('#religious-field').on('change', function (e) {
    var valueSelected = this.value;
    if (valueSelected == 2) {
        var displayHTML = "";
        displayHTML = "<input type=\"text\" id=\"add-religious\" placeholder=\"Nhập tôn giáo...\" style=\"width:387px;height:30px;\" /> <script> $(\"#add-religious\").keyup(function (e) { var str = this.value; var patt = new RegExp(\"^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$\"); var res = patt.test(str);if (res == true) { $('#add-religious').css(\"border\", \"2px solid green\");} else {$('#add-religious').css(\"border\", \"2px solid red\");}}); </script>";
        $('#religious-container').html(displayHTML);
    } else if (valueSelected==1){
        var displayHTML = "";
        $('#religious-container').html(displayHTML);
    }
});


$('#submit-action').on('click', function (e) {
    var hoten = $('#fullname-field').val();
    var ngaysinh = $('#dob-field').val();
    var doitguutien = $('#priority-field').val();
    var diachi = $('#address-field').val();
    var dantoc = $('#folk-field').val();
    var tenlop = $('#class-field').val();
    var tongiaosel = $('#religious-field').val();
    var tongiao=""
    if (tongiaosel == 1) {
        tongiao="Không"
    } else if(tongiaosel==2) {
        tongiao = $('#add-religious').val();
    }
    var tenbo = $('#parent-name').val();
    var sodtbo = $('#parent-phone').val();
    var email = $('#email-field').val();
    var note = $('#note-field').val();
    $('#note-field').css("background-color", "#ed7e7e");
    $('#note-field').css("background-color", "");
    alert($.session.get("CurrentFormID"));
});

$("#fullname-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#fullname-field').css("border", "2px solid green");
    } else {
        $('#fullname-field').css("border", "2px solid red");
    }
});

$("#email-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$");
    var res = patt.test(str);
    if (res == true) {
        $('#email-field').css("border", "2px solid green");
    } else {
        $('#email-field').css("border", "2px solid red");
    }
});

$("#parent-name").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#parent-name').css("border", "2px solid green");
    } else {
        $('#parent-name').css("border", "2px solid red");
    }
});

$("#folk-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#folk-field').css("border", "2px solid green");
    } else {
        $('#folk-field').css("border", "2px solid red");
    }
});

$("#address-field").keyup(function (e) {
    var str = this.value;
    var patt = new RegExp("^[a-zA-Z0-9-ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẦẤẨẪẬẰẮẲẴẶẸẺẼỀẾỂưăạảầấẩẫậằắẳẵặẹẻẽềếểỄỆỈỊỌỎỒỐỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏồốổỗộớờởỡợựủừứỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$");
    var res = patt.test(str);
    if (res == true) {
        $('#address-field').css("border", "2px solid green");
    } else {
        $('#address-field').css("border", "2px solid red");
    }
});