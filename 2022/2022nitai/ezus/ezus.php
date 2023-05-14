<?php
class UserAccount
{
    protected $username;
    protected $password;
 
    public function __construct($username, $password)
    {
        $this->username = $username;
        $this->password = $password;
    }
}
 
function object_sleep($str)
{
    $ob = str_replace(chr(0).'*'.chr(0), '@0@0@0@', $str);
    return $ob;
}
 
function object_weakup($ob)
{
    $r = str_replace('@0@0@0@', chr(0).'*'.chr(0), $ob);
    return $r;
}

class order
{
    public $f;
    public $hint;
    
    public function __construct($hint, $f)
    {
        $this->f = $f;
        $this->hint = $hint;
    }
    
    public function __wakeup()
    {
        //something in hint.php
        if ($this->hint != "pass" || $this->f != "pass") {
            $this->hint = "pass";
            $this->f = "pass";
        }
    }
    
    public function __destruct()
    {
        if (filter_var($this->hint, FILTER_VALIDATE_URL))   //hint必须是正确的url，可以通过fliter_var.php检查
        {
            $r = parse_url($this->hint);
            if (!empty($this->f)) {
                if (strpos($this->f, "try") !==  false && strpos($this->f, "pass") !== false) {
                    @include($this->f . '.php');
                } else {
                    die("try again!");
                }
                if (preg_match('/prankhub$/', $r['host'])) {    //hint的host以prankhub结尾
                    @$out = file_get_contents($this->hint);
                    echo "<br/>".$out;
                } else {
                    die("<br/>error");
                }
            } else {
                die("try it!");
            }
        }
        else
        {
            echo "Invalid URL";
        }
    }
}

$username = $_POST['username'];
$password = $_POST['password'];

$user = serialize(new UserAccount($username, $password));
unserialize(object_weakup(object_sleep($user)))
?>