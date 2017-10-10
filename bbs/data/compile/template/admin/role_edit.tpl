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
<body>
<div class="wrap">


<!--角色管理: 编辑角色  -->
<div class="nav">
	<div class="return"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?c=role'; ?>">返回上一级</a></div>
</div>
<form class="J_ajaxForm" data-role="list" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?c=role&a=doEdit'; ?>" method="post">
<input type="hidden" value="<?php echo htmlspecialchars($role['id'], ENT_QUOTES, 'UTF-8');?>" name="rid" />
<div class="h_a">编辑角色</div>
<div class="table_full">
	<table width="100%" class="J_check_wrap">
		<col class="th" />
		<col width="400" />
		<col />
		<tr>
			<th>角色名称</th>
			<td><span class="must_red">*</span>
				<input name="rolename" value="<?php echo htmlspecialchars($role['name'], ENT_QUOTES, 'UTF-8');?>" type="text" class="input input_hd length_5">
			</td>
			<td><div class="fun_tips"></div></td>
		</tr>
		<!-- 编辑时,当前的角色ID变量  <?php echo htmlspecialchars($role['id'], ENT_QUOTES, 'UTF-8');?>  -->
		<tr>
			<th>从已有角色复制权限</th>
			<td>
				<select id="J_role_select" name="roleid" class="select_5">
					<option>请选择角色</option>
<?php  foreach($roles as $var){ ?>
					<option value="<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($var['name'], ENT_QUOTES, 'UTF-8');?></option>
<?php  } ?>
				</select>
			</td>
			<td><div class="fun_tips"></div></td>
		</tr>
<?php  foreach($auths as $var){ ?>
		<tr>
			<th><label><input name="menus" id="J_role_<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>" data-direction="x" data-checklist="J_check_<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>" type="checkbox" class="checkbox J_check_all" value="<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>"><span><?php echo htmlspecialchars($var['name'], ENT_QUOTES, 'UTF-8');?></span></label></th>
			<td>
				<ul data-name="<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>" id="J_check_<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>" class="three_list cc J_ul_check">
<?php  foreach($var['items'] as $item){ ?>
					<li><label><input name="auths[]" data-xid="J_check_<?php echo htmlspecialchars($var['id'], ENT_QUOTES, 'UTF-8');?>" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($item['id'], ENT_QUOTES, 'UTF-8');?>"><span><?php echo htmlspecialchars($item['name'], ENT_QUOTES, 'UTF-8');?></span></label></li>
<?php  } ?>
				</ul>
			</td>
			<td><div class="fun_tips"></div></td>
		</tr>
<?php  } ?>
	</table>
</div>
<div class="btn_wrap">
	<div class="btn_wrap_pd">
		<button type="submit" class="btn btn_submit J_ajax_submit_btn">提交</button>
	</div>
</div>
<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>

</div>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script>
var ROLE_LIST_CONFIG = <?php echo WindSecurity::escapeEncodeJson($roleTable, 'UTF-8');?>, //已有角色的权限集合
	ROLE_AUTH_CONFIG = <?php echo WindSecurity::escapeEncodeJson($cAuths, 'UTF-8');?>; //当前角色的已有权限集合
Wind.js(GV.JS_ROOT+ 'pages/admin/role_manage.js?v=' +GV.JS_VERSION);
</script>
</body>
</html>