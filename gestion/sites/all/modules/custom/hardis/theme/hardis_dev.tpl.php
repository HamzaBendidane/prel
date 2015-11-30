<?php
if (is_array($DEVQUERIES)){
    $query = implode("<hr>",$DEVQUERIES);
} else $query =  'NO QUERY';
$title = "SQl :".count($DEVQUERIES) .' ' .round($DEVQUERIESTIME,2).'ms';

if ($DEVQUERIESTIME < 100){
    $color = "sql-bg-green";
}else if ($DEVQUERIESTIME < 500){
    $color = "sql-bg-orange";
}else{
    $color = "sql-bg-red";
}

?>
<button  id="SQL" type="button" class="btn btn-default sql <?php print $color ?>" data-html = 'true' data-container="body" data-toggle="popover" data-placement="left" data-content=" <?php print($query);?>">
<?php print $title ?>
</button>


