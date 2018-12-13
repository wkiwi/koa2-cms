var code = false;
toastr.options = {
  "closeButton": true,
  "debug": true,
  "progressBar": false,
  "positionClass": "toast-top-center",
  "showDuration": "400",
  "hideDuration": "1000",
  "timeOut": "2000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
function showToastr(type,title,content){
  toastr[type](content,title)
}
$(function(){
  /*-- 输入框失去焦点事件监听开始 --*/
  $('.input').each(function(){
    $(this).on('blur', function(){
      let name = $(this).context.name;
      if($(this).val().trim() != "") {
        if (hasSpecialCharacter($(this).val().trim())) {
          code = false;
          showToastr('error','错误提示','不能包含有特殊字符！！！');
          return false;
        } else if (isEmojiCharacter($(this).val().trim())) {
          code = false;
          showToastr('error','错误提示','不能包含有表情字符！！！');
          return false;
        } else {
          // if($('[name="pass_word"]').val().trim()&&$('[name="pass_word"]').val().trim().length>5){
            if($('[name="pass_word"]').val().trim() && $('[name="r_pass_word"]').val().trim()){
              if($('[name="pass_word"]').val().trim()!=$('[name="r_pass_word"]').val().trim()) {
                code = false;
                showToastr('error','错误提示','两次密码不一致！！！');
                return false;
              } else {
                code = true;
                return true;
              }
            }
          // }else {
          //   code = false;
          //   showToastr('error','错误提示','密码至少6位！');
          //   return false;
          // }
        }
      } else {
        code = false;
        name=="user_name"?showToastr('error','错误提示','用户名不能为空'):name=="pass_word"?showToastr('error','错误提示','密码不能为空'):name=="user_email"?showToastr('error','错误提示','邮箱不能为空'):name=="code"?showToastr('error','错误提示','验证码不能为空'):''; 
      }
    })    
  })
  /*-- 输入框失去焦点事件监听结束 --*/
  function r_check(){
    if($('[name="user_name"]').val().trim()!="" && $('[name="r_pass_word"]').val().trim()!="" && $('[name="pass_word"]').val().trim()!="" && $('[name="user_email"]').val().trim()!="" && $('[name="code"]').val().trim()!="") {
      return true;
    }else {
      showToastr('error','错误提示','表单信息不全')
      return false;
    }
  }
  function hasSpecialCharacter(value){
    let reg = /[~#^$%&!?%*]/gi;
    if(reg.test(value)){ // 判断是否包含特殊字符
      return true;
    }else {
      return false;
    }
  }
  function isEmojiCharacter(substring) { //检查是否位特殊字符
    for (var i = 0; i < substring.length; i++) {
      var hs = substring.charCodeAt(i);
      if (0xd800 <= hs && hs <= 0xdbff) {
        if (substring.length > 1) {
          var ls = substring.charCodeAt(i + 1);
          var uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
          if (0x1d000 <= uc && uc <= 0x1f77f) {
            return true;
          }
        }
      } else if (substring.length > 1) {
        var ls = substring.charCodeAt(i + 1);
        if (ls == 0x20e3) {
          return true;
        }
      } else {
        if (0x2100 <= hs && hs <= 0x27ff) {
          return true;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
          return true;
        } else if (0x2934 <= hs && hs <= 0x2935) {
          return true;
        } else if (0x3297 <= hs && hs <= 0x3299) {
          return true;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
          return true;
        }
      }
    }
  }

})