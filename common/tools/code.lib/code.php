<?php

function unicode2utf8($str){
    if(!$str) return $str;
    $decode = json_decode($str);
    if($decode) return $decode;
    $str = '["' . $str . '"]';
    $decode = json_decode($str);
    if(count($decode) == 1){
	return $decode[0];
    }
    return $str;

}
$type = $argv[1];
$query = $argv[3];
$code_type = $argv[2];
if($type== 'encode'){
    if($code_type == 'url')
	echo urlencode($query);
    elseif($code_type == 'utf8')
	echo utf8_encode($query);
    elseif($code_type == 'html')
	echo htmlentities($query);
    elseif($code_type == 'base64')
	echo base64_encode($query);
}
if($type== 'decode'){
    if($code_type == 'url')
	echo urldecode($query);
    elseif($code_type == 'utf8')
	echo utf8_decode($query);
    elseif($code_type == 'html')
	echo html_entity_decode($query);
    elseif($code_type == 'base64')
	echo base64_decode($query);
    elseif($code_type == 'json')
	print_r(json_encode(unicode2utf8($query),JSON_UNESCAPED_UNICODE));
}
echo "\n";


?>
