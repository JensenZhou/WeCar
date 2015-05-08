/** 用户操作时校验用户是否实名验证通过
    authUrl 校验url
    switchUrl 校验通过后跳转页面的url
    param 校验方法需要传递的参数
    strData  校验通过后跳转页面需要传递的参数
*/
function goValidateAuth(authUrl, switchUrl, param, strData){
	$.post(authUrl, param,function(data) {
		var callBack = data.msg;
		if (callBack != undefined) {
			if(callBack=="1"){
				//未申请实名认证
				 //$.jBox.alert("您还没有进行实名认证！");
				 // 跳转到实名认证页面
				window.location.href = "addInverPersonInit.do";
			}else if(callBack=="2"){
				// 实名认证后，但未验证邮箱
				 var emailAddress = data.emailAddress;
				 var userId = data.userId;									
				 // 邮箱未校验跳转到邮箱验证页面
				 window.location.href = "redirectActiveEmail.do?emaladdresss=" + emailAddress + "&a=" + userId;
			}else{
				 $.jBox.alert(callBack);
			}
		} else{
			window.location.href = switchUrl + strData;
		}
	});
}

var realPwd ="";
var realNewPwd ="";
var realConPwd ="";

function getRealPwd(){
	return realPwd;
}

function setRealPwd(pwd){
	realPwd = pwd;
}

function getRealNewPwd(){
	return realNewPwd;
}

function setRealNewPwd(pwd){
	realNewPwd = pwd;
}

function getRealConPwd(){
	return realConPwd;
}

function setRealConPwd(pwd){
	realConPwd = pwd;
}

/** 校验密码 
 * @param pwd 密码
 * @param confirmPwd 确认密码
 * @param type 类型 0:校验密码 else：校验确认密码
 * */
function validatePWD(pwd, confirmPwd, type){
	var msg = "success";
	if(null == pwd || "" == pwd){
		msg = "密码不能为空！";
		return msg;
	}
	if(pwd.length > 20){
		msg = "密码长度为6-20个字符！";
		return msg;
	}
	if(type != 0 ){
		if(pwd != confirmPwd){
			msg = '两次输入的密码不一致!';
			return msg;
		}
	}
	return msg;
}

/**
 * 对密码加密
 * @param pwd 密码
 * @param userName 用户名
 */
function md5PWD(pwd, userName){
	var sub_length = 17;
	var finalPwd = $.md5(pwd);
	//console.log('第一次MD5加密后的密码：' + finalPwd);
	finalPwd = finalPwd.substr(0,sub_length);
	//console.log("获取MD5加密后的前17位密码：" + finalPwd);
	//console.log("userName : " + userName);
	finalPwd = $.md5(finalPwd + userName);
	//console.log("加密完成后的密码：" + finalPwd);
	return finalPwd;
}

/**
 * 
 * @param passwordId
 * @param userId
 */
function validate(passwordId, userId,code) {		    
	var password = $("#" + passwordId).val();
	setRealPwd(password);
	var userName = $("#" + userId).val();
	var code =$("#" + code).val();
	if(null == password || password.length < 6 || password.length > 20 || null == code || "输入验证码" == code || "" == code){
		return false;
	}
	else{
		var pwd = md5PWD(password, userName);				
		$("#" + passwordId).val(pwd.substr(0,20));
		$("#afterPwd").val(pwd.substr(20,12));
	}
}

/**
 * 出来修改密码
 * 
 * @param passwordId
 * @param newPwdId
 * @param confirmPwdId
 */
function validateEditPwd(passwordId, newPwdId, confirmPwdId) {	
	var flag=validateUpdate();
	var password = $("#" + passwordId).val();
	setRealPwd(password);
	var newPwd = $("#" + newPwdId).val();
	setRealNewPwd(newPwd);
	var confirmPwd = $("#" + confirmPwdId).val();
	setRealConPwd(confirmPwd);
	if(flag){
	var pwd = $.md5(password);
	var newpwd =  $.md5(newPwd);
	var cPwd =  $.md5(confirmPwd);
	$("#" + passwordId).val(pwd.substr(0,20));
	$("#afterPwd").val(pwd.substr(20,12));
	$("#" + newPwdId).val(newpwd.substr(0,20));
	$("#afterNewPwd").val(newpwd.substr(20,12));
	$("#" + confirmPwdId).val(cPwd.substr(0,20));
	$("#afterConPwd").val(cPwd.substr(20,12));
	}
}


/**
 * 校验修改密码输入合法性，合法返回true,否则返回false
 */
function validateUpdate(){
	var oldpwd = $("#oldPassword").val();
	var pwd = $("#newPassword").val();
	var cpwd = $("#confirmPassword").val();
	var cellPhone = $("#cellPhone").val();
	var code = $("#vilidataNum").val();
	var isRead = $("#isRead").val();
	// 校验原密码
	if(null == oldpwd || oldpwd.length < 6 || oldpwd.length > 20){
		return false;
	}
	// 校验密码
	if(null == pwd || pwd.length < 6 || pwd.length > 20){
		return false;
	}
	// 校验确认密码
	if(null == cpwd || cpwd.length < 6 || cpwd.length > 20){
		return false;
	}
	// 密码和确认密码是否相等
	if(pwd != cpwd){
		return false;
	}
	return true;
}

/**
 * 校验重置密码输入合法性，合法返回true,否则返回false
 */
function validateReset(){
	var pwd = $("#password").val();
	var cpwd = $("#confirmpassword").val();
	var cellPhone = $("#cellPhone").val();
	var code = $("#vilidataNum").val();
	// 校验密码
	if(null == pwd || pwd.length < 6 || pwd.length > 20){
		return false;
	}
	// 校验确认密码
	if(null == cpwd || cpwd.length < 6 || cpwd.length > 20){
		return false;
	}
	// 密码和确认密码是否相等
	if(pwd != cpwd){
		return false;
	}
	// 手机号码校验
	if(null == cellPhone || $.trim(cellPhone).length != 11){
		return false;
	}
	// 校验验证码
	if(null == code || code.length !=4){
		return false;
	}
	return true;
}


/**
 * 校验注册信息输入合法性，合法返回true,否则返回false
 */
function validateRegister(){
	var userName = $("#userName").val();
	var pwd = $("#password").val();
	var cpwd = $("#confirmPassword").val();
	//var cellPhone = $("#cellPhone").val();
	var code = $("#code").val();
	// 校验用户名
	if(null == userName || $.trim(userName).length < 6 || $.trim(userName).length > 18){
		return false;
	}
	// 校验密码
	if(null == pwd || pwd.length < 6 || pwd.length > 19){
		return false;
	}
	// 校验确认密码
	if(null == cpwd || cpwd.length < 6 || cpwd.length > 19){
		return false;
	}
	// 密码和确认密码是否相等
	if(pwd != cpwd){
		return false;
	}
	// 手机号码校验
	/*if(null == cellPhone || $.trim(cellPhone).length != 11){
		return false;
	}*/
	// 校验验证码
	if(null == code || code.length !=4 || "" == code){
		return false;
	}
	if(!$("#isRead").attr("checked")){
		return false;
	}
	/*if ($("#termsCheck").attr("class") != "aa_box_y") {
		return false;
	}*/
	return true;
}


/**
 * 处理重置密码
 * 
 * @param passwordId
 * @param confirmPwdId
 */
function validateResetPwd(passwordId,confirmPwdId,type){		    
	var valiFlag = false;
	var password = $("#" + passwordId).val();
	setRealPwd(password);
	var confirmPwd = $("#" + confirmPwdId).val();
	setRealConPwd(confirmPwd);
	if('1' == type){
		valiFlag = validateRegister();
	}else{
		valiFlag = validateReset();
	}
	if(valiFlag){		
		var pwd = $.md5(password);
		var cPwd =  $.md5(confirmPwd);
		$("#" + passwordId).val(pwd.substr(0,20));
		$("#afterPwd").val(pwd.substr(20,12));
		$("#" + confirmPwdId).val(cPwd.substr(0,20));
		$("#afterConPwd").val(cPwd.substr(20,12));
	}
}


