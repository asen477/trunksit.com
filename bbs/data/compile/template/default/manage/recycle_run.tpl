<div class="content">
	<div class="profile_nav">
		<ul>
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle'; ?>">主题回收站</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&a=reply'; ?>">回复回收站</a></li>
		</ul>
	</div>
	<div class="profile_search">
		<form method="post" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle'; ?>">
		<h2>帖子搜索</h2>
		<table width="100%">
			<colgroup>
				<col>
				<col width="200">
			</colgroup>
			<tr>
				<th>关键字</th>
				<td><input type="text" name="keyword"  class="input length_3" placeholder="可使用通配符*" value="<?php echo htmlspecialchars($url['keyword'], ENT_QUOTES, 'UTF-8');?>"></td>
				<th>所属版块</th>
				<td><select name="fid" class="select_3"><option value="0">所有版块</option><?php echo $option_html;?></select></td>
			</tr>
			<tr>
				<th>作者</th>
				<td><input type="text" name="author"  class="input length_3" value="<?php echo htmlspecialchars($url['author'], ENT_QUOTES, 'UTF-8');?>"></td>
				<th>发帖时间</th>
				<td><input type="text" class="input length_3 mr10 J_date" name="created_time_start" value="<?php echo htmlspecialchars($url['created_time_start'], ENT_QUOTES, 'UTF-8');?>"><span class="mr10">至</span><input type="text" class="input length_3 J_date"  name="created_time_end" value="<?php echo htmlspecialchars($url['created_time_end'], ENT_QUOTES, 'UTF-8');?>"></td>
			</tr>
			<tr>
				<th>删除人</th>
				<td><input type="text" name="operator" class="input length_3" value="<?php echo htmlspecialchars($url['operator'], ENT_QUOTES, 'UTF-8');?>"></td>
				<th>删除时间</th>
				<td><input type="text" name="operate_time_start"  class="input length_3 mr10 J_date" value="<?php echo htmlspecialchars($url['operate_time_start'], ENT_QUOTES, 'UTF-8');?>"><span class="mr10">至</span><input type="text" name="operate_time_end" class="input length_3 J_date" value="<?php echo htmlspecialchars($url['operate_time_end'], ENT_QUOTES, 'UTF-8');?>"></td>
			</tr>
		</table>
		<div class="tac"><button type="submit" class="btn">搜索</button></div>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	</div>
	<div class="profile_table">
	<?php  if ($threaddb) { ?>
	<form class="J_form_ajax" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&a=doRevertTopic'; ?>" method="post">
		<h2>帖子列表</h2>
		<table width="100%" class="J_check_wrap">
			<colgroup>
				<col width="60">
				<col width="300">
				<col width="115">
				<col width="115">
				<col>
			</colgroup>
			<thead>
				<tr>
					<td><label><input type="checkbox" class="J_check_all">全选</label></td>
					<td>标题</td>
					<td>作者/发帖时间</td>
					<td>删除人/删除时间</td>
					<td>删除理由</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td><label><input type="checkbox" class="J_check_all">全选</label></td>
					<td><button type="submit" class="btn btn_submit J_form_sub_check">还原</button><button type="submit" class="btn J_form_sub_check" data-action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&a=doDeleteTopic'; ?>">彻底删除</button></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tfoot>
	<?php  foreach ($threaddb as $key => $value) { ?>
			<tr>
				<td><input type="checkbox" class="J_check" name="tids[]" value="<?php echo htmlspecialchars($value[tid], ENT_QUOTES, 'UTF-8');?>" ></td>
				<td><?php echo htmlspecialchars($value['subject'], ENT_QUOTES, 'UTF-8');?></td>
				<td><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&uid=', rawurlencode($value['created_userid']); ?>" target="_blank"><?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?></a><br><?php echo htmlspecialchars(Pw::time2str($value['created_time']), ENT_QUOTES, 'UTF-8');?></td>
				<td><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=space&username=', rawurlencode($value['operate_username']); ?>" target="_blank"><?php echo htmlspecialchars($value['operate_username'], ENT_QUOTES, 'UTF-8');?></a><br><?php echo htmlspecialchars(Pw::time2str($value['operate_time']), ENT_QUOTES, 'UTF-8');?></td>
				<td><?php echo htmlspecialchars($value['reason'], ENT_QUOTES, 'UTF-8');?></td>
			</tr>
	<?php  } ?>
		</table>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
		<div class="p10">
			<?php $__tplPageCount=(int)$count;
$__tplPagePer=(int)$perpage;
$__tplPageTotal=(int)0;
$__tplPageCurrent=(int)$page;
if($__tplPageCount > 0 && $__tplPagePer > 0){
$__tmp = ceil($__tplPageCount / $__tplPagePer);
($__tplPageTotal !== 0 &&  $__tplPageTotal < $__tmp) || $__tplPageTotal = $__tmp;}
$__tplPageCurrent > $__tplPageTotal && $__tplPageCurrent = $__tplPageTotal;
if ($__tplPageTotal > 1) {
 
$_page_min = max(1, $__tplPageCurrent-3);
$_page_max = min($__tplPageTotal, $__tplPageCurrent+3);
?>
<div class="pages">
<?php  if ($__tplPageCurrent > $_page_min) { 
	$_page_i = $__tplPageCurrent-1;
?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=manage&c=recycle&page=', rawurlencode($_page_i); 
 echo htmlspecialchars($url ? '&' . http_build_query($url) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?>
		</div>
	<?php  } else { ?>
		<div class="not_content">啊哦，没有符合条件的内容！</div>
	<?php  } ?>
	</div>
</div>