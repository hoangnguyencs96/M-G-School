$(btnThemNV).off('click').on('click', function () {
    var username = $('#username').val();
    var password = $('#password').val();
    var repassword = $('#repassword').val();
    var employeeid = $('#employeeid').val();
    var usertype = $('#usertype').val();

    if (username == '' || password == '') {
        alert('Nhập đày đủ thông tin !');
        return;
    }
    if (password != repassword) {
        alert('Mật khẩu không khớp !');
        return;
    }
    if (employeeid == 0) {
        alert('Chọn nhân viên !');
        return;
    }
    $.ajax({
        url: '/Account/AddUser',
        type: 'post',
        dataType: 'json',
        data: { username: username, password: password, employeeid: employeeid, usertype: usertype },
        success: function (res) {
            if (res.status) {
                alert('Thêm thành công !');
                window.location.href = '/Account/Index';
            }
            else {
                alert('Tên đăng nhập đã tồn tại !');
            }
        }
    })
})