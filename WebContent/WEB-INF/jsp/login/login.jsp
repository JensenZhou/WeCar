<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>XX金融</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" language="javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" language="javascript" src="js/xuanxiang_duoge.js"></script>
<script type="text/javascript" language="javascript" src="js/navigation_cur.js"></script>
<script type="text/javascript" src="js/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="js/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="js/frontCommon.js"></script>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/member.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--返回顶部开始-->
<div class="ReturnTop">
<a href="javascript:void(0);" id="qq" title="在线客服"><img src="images/ReturnTop2.png" width="54" height="54" /></a>
<a href="javascript:void(0);" class="wechat" title="官方微信"><img src="images/ReturnTop1.png" width="54" height="54" /></a>

<a href="javascript:void(0);" id="ScrollUp" style="display:none;" title="返回顶部"><img src="images/ReturnTop4.png" width="54" height="54" /></a>
<img class="wechat_img" src="images/weixin.png">
</div>
<script type="text/javascript" language="javascript">
$(function(){
	 var $bottomTools = $('.ReturnTop');
	    var $qrTools = $('.wechat');
	    var qrImg = $('.wechat_img');
	    $(window).scroll(function() {
	        var scrollHeight = $(document).height();
	        var scrollTop = $(window).scrollTop();
	        var $windowHeight = $(window).innerHeight();
	        scrollTop > 100 ? $("#ScrollUp").fadeIn(200).css("display", "block") : $("#ScrollUp").fadeOut(200);
	        $bottomTools.css("bottom", scrollHeight - scrollTop > $windowHeight ? 54 : $windowHeight + scrollTop + 54 - scrollHeight);
	    });
	    $('#ScrollUp').click(function(e) {
	        e.preventDefault();
	        $('html,body').animate({scrollTop: 0});
	    });
	    $qrTools.hover(function() {
	        qrImg.fadeIn();
	    }, function() {
	        qrImg.fadeOut();
	    });
$("#qq").click(function(){
	window.open("http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODAzOTA2NF84MDg1Nl80MDA2OTk4NjY2XzJf");
});
});
function load(){
	$.post("home.html");
	$.post("helpIndex.html");
}
function loginBBS(){
	window.open("loginBBS.do","_blank");				 
}
</script>
<!--返回顶部结束-->

<!--头部开始-->
<div class="login_registration_head">
<div class="container">
<div class="logo"><a href="/" title="XX金融"><img src="images/logo.png" title="XX金融" alt="XX金融" /></a></div>
<div class="clear"></div>
</div>
</div>
<!--头部结束-->
</body>
</html>

<link href="css/valiform.css" rel="stylesheet" type="text/css" />

<!--中部开始-->
<div class="wrapper">
	<div class="login_wrapper"
		style="background:url(images/login_wrapper_bg_01.jpg) no-repeat center top;">
		<div class="container">
			<div class="login">
				<form:form action="login.do" method="post" id="loginForm" commandName="loginForm">
					<ul>
						<li><span class="span1">用户登录</span></li>
						<li><span class="span2" id="displayInfo" style="margin:0px; padding:0px; height:auto; line-height:12px;"></span></li>
						<li>
						<form:input path="user_name" cssClass="input_text input_text1"/>
						<form:errors path="user_name" cssStyle="color:red;font-weight: bold;"/>
						</li>
						<li>
						<form:password path="password" cssClass="input_text input_text2"/>
						<form:errors path="password" cssStyle="color:red;font-weight: bold;"/>
						</li>
						
						<!-- <li>
							<input name="paramMap.code" type="text" id="code" maxlength="4" nullmsg="请输入验证码" datatype="n4-4"
							value="输入验证码" onblur="if(this.value==''){this.value='输入验证码'};" onfocus="if(this.value=='输入验证码'){this.value='';};this.select();"
									errormsg="请输入正确的验证码" class="input_text"style="float:left; border:solid 1px #E4E4E4; width:110px; padding-left:10px;" />
									<input name="paramMap.pageId" type="hidden" value="userlogin" />
								<a href="javascript:switchCode();" style="float:left; margin-left:5px; margin-top:6px;"><img id="codeNum" height="30" /></a>
						</li> -->
						
						<li><input id="btn_login" type="submit" value="立即登录"
							class="yellow_button" />
						</li>
						<li>
							<table border="0" cellspacing="0" cellpadding="0" width="100%">
								<tr>
									<td>
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><input id="remember_name" type="checkbox" value="" />
												</td>
												<td class="padding_left">记住帐号</td>
											</tr>
										</table></td>
									<td align="right">
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><a href="resetPasswordIndex.html" class="blue_a"
													title="忘记密码？">忘记密码？</a>
												</td>
											</tr>
										</table></td>
								</tr>
							</table></li>
						<li>没有帐号？<a href="regIndex.html" class="blue_a" title="免费注册">免费注册</a>
						</li>
						<li>
							<table border="0" cellspacing="0" cellpadding="0" align="right">
								<tr>
									<td><img src="images/qq_01.png" width="16" height="16" />
									</td>
									<td><a href="qqLogin.do" onmouseout="MM_swapImgRestore()" class="padding_left"
										title="QQ登录">QQ登录</a>
									</td>
									<td style="padding-left:20px;"><img
										src="images/sina_01.png" width="16" height="16" />
									</td>
									<td><a href="weiboLogin.do" onmouseout="MM_swapImgRestore()" class="padding_left"
										title="微博登录">微博登录</a>
									</td>
								</tr>
							</table></li>
					</ul>
				</form:form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!--中部结束-->

		<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/jquery.md5.js"></script>
		<script type="text/javascript" src="js/front/frontCommon.js"></script>
		<script type="text/javascript">
		function switchCode() {
			var timenow = new Date();
			$("#codeNum").attr("src", "dibms/imageCode.do?pageId=userlogin&d=" + timenow);
		}
		
		$(function(){
			switchCode();
			if($.cookie("dib_user_name")==undefined){
				$("#email").val("用户名/邮箱/手机号");
			}else{
				$("#email").val($.cookie("dib_user_name"));
			}
			$("#btn_login").keyup(function(e) {
				if(e.keyCode== 13){
					$("#btn_login").click();
				}
			});
			
			//框架验证
			$("#editForm").Validform({
				postonce:true,
				ajaxPost:true,
				tiptype:function(msg,o,cssctl){
					var objtip=$("#displayInfo");
					cssctl(objtip,o.type);
					if(msg=="登录成功"){
						objtip.html("<font color='#18B160'>"+msg+"</font>");
					}else{
						objtip.text(msg);
					}
				},
				callback:function(data){
					//返回数据data是json对象，{"info":"demo info","status":"y"}
					if(data.status=='y'){
						if($("#remember_name").attr("checked")=="checked"){
							$.cookie("dib_user_name",$("#email").val(),{ expires: 7 });
							switchCode();
						}
						if(data.code==1){
							var afterLoginUrl = '';
							if (afterLoginUrl != '') {
								window.location.href = '';
							} else {
								window.location.href = 'home.html';
							}
						} /*else if(data.code == 2){
							window.location.href = 'addInverPersonInit.html?paramMap.isShow=1';
						}else if(data.code==3){
							//验证邮箱
			       			var indx = (data.mailAddress).indexOf('-');
							var AA = (data.mailAddress).substring(indx + 1);
							var m = (data.mailAddress).substring(0, indx);
							window.location.href = "redirectActiveEmail.do?emaladdresss=" + m + "&a=" + AA;
							
						}*/
						else{
							window.location.href = 'home.html';
						}
					}else{
						$("#passwordId").val(getRealPwd());
						switchCode();
					}
				}
			});
			$.Tipmsg.r = "";
			
		});
		</script>

<link href="style/member.css" rel="stylesheet" type="text/css" />
<html>
  <body>
 
<!--底部开始-->
<div class="login_foot">
<div class="container">
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td align="center">
<table border="0" cellspacing="0" cellpadding="5">
<tr>
<td><a href="aboutUs.html" title="关于我们">关于我们</a></td>
<td>|</td>
<td><a href="aboutUs.html#contactus" title="联系我们">联系我们</a></td>
<td>|</td>
<td><a href="security.html" title="安全保障">安全保障</a></td>
<td>|</td>
<td><a href="helpIndex.html" title="帮助中心">帮助中心</a></td>
<td>|</td>
<td><a href="sitemap.html" title="网站地图">网站地图</a></td>
</tr>
</table>
</td>
</tr>
<tr>
<td align="center">
<table border="0" cellspacing="0" cellpadding="5">
<tr>
<td>版权所有©XX金融金融服务有限公司　备案号：粤ICP备13075570号-1</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</div>
<!--底部结束-->
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-54191212-1', 'auto');
  ga('send', 'pageview');
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F8283eaf12a90d07094bbd0a4a04652a9' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_1253722559' style='display:none;' %3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1253722559%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
</script>
  </body>
</html>

</body>
</html>
