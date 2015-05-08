<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
XX金融-P2P投资理财,网络借贷平台,专业P2P网贷平台</title>
<meta name="keywords" content="如何投资理财,网络贷款,网贷平台,P2P网贷,投资,理财,XX金融" />
<meta name="description" content="国内首批由第三方做资金托管账户的P2P网" />
<meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">

<!--顶部状态栏 开始-->
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/xuanxiang_duoge.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/navigation_cur.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/frontCommon.js"></script>

<link href="<%=request.getContextPath()%>/css/public.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/member.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="http://www.dib66.com/favicon.ico"/>
</head>

<body>
<!--返回顶部开始-->
<div class="ReturnTop">
<a href="javascript:void(0);" id="qq" title="在线客服"><img src="<%=request.getContextPath()%>/images/ReturnTop2.png" width="54" height="54" /></a>
<a href="javascript:void(0);" class="wechat" title="官方微信"><img src="<%=request.getContextPath()%>/images/ReturnTop1.png" width="54" height="54" /></a>
<!--<a href="financetool.html" title="计算器"><img src="<%=request.getContextPath()%>/images/ReturnTop3.png" width="54" height="54" /></a>-->
<a href="javascript:void(0);" id="ScrollUp" style="display:none;" title="返回顶部"><img src="<%=request.getContextPath()%>/images/ReturnTop4.png" width="54" height="54" /></a>
<img class="wechat_img" src="<%=request.getContextPath()%>/images/weixin.png">
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
		$.post("helpIndex.html");
	}
	function loginBBS(){
		window.open("loginBBS.do","_blank");				 
	}
</script>
<!--返回顶部结束-->


<!--头部开始-->
<div class="head">
<div class="servicebar_loginbar">
<div class="container">
<div class="servicebar">
<div class="hotline">客服热线：4006-888-888</div>
<div class="attention">
<ul>
<li><div class="attention_text">关注我们：</div></li>
<li><a href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODAzOTA2NF84MDg1Nl80MDA2OTk4NjY2XzJf" target="_blant" class="qq" title="QQ"></a></li>
<li><a href="http://weibo.com/dibiao66" target="_blant" class="sina" rel="nofollow" title="微博"></a></li>
<li><a href="javascript:void(0);" class="wechat" title="微信"><img src="<%=request.getContextPath()%>/images/wechat_02.png" width="120" height="130" /></a></li>
</ul>
</div>
</div>
<div class="loginbar">
<ul>
<!--<li onclick="javascript:window.location.href='inviteRewardsDetail.do'" class="li_first" style="cursor:pointer;">
<table border="0" cellspacing="0" cellpadding="0" height="40">
<tr>
<td><a href="inviteRewardsDetail.do" title="邀请好友">邀请好友</a></td>
<td style="padding-left:5px;"><img src="<%=request.getContextPath()%>/images/invite_rewards_15.png" /></td>
</tr>
</table>
</li>-->
	<li><a href="operationalGuidelines.html" title="新手指引">新手指引</a></li>
	<li><a href="helpIndex.html" title="帮助">帮助</a></li>
	<c:choose>
		<c:when test="${loginUser!=null && loginUser.user_name!=null }">
			<li><a href="../home.do" class="registration" title="${loginUser.user_name }">${loginUser.user_name }</a></li>
			<li><a href="../logout.do" class="login" title="退出">退出</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="../toRegister.do" class="registration" title="免费注册">免费注册</a></li>
			<li><a href="../toLogin.do" class="login" title="立即登录">立即登录</a></li>
		</c:otherwise>
	</c:choose>
	
</ul>
</div>
<div class="clear"></div>
</div>
</div>
<div class="logo_navigation">
<div class="container">
<div class="logo"><a href="/" title="XX金融"><img src="<%=request.getContextPath()%>/images/logo.png" width="400" height="50" title="XX金融" alt="XX金融" /></a></div>
<div class="navigation">
<ul>
<li><a href="/" id="navigation_01" title="首页">首页</a></li>
<li><a href="/" title="我要借款">我要借款</a></li>
<li><a href="security.html" id="navigation_02" title="安全保障">安全保障</a></li>
<li><a href="aboutUs.html" id="navigation_03" title="关于我们">关于我们</a></li>
<li><a href="javascript:void(0);" onclick="loginBBS();" title="论坛">论坛</a></li>
<li><a href="home.html" id="navigation_04" title="我的账户">我的账户</a></li>
</ul>
<div class="i_investment"><a href="debit/debitList.do" title="我要投资">我要投资</a></div>
</div>
<div class="clear"></div>
</div>
</div>
</div>
<!--头部结束-->


<!--中部开始-->
<script type="text/javascript" language="javascript">SetClassName("navigation_01","cur");</script>
<div class="wrapper" style="background:none;">
<div class="container">
<div class="index_container">
<div class="first_floor margin_top">
<div class="left">
<!--投资列表    开始-->
<div class="investment_list margin_top">
<div class="title">
<div class="title_left">
<table border="0" cellspacing="0" cellpadding="0" height="47">
<tr>
<td><img src="<%=request.getContextPath()%>/images/index_05.jpg" width="30" height="47" /></td>
<td><span class="biaoti">投资列表</span></td>
</tr>
</table>
</div>
<div class="title_right"><a href="investList.html" title="更多>>" class="yellow_a">更多>></a></div>
</div>
<div class="content">
			<h3>
			<span class="borrowing_name">借款名称</span>
			<span class="interest_rate">年利率</span>
			<span class="money">借款金额</span>
			<span class="term">借款期限</span>
			<span class="speed_progress">借款进度</span>
			<span class="operation">操作</span>
			</h3>
	<ul>
		<li>
						<div class="borrowing_name">
						<div class="name"><a href="borrow-1119.html" title="房产抵押DIB201504200002">房产抵押DIB201504200002</a></div>
						<div style="display:none;">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
									<td style="padding-left:5px;">
										和汇投资担保</td>
								</tr>
							</table>
						</div>
						</div>
						<div class="interest_rate" style="position:relative; overflow:visible;">
							<span class="span1">18.00</span>%	
										</div>
						<div class="money"><span class="span1">1,200,000</span>元</div>
						<div class="term"><span class="span1">6</span>个月</div>
						<!-- 投资进度条     开始 --> 
						<div class="speed_progress"  id="myStat1"></div>
						<!-- 投资进度条     结束 -->
						
						<div class="operation">
							<a href="borrow-1119.html" class="activation" title="立即投资">立即投资</a>
							</div>
					</li>
				<li>
						<div class="borrowing_name">
						<div class="name"><a href="borrow-1138.html" title="企业过桥DIB201504200003">企业过桥DIB201504200003</a></div>
						<div style="display:none;">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
									<td style="padding-left:5px;">
										和汇投资担保</td>
								</tr>
							</table>
						</div>
						</div>
						<div class="interest_rate" style="position:relative; overflow:visible;">
							<span class="span1">15.00</span>%	
										</div>
						<div class="money"><span class="span1">1,200,000</span>元</div>
						<div class="term"><span class="span1">1</span>个月</div>
						<!-- 投资进度条     开始 --> 
						<div class="speed_progress"  id="myStat2"></div>
						<!-- 投资进度条     结束 -->
						
						<div class="operation">
							<a href="borrow-1138.html" class="activation" title="立即投资">立即投资</a>
							</div>
					</li>
				<li>
						<div class="borrowing_name">
						<div class="name"><a href="borrow-1137.html" title="企业过桥DIB201504200001">企业过桥DIB201504200001</a></div>
						<div style="display:none;">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
									<td style="padding-left:5px;">
										和汇投资担保</td>
								</tr>
							</table>
						</div>
						</div>
						<div class="interest_rate" style="position:relative; overflow:visible;">
							<span class="span1">15.00</span>%	
										</div>
						<div class="money"><span class="span1">1,200,000</span>元</div>
						<div class="term"><span class="span1">1</span>个月</div>
						<!-- 投资进度条     开始 --> 
						<div class="speed_progress"  id="myStat3"></div>
						<!-- 投资进度条     结束 -->
						
						<div class="operation">
							<a href="borrow-1137.html" class="shield" title="还款中">还款中</a>
								<span class="span2">04.20 11:21售完</span>
							</div>
					</li>
				<li>
						<div class="borrowing_name">
						<div class="name"><a href="borrow-1136.html" title="企业过桥DIB201504190005">企业过桥DIB201504190005</a></div>
						<div style="display:none;">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
									<td style="padding-left:5px;">
										和汇投资担保</td>
								</tr>
							</table>
						</div>
						</div>
						<div class="interest_rate" style="position:relative; overflow:visible;">
							<span class="span1">15.00</span>%	
										</div>
						<div class="money"><span class="span1">1,200,000</span>元</div>
						<div class="term"><span class="span1">1</span>个月</div>
						<!-- 投资进度条     开始 --> 
						<div class="speed_progress"  id="myStat4"></div>
						<!-- 投资进度条     结束 -->
						
						<div class="operation">
							<a href="borrow-1136.html" class="shield" title="还款中">还款中</a>
								<span class="span2">04.20 09:32售完</span>
							</div>
					</li>
				</ul>

</div>
</div>
<!-- 投资列表   结束 -->

<!--进度条脚本开始-->
<script type="text/javascript" src="script/echarts-plain.js"></script>
<script type="text/javascript" language="javascript">


/*-------------顶端lable样式----开始---------*/
var labelTop = {
	    normal : {
	        label : { show : false, position : 'center',
	            textStyle: { baseline : 'bottom' }
	        },
	        labelLine : { show : false }
	    }
	};

/*-------------顶端lable样式----结束---------*/
/*-------------底端lable样式----开始---------*/
 var labelBottom= {
	    normal : {
	        color: '#ccc',
	        label : {
	            show : true,
	            position : 'center',
	            formatter : function (a,b,c){return 100 - c + '%'},
	            textStyle: {
	                baseline : 'middle',color:'#000'
	            }
	        },
	        labelLine : {
	            show : false
	        }
	    },
	    emphasis: {
	        color: 'rgba(0,0,0,0)'
	    }
	};

/*-------------底端lable样式----结束---------*/

//设置圆圈的内外半径
	var radius = [18, 22];
	
/*-------------循环  开始-----------*/	

/*-------------圆圈数据绑定----开始---------*/
	option1 = {
	    legend: {
	        x : 'center',
	        y : 'center',
	        data:[
	         
	        ]
	    },
	    title : {
	        
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            
	        }
	    },
	    series : [
	        {
	            type : 'pie',
	            center : ['50%', '50%'],
	            radius : radius,
	            data : [
                    {value:6,itemStyle : labelTop},
	                {value:94, itemStyle : labelBottom}
	            ]
	        }
	    ]
	};
	//为指定对象绑定插件效果
	 echarts.init(document.getElementById("myStat1")).setOption(option1);
/*-------------圆圈数据绑定----结束---------*/


/*-------------圆圈数据绑定----开始---------*/
	option2 = {
	    legend: {
	        x : 'center',
	        y : 'center',
	        data:[
	         
	        ]
	    },
	    title : {
	        
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            
	        }
	    },
	    series : [
	        {
	            type : 'pie',
	            center : ['50%', '50%'],
	            radius : radius,
	            data : [
                    {value:37,itemStyle : labelTop},
	                {value:63, itemStyle : labelBottom}
	            ]
	        }
	    ]
	};
	//为指定对象绑定插件效果
	 echarts.init(document.getElementById("myStat2")).setOption(option2);
/*-------------圆圈数据绑定----结束---------*/


/*-------------圆圈数据绑定----开始---------*/
	option3 = {
	    legend: {
	        x : 'center',
	        y : 'center',
	        data:[
	         
	        ]
	    },
	    title : {
	        
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            
	        }
	    },
	    series : [
	        {
	            type : 'pie',
	            center : ['50%', '50%'],
	            radius : radius,
	            data : [
                    {value:100,itemStyle : labelTop},
	                {value:0, itemStyle : labelBottom}
	            ]
	        }
	    ]
	};
	//为指定对象绑定插件效果
	 echarts.init(document.getElementById("myStat3")).setOption(option3);
/*-------------圆圈数据绑定----结束---------*/


/*-------------圆圈数据绑定----开始---------*/
	option4 = {
	    legend: {
	        x : 'center',
	        y : 'center',
	        data:[
	         
	        ]
	    },
	    title : {
	        
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            
	        }
	    },
	    series : [
	        {
	            type : 'pie',
	            center : ['50%', '50%'],
	            radius : radius,
	            data : [
                    {value:100,itemStyle : labelTop},
	                {value:0, itemStyle : labelBottom}
	            ]
	        }
	    ]
	};
	//为指定对象绑定插件效果
	 echarts.init(document.getElementById("myStat4")).setOption(option4);
/*-------------圆圈数据绑定----结束---------*/


/*-------------循环  结束-----------*/	


</script>
<!--进度条脚本结束-->



<!--债权转让   开始-->
<div class="creditor_list margin_top">
<div class="title">
<div class="title_left">
<table border="0" cellspacing="0" cellpadding="0" height="47">
<tr>
<td><img src="<%=request.getContextPath()%>/images/index_06.jpg" width="30" height="47" /></td>
<td><span class="biaoti">债权转让</span></td>
</tr>
</table>
</div>
<div class="title_right"><a href="creditorList.html" title="更多>>" class="yellow_a">更多>></a></div>
</div>
<div class="content">
<h3>
<span class="borrowing_name">债权名称</span>
<span class="interest_rate">实际收益率</span>
<span class="money">转让金额</span>
<span class="term">剩余期限</span>
<span class="operation">操作</span>
</h3>

<ul>
	<li>
			<div class="borrowing_name">
			<div class="name"><a href="creditorBuyDetail.html?creditorId=1436" title="房产抵押DIB201503060002">房产抵押DIB201503060002</a></div>
			<div style="display:none;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
						<td style="padding-left:5px;">
							和汇投资担保</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="interest_rate"><span class="span1">19.46</span>%</div>
			<div class="money"><span class="span1">3019.13</span>元</div>
			<div class="term">
			<!-- 当债权剩余期限小于一个月时 显示天数 -->
									<span class="span1">5</span>个月
									 </div>
			
			<div class="operation">
			
				<a href="creditorBuyDetail.html?creditorId=1436" class="shield" title="已转让">已转让</a>
					<span class="span2">04.20 10:00转让</span>
				</div>
		</li>
		<li>
			<div class="borrowing_name">
			<div class="name"><a href="creditorBuyDetail.html?creditorId=1435" title="房产抵押DIB201503100001">房产抵押DIB201503100001</a></div>
			<div style="display:none;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
						<td style="padding-left:5px;">
							和汇投资担保</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="interest_rate"><span class="span1">19.40</span>%</div>
			<div class="money"><span class="span1">2995.75</span>元</div>
			<div class="term">
			<!-- 当债权剩余期限小于一个月时 显示天数 -->
									<span class="span1">5</span>个月
									 </div>
			
			<div class="operation">
			
				<a href="creditorBuyDetail.html?creditorId=1435" class="shield" title="已转让">已转让</a>
					<span class="span2">04.20 10:00转让</span>
				</div>
		</li>
		<li>
			<div class="borrowing_name">
			<div class="name"><a href="creditorBuyDetail.html?creditorId=1434" title="房产抵押DIB201504020006">房产抵押DIB201504020006</a></div>
			<div style="display:none;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
						<td style="padding-left:5px;">
							和汇投资担保</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="interest_rate"><span class="span1">19.23</span>%</div>
			<div class="money"><span class="span1">20259.71</span>元</div>
			<div class="term">
			<!-- 当债权剩余期限小于一个月时 显示天数 -->
									<span class="span1">6</span>个月
									 </div>
			
			<div class="operation">
			
				<a href="creditorBuyDetail.html?creditorId=1434" class="shield" title="已转让">已转让</a>
					<span class="span2">04.19 20:03转让</span>
				</div>
		</li>
		<li>
			<div class="borrowing_name">
			<div class="name"><a href="creditorBuyDetail.html?creditorId=1433" title="房产抵押DIB201502170008">房产抵押DIB201502170008</a></div>
			<div style="display:none;">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="<%=request.getContextPath()%>/upload/images/hehui.png" /></td>
						<td style="padding-left:5px;">
							和汇投资担保</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="interest_rate"><span class="span1">20.06</span>%</div>
			<div class="money"><span class="span1">10096.08</span>元</div>
			<div class="term">
			<!-- 当债权剩余期限小于一个月时 显示天数 -->
									<span class="span1">4</span>个月
									 </div>
			
			<div class="operation">
			
				<a href="creditorBuyDetail.html?creditorId=1433" class="shield" title="已转让">已转让</a>
					<span class="span2">04.19 20:00转让</span>
				</div>
		</li>
		</ul>
</div>
</div>
<!-- 债权转让结束 -->
</div>
<div class="right margin_left">
<!--投资风云榜-->
<div class="billboard margin_top" style="display: none">
<div class="title">
<div class="title_left">
<span class="biaoti">投资风云榜</span>
</div>
</div>
<div class="content">
<ul>
<li>
<div class="ranking">排名</div>
<div class="user">用户名</div>
<div class="money">投资金额(元)</div>
</li>
	
		暂无排名
	</ul>
<div class="clear"></div>
</div>
</div>
<!-- 将公告替换到原投资风云版位置 -->
<!-- 公告 -->
<div class="media_reports margin_top">
<div class="title">
<div class="title_left">
<span class="biaoti">借款管理</span>
</div>
</div>
<div class="content" style="padding-top: 0px;padding-left: 0px;padding-bottom: 10px;padding-right: 0px;">
<ul>
	<li>
		<a href="notice-126.html" target="_blank" title="正在招标的借款标">正在招标的借款标</a>
		</li>
	<li>
		<a href="notice-125.html" target="_blank" title="等待复审的借款标">等待复审的借款标</a>
		</li>
	<li>
		<a href="notice-123.html" target="_blank" title="成功的借款标">成功的借款标</a>
		</li>
	<li>
		<a href="notice-122.html" target="_blank" title="债权转让专区">债权转让专区</a>
		</li>
	<li>
		<a href="notice-120.html" target="_blank" title="预期黑名单">预期黑名单</a>
		</li>
	</ul>
</div>
</div>
</div>
</div>

</div>
<div class="clear"></div>
</div>
</div>
<!--中部结束-->



<!--底部开始-->
<div class="foot">
<div class="navigation">
<div class="container">
<div class="one">
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr>
<td><a href="aboutUs.html" title="关于我们">关于我们</a></td>
<td><a href="aboutUs.do#contactus" title="联系我们">联系我们</a></td>
<td><a href="security.html" title="安全保障">安全保障</a></td>
<td><a href="helpIndex.html" title="帮助中心">帮助中心</a></td>
<td><a href="queryMediaReports.html" title="媒体报道">媒体报道</a></td>
<td><a href="queryIndustryNews.html" title="行业动态">行业动态</a></td>
<td><a href="sitemap.html" title="网站地图">网站地图</a></td>
</tr>
</table>
</div>
<div class="two">
<table border="0" cellspacing="0" cellpadding="0" width="70%" align="center">
<tr>
<td>
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr>
<td></td>
<td><div class="foot_attention">
  <ul>
<li><a href="" target="_blant" class="qq" title="QQ"></a></li>
<li><a href="http://weibo.com/dibiao66" target="_blant" class="sina" rel="nofollow" title="微博"></a></li>
<li></li>
</ul>
</div>
</td>
</tr>
</table>
</td>
<td>
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr>
<td>客服热线：4006-998-666</td>
</tr>
</table>
</td>
<td>
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr>
<td>投诉建议：XXX@XX.com</td>
</tr>
</table>
</td>
</tr>
</table>
</div>





<div class="clear"></div>
</div>
</div>
<div class="copyright">
<div class="container">
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td>
<table border="0" cellspacing="0" cellpadding="5" align="center">
<tr>
<td><a href="http://pinggu.zx110.org/review_url_dib66.com" target="_blank" rel="nofollow" title=""></a></td>
<td><!--<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-54191212-1', 'auto');
  ga('send', 'pageview');
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F8283eaf12a90d07094bbd0a4a04652a9' type='text/javascript'%3E%3C/script%3E"));
</script>-->
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table border="0" cellspacing="0" cellpadding="5" align="center">
<tr>
<td>版权所有©XXXX金融服务有限公司　备案号：粤ICP备13075570号-1</td>
</tr>
</table>
</td>
</tr>
</table>
<div class="clear"></div>
</div>
</div>
<div class="clear"></div>
</div>
<!--底部结束-->
<script type="text/javascript">
var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_1253722559' style='display:none;' %3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1253722559%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>