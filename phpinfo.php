<?php
$timestrS = strtotime("+2 day");

echo format_date_wide_express($timestrS,1);
function format_date_wide_express($time,$isShowTime){
    if (!$time)
        return '';
    $fdate = '';
	$d = strtotime(date('Y-m-d',$time));
	
	$td = strtotime(date('Y-m-d',time()));
	
	$mt = strtotime(date('Y-m-d',strtotime("+1 day")));
	$ht = strtotime(date('Y-m-d',strtotime("+2 day")));
	$zt =  strtotime(date('Y-m-d',strtotime("-1 day")));
	$qt =  strtotime(date('Y-m-d',strtotime("-2 day")));
	$timeStr = "";
	if ($isShowTime){
		$timeStr = date('H:i',$time);
	}
	
    if ($td == 0) {
        $fdate = '今天'. $timeStr;
    } else {
        switch ($d) {
			case $d >$ht:
                $fdate = date('m月d日', $time).$timeStr;
                break;
            case $d > $mt:
                $fdate = '后天'.$timeStr;
                break;
			 case $d > $td:
                $fdate = '明天'.$timeStr;
                break;
            case $d < $qt:
                $fdate =  date('m月d日', $time).$timeStr;
                break;
			case $d < $zt:
                 $fdate = '前天' . $timeStr;
                break;
			case $d < $td:
                $fdate =  '昨天'. $timeStr;
                break;
            default:
                $fdate = date('m月d日', $time).$timeStr;
                break;
        }
	}
		return $fdate;
    }
?>