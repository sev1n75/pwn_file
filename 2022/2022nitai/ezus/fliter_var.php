<?php
// $url = "data://prankhub/plain;base0mxhZy5waHA=";
$url = "0://prankhub/../../f";

// 删除 url 中的非法字符
$url = filter_var($url, FILTER_SANITIZE_URL);

$r = parse_url($url);
// 验证 URL
if (filter_var($url, FILTER_VALIDATE_URL)) {
    echo("$url 是正确的 URL");
} else {
    echo("$url 是错误的 URL");
}
?>