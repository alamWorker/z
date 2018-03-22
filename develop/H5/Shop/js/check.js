
//验证手机号码
function is_mobile(str) {
    var reg = /^1[234578]\d{9}$/;
    if (!reg.test(str)) {
        return false;
    }
    return true;
}