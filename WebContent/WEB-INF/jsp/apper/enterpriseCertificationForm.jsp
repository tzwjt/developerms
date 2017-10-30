<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	
	<link rel="shortcut icon" href="14599282165704bc988a2db_IlrylC66kFce.jpg">
	<title>互正软件运维应用软件市场-应用者认证</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="shortcut icon" href="${ctx}/images/we/14599282165704bc988a2db_IlrylC66kFce.jpg">
	<link href="${ctx}/css/we/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/css/we/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/css/we/develop.css" rel="stylesheet">
	<link rel="stylesheet" href="${ctx}/css/we/pace-theme-minimal.css">
	<script src="${ctx}/js/we/jquery-1.11.1.min.js"></script>
	<script>paceOptions = {elements: true};</script>
	<script src="${ctx}/js/we/pace.min.js"></script>
 	<script src="${ctx}/js/we/require.js"></script>
	<script src="${ctx}/js/we/config.js"></script>
	
	<script src="${ctx}/js/we/bootstrap.min.js"></script>
	<script src="${ctx}/js/we/util.js"></script>
	
	<script>window.sys={debug:false}</script>

<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="css" src="${ctx}/js/we/css.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/css/we/layer.css">
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="layer" src="${ctx}/js/we/layer.js"></script>


</head>
<body class=" pace-done"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
  <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>

<div class="header">
	<div class="navbar-header">
				<a class="navbar-brand" href="">
					<img src="${ctx}/images/we/apper-logo_1.png" class="img-responsive">
				</a>
			</div>
	<div class="wrapper clearfix">
		<ul class="nav pull-left" role="tablist">
			<li role="presentation" >
				<a href="${ctx}/index">首页</a>
			</li>
			<li role="presentation" >
				<a href="${ctx}/apper/home">个人中心</a>
			</li>
			<li role="presentation">
				<a href="${ctx}/apper/applicationCenter" class="link">应用管理</a>
			</li>
			<li role="presentation" class="active">
				<a href="${ctx}/apper/enterpriseCertification" class="link">应用者认证</a>
			</li>
          
			
		</ul>
		<div class="pull-right login-info">
			<a href="" style="margin-right: 1em; text-align: center; display: inline-block; line-height: 2em;">
				<i class="fa fa-envelope"></i>
				<span class="badge" id="developer-message-count">0</span>
			</a>
			<span style="margin-right: 1em;">
				<i class="fa fa-user">${user.loginName}</i></span>
			<a href="${ctx}/logout">退出</a>
		</div>
	</div>
</div>
<div class="wrapper clearfix">
	<div class="content clearfix" style="min-height: 741px;">
	<!--左侧导航aside-->
<div class="aside">
	<div class="list-group">
		<div class="list-group-item title">
			<a href="javascript:;"><i class="fa fa-th-large"></i>"应用管理"</a>
		</div>
		<div class="list-group-item">
			<a href="${ctx}/apper/home">我的需求</a>
		</div>
		<div class="list-group-item  hidden">
			<a href="${ctx}/apper/home">我的服务</a>
		</div>
		<div class="list-group-item ">
			<a href="${ctx}/apper/home">交易记录</a>
		</div>
		<div class="list-group-item ">
			<a href="${ctx}/apper/home">举报盗版</a>
		</div>
		<div class="list-group-item ">
			<a href="${ctx}/apper/myOrder" class="menu-new">我的订单</a>
		</div>
		<div class="list-group-item ">
			<a href="">举报盗版</a>
		</div>
		<div class="list-group-item ">
			<a href="">盗版查看</a>
		</div>
		<div class="list-group-item ">
			<a href="">
				悬赏文案
			</a>
		</div>
	</div>
	<div class="list-group">
		<div class="list-group-item title">
			<a href="javascript:;"><i class="fa fa-th-list"></i>认证管理</a>
		</div>
      
		<div class="list-group-item active">
			<a href="${ctx}/apper/enterpriseCertification" class="menu-new">企业认证</a>
		</div>
      <!--  
		<div class="list-group-item">
			<a href="" class="menu-new">应用者认证</a>
		</div>
		-->
	</div>
	<div class="list-group">
		<div class="list-group-item title">
			<a href="javascript:;"><i class="fa fa-th-list"></i>其它管理</a>
		</div>
	</div>

	<div class="text-center">
		<img src="${ctx}/images/we/wx.png" width="100" title="扫二维码">
		<p>用微信扫描二维码<br>随时掌握应用动态</p>
	</div>
</div>
<!--end aside-->
		<div class="nav-top">
			<ul class="category-nav clearfix">
				<li class="active"><a href="javascript:;">企业认证</a></li>
			</ul>
		</div>
		<ul class="alert alert-warning">
			<li><h3>互正软件应用市场提醒您--应用者必须通过企业资质认证才可具有相应权限</h3></li>
			<li><i class="fa fa-info-circle"></i> 开发者企业认证需完善各项认证信息，缺一不可。</li>
			<li><i class="fa fa-info-circle"></i> </li>
		</ul>
		<div class="panel panel-default">
			<div class="panel-heading">
				企业认证资料
			</div>
			<div class="panel-body">
				<form action="${ctx}/apper/doEnterpriseCertification" method="post" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-md-2 control-label">公司名称</label>
						<div class="col-md-10">
							<input type="text" name="company" class="form-control" value="${datum.company}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">省市区/县</label>
						<div class="col-md-10">
							
<script type="text/javascript">
/*
	require(["jquery", "district"], function($, dis){
		$(".tpl-district-container").each(function(){
			var elms = {};
			elms.province = $(this).find(".tpl-province")[0];
			elms.city = $(this).find(".tpl-city")[0];
			elms.district = $(this).find(".tpl-district")[0];
			var vals = {};
			vals.province = $(elms.province).attr("data-value");
			vals.city = $(elms.city).attr("data-value");
			vals.district = $(elms.district).attr("data-value");
			dis.render(elms, vals, {withTitle: true});
		});
	});
	*/
</script><div class="row tpl-district-container">
			<div class="col-xs-4 col-sm-4">
				<select name="province" data-value="${datum.province}" class="form-control tpl-province" value="${datum.province}">
				<option value="">省/直辖市</option><option value="北京" pid="110000">北京</option><option value="天津" pid="120000">天津</option><option value="河北省" pid="130000">河北省</option><option value="山西省" pid="140000">山西省</option><option value="内蒙古自治区" pid="150000">内蒙古自治区</option><option value="辽宁省" pid="210000">辽宁省</option><option value="吉林省" pid="220000">吉林省</option><option value="黑龙江省" pid="230000">黑龙江省</option><option value="上海" pid="310000">上海</option><option value="江苏省" pid="320000">江苏省</option><option value="浙江省" pid="330000">浙江省</option><option value="安徽省" pid="340000">安徽省</option><option value="福建省" pid="350000">福建省</option><option value="江西省" pid="360000">江西省</option><option value="山东省" pid="370000">山东省</option><option value="河南省" pid="410000">河南省</option><option value="湖北省" pid="420000">湖北省</option><option value="湖南省" pid="430000">湖南省</option><option value="广东省" pid="440000">广东省</option><option value="广西壮族自治区" pid="450000">广西壮族自治区</option><option value="海南省" pid="460000">海南省</option><option value="重庆" pid="500000">重庆</option><option value="四川省" pid="510000">四川省</option><option value="贵州省" pid="520000">贵州省</option><option value="云南省" pid="530000">云南省</option><option value="西藏自治区" pid="540000">西藏自治区</option><option value="陕西省" pid="610000">陕西省</option><option value="甘肃省" pid="620000">甘肃省</option><option value="青海省" pid="630000">青海省</option><option value="宁夏回族自治区" pid="640000">宁夏回族自治区</option><option value="新疆维吾尔自治区" pid="650000">新疆维吾尔自治区</option><option value="台湾省" pid="710000">台湾省</option><option value="香港特别行政区" pid="810000">香港特别行政区</option><option value="澳门特别行政区" pid="820000">澳门特别行政区</option><option value="海外" pid="990000">海外</option></select>
			</div>
			<div class="col-xs-4 col-sm-4">
				<select name="city" data-value="${datum.city}" class="form-control tpl-city" value="${datum.city}">
				<option value="">市</option><option value="南京市" cid="320100">南京市</option><option value="无锡市" cid="320200">无锡市</option><option value="徐州市" cid="320300">徐州市</option><option value="常州市" cid="320400">常州市</option><option value="苏州市" cid="320500">苏州市</option><option value="南通市" cid="320600">南通市</option><option value="连云港市" cid="320700">连云港市</option><option value="淮安市" cid="320800">淮安市</option><option value="盐城市" cid="320900">盐城市</option><option value="扬州市" cid="321000">扬州市</option><option value="镇江市" cid="321100">镇江市</option><option value="泰州市" cid="321200">泰州市</option><option value="宿迁市" cid="321300">宿迁市</option></select>
			</div>
			<div class="col-xs-4 col-sm-4">
				<select name="district" data-value="${datum.district}" class="form-control tpl-district" value="${datum.district}">
				<option value="">区/县</option><option value="海陵区">海陵区</option><option value="高港区">高港区</option><option value="兴化市">兴化市</option><option value="靖江市">靖江市</option><option value="泰兴市">泰兴市</option><option value="姜堰市">姜堰市</option><option value="其它区">其它区</option></select>
			</div>
		</div>						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">邮编</label>
						<div class="col-md-10">
							<input type="text" name="zipcode" class="form-control" value="${datum.zipcode}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">地址</label>
						<div class="col-md-10">
							<input type="text" name="address" class="form-control" value="${datum.address}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">手机</label>
						<div class="col-md-10">
							<input type="text" name="phone" class="form-control" value="${datum.phone}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">法人</label>
						<div class="col-md-10">
							<input type="text" name="legalPerson" class="form-control" value="${datum.legalPerson}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">法人身份证正面</label>
						<div class="col-md-10">
							
		<script type="text/javascript">
			function showImageDialog(elm, opts) {
				var btn = $(elm);
				var ipt = btn.parent().prev();
				ipt.focus();
				var val = ipt.val();
				var img = ipt.parent().next().children();
				util.image(val, function(url){
					img.get(0).src = url.url;
					ipt.val(url.filename);
					ipt.attr("filename",url.filename);
					ipt.attr("url",url.url);
				}, opts);
			}
		</script>
	<div class="input-group">
		<input type="text" value="${datum.idCardFront}" name="idCardFront" ref="idCardFront" class="form-control" autocomplete="on">
		<span class="input-group-btn">
			<button class="btn btn-default" type="button" onclick="showImageDialog(this, &#39;YTo0OntzOjU6IndpZHRoIjtpOjgwMDtzOjY6ImhlaWdodCI7aTo2MDA7czo2OiJleHRyYXMiO2I6MDtzOjY6Imdsb2JhbCI7YjowO30=&#39;);">选择图片</button>
		</span>
	</div>
	<div class="input-group" style="margin-top:.5em;">
		<img src="${datum.idCardFront}" class="img-responsive img-thumbnail" width="150">
	</div>						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">法人身份证背面</label>
						<div class="col-md-10">
							
	<div class="input-group">
		<input type="text" value="${datum.idCardBack}" name="idCardBack" ref="idCardBack"" class="form-control" autocomplete="on">
		<span class="input-group-btn">
			<button class="btn btn-default" type="button" onclick="showImageDialog(this, &#39;YTo0OntzOjU6IndpZHRoIjtpOjgwMDtzOjY6ImhlaWdodCI7aTo2MDA7czo2OiJleHRyYXMiO2I6MDtzOjY6Imdsb2JhbCI7YjowO30=&#39;);">选择图片</button>
		</span>
	</div>
	<div class="input-group" style="margin-top:.5em;">
		<img src="${datum.idCardBack}" class="img-responsive img-thumbnail" width="150">
	</div>						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">营业执照</label>
						<div class="col-md-10">
							
	<div class="input-group">
		<input type="text" value="${datum.businessLicence}" name="businessLicence" ref="businessLicence" class="form-control" autocomplete="on">
		<span class="input-group-btn">
			<button class="btn btn-default" type="button" onclick="showImageDialog(this, &#39;YTo0OntzOjU6IndpZHRoIjtpOjgwMDtzOjY6ImhlaWdodCI7aTo2MDA7czo2OiJleHRyYXMiO2I6MDtzOjY6Imdsb2JhbCI7YjowO30=&#39;);">选择图片</button>
		</span>
	</div>
	<div class="input-group" style="margin-top:.5em;">
		<img src="${datum.businessLicence}" class="img-responsive img-thumbnail" width="150">
	</div>						</div>
					</div>
															<div class="form-group">
						<div class="col-md-10 col-md-offset-2">
							<input type="hidden" name="id" class="form-control" value="${datum.id}">
							<input type="submit" name="submit" class="btn btn-success" value="提交审核"> <!-- style="display:none;">-->
						<!--	<a href="javascript:;" class="btn btn-success js-submit">提交审核</a>-->
							<input type="hidden" name="token" value="3e9bc946">
						</div>
					</div>
				</form>
				<script>
					require(['layer'], function() {
						$(function() {
							//alert("aa");
							var $company = $('[name="company"]');
							var $province = $('[name="province"]');
							var $city = $('[name="city"]');
							var $district = $('[name="district"]');
							var $zipcode = $('[name="zipcode"]');
							var $address = $('[name="address"]');
							var $phone = $('[name="phone"]');
							var $legal_person = $('[name="legalPerson"]');
							var $id_card_front = $('[name="idCardFront"]');
							var $id_card_back = $('[name="idCardBack"]');
							var $business_licence = $('[name="businessLicence"]');
							$('.js-submit').click(function() {
								var msg = '';
								var company = $company.val();
								if (!company) {
									msg += '请填写公司名称. <br>';
								};
								if ((/\*\/|\/\*|eval|\$\_/i).test(company)) {
									msg += '输入公司名称无效. <br />';
									return false;
								};
								var province = $province.val();
								if (!province) {
									msg += '请选择省. <br>';
								};
								var city = $city.val();
								if (!city) {
									msg += '请选择市. <br>';
								};
								var district = $district.val();
								if (!district) {
									msg += '请选择区/县. <br>';
								};
								var zipcode = $zipcode.val();
								if (!zipcode) {
									msg += '请填写邮编号. <br>';
								};
								if (!(/^\d{6}$/i).test(zipcode)) {
									msg += '请填写6位邮编号. <br />';
								};

								var address = $address.val();
								if (!address) {
									msg += '请填写地址. <br>';
								};
								var phone = $phone.val();
								if (!phone) {
									msg += '请填写电话. <br>';
								};
								if (!(/(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}/i).test(phone)) {
									msg += '请填写正确的电话号码. <br />';
								};
								var legal_person = $legal_person.val();
								if (!legal_person) {
									msg += '请填写法人. <br>';
								};
								var id_card_front = $id_card_front.val();
								if (!id_card_front) {
									msg += '请上传法人身份证正面照片. <br>';
								};
								var id_card_back = $id_card_back.val();
								if (!id_card_back) {
									msg += '请上传法人身份证背面照片. <br>';
								};
								var business_licence = $business_licence.val();
								if (!business_licence) {
									msg += '请上传营业执照. <br>';
								};
								if (msg) {
									util.alert(msg, function() {
										util.closeAll();
									});
									return false;
								};
								$('[name="submit"]').click();
							});
						});
					});
				</script>
			</div>
		</div>
	</div>
</div></body></html>