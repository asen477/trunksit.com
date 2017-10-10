<!doctype html>
<html>
<head>
<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','c','name'), ENT_QUOTES, 'UTF-8');?></title>
<link href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','css'), ENT_QUOTES, 'UTF-8');?>/admin_style.css?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<script>
//全局变量，是Global Variables不是Gay Video喔
var GV = {
	JS_ROOT : "<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/",																									//js目录
	JS_VERSION : "<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>",																										//js版本号
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token ajax全局
	REGION_CONFIG : {},
	SCHOOL_CONFIG : {},
	URL : {
		LOGIN : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','loginUrl'), ENT_QUOTES, 'UTF-8');?>',																													//后台登录地址
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',																										//图片目录
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=area'; ?>',					//地区
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=school'; ?>'				//学校
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/jquery.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>

</head>
<body style="width:300px;" class="body_none">
<!--添加用户-->
	<form class="J_ajaxForm" data-role="list" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=u&c=manage&a=add'; ?>" method="post" >
	<input type='hidden' name='type' value="do">
	<div class="pop_cont pop_table" style="height:auto;">
		<table width="100%">
			<col class="th" />
			<col />
			<thead>
			<tr>
				<th>用户名</th>
				<td><input name="username" type="text" class="input length_3"></td>
			</tr>
			</thead>
			<tr>
				<th>密码</th>
				<td><input name="password" type="text" class="input length_3"></td>
			</tr>
			<tr>
				<th>电子邮箱</th>
				<td><input name="email" type="text" class="input length_3 mr10"><label style="display:none">
				<input name="sendEmail" type="checkbox" class="checkbox" value="0">电子邮件通知</label></td>
			</tr>
			<tfoot>
				<tr>
					<th>用户组</th>
					<td><select name="groupid" class="select_3">
						<option value="0">普通组</option>
					<?php foreach ($groups as $item) {?>
						<option value="<?php echo htmlspecialchars($item['gid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8');?></option>
					<?php }?>
						</select>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="pop_bottom">
		<button type="button" class="btn fr" id="J_dialog_close">取消</button>
		<button type="submit" class="btn btn_submit mr10 fr J_ajax_submit_btn">提交</button>
	</div>
	
<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
</body>
</html>