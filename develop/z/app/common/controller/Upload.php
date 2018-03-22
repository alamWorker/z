<?php
namespace app\common\controller;

use think\Controller;

class Upload extends Controller
{
    // 文件保存路径
    private $path = './public/upload/';
    
    // 允许上传的文件类型
    private $allow_type = array(
        'jpg',
        'gif',
        'png',
        'jpeg',
        'pjpeg'
    );
    
    // 限制传输文件大小
    private $max_size = 2048;
    
    // 源文件名
    private $origin_name;
    
    // 临时文件名
    private $tmp_file_name;
    
    // 赋值文件名
    private $new_file_name;
    
    // 是否重命名
    private $is_rand_name = false;
    
    // 文件类型以及后缀
    private $file_type;
    
    // 文件大小
    private $file_size;
    
    // 错误码
    private $error_code;
    
    // 错误信息
    private $error_msg;

    // 错误调试
    private $error_debug;

    public function __construct()
    {
        parent::__construct();
    }

    public function upload($file)
    {
        $result = true;
        // 检查存放路径
        if (! $this->check_file_path()) {
            $this->error_msg = $this->get_error();
            return false;
        }
        if (empty($_FILES[$file])) {
            $this->set_option('error_code', - 6);
            $this->error_msg = $this->get_error();
            return false;
        }
        
        // 将上传的文件信息赋值给变量
        $name = $_FILES[$file]['name'];
        $tmp_name = $_FILES[$file]['tmp_name'];
        $size = $_FILES[$file]['size'];
        $error = $_FILES[$file]['error'];
        
        // 多文件上传
         if (is_array($name)) {
            $error_arr = array();
            for ($i = 0; $i < count($name); $i ++) {
                if ($this->_set_files($name[$i], $tmp_name[$i], $size[$i], $error[$i])) {
                    if (! $this->check_file_size() || ! $this->check_file_type()) {
                        $errors[] = $this->get_error();
                        $result = false;
                    }
                } else {
                    $errors[] = $this->get_error();
                    $result = false;
                }
                if (! $result)
                    $this->_set_files();
            }
            if ($result) {
                $file_name_arr = array();
                for ($i = 0; $i < count($name); $i++) {
                    if ($this->_set_files($name[$i], $tmp_name[$i], $size[$i], $error[$i])) {
                        $this->set_new_file_name();
                        if (! $this->copy_file()) {
                            $error_arr[] = $this->get_error();
                            $result = false;
                        }
                        $file_name_arr[] = $this->new_file_name;
                    }
                }
                $this->error_msg = $errors;
                return $result;
            }

            $this->errorMess = $errors;
            return $result;
        }
        
        // 单文件上传
        $return = false;
        if ($this->_set_files($name, $tmp_name, $size, $error)) {
            if ($this->check_file_size() && $this->check_file_type()) {
                $this->set_new_file_name();
                if ($this->copy_file()) {
                    return true;
                }
            }
        }
        if (! $return)
            $this->error_msg = $this->get_error();
        return $return;
    }

    /**
     * 初始化文件信息
     * 
     * @param string $name            
     * @param string $tmp_name            
     * @param number $size            
     * @param number $error            
     * @return boolean
     */
    private function _set_files($name = '', $tmp_name = '', $size = 0, $error = 0)
    {
        if ($error) {
            return false;
        }
        $this->set_option('error_code', $error);
        $this->set_option('orgin_name', $name);
        $this->set_option('tmp_file_name', $tmp_name);
        $arr = explode('.', $name);
        $this->set_option('file_type', strtolower($arr[count($arr) - 1]));
        $this->set_option('file_size', $size);
        return true;
    }

    /**
     * 链式操作设置成员属性
     * 
     * @param unknown $key            
     * @param unknown $value            
     * @return obj self
     */
    public function set($key, $value)
    {
        $key = strtolower($key);
        if (array_key_exists($key, get_class_vars(get_class($this)))) {
            $this->set_option($key, $value);
        }
        return $this;
    }

    /**
     * 返回上传成功后的文件名
     */
    public function get_file_name()
    {
        return $this->new_file_name;
    }

    /**
     * 返回上传失败的出错信息
     */
    public function get_error_msg()
    {
        return $this->error_msg;
    }

    /**
     * 设置成员属性
     * 
     * @param unknown $key            
     * @param unknown $value            
     */
    private function set_option($key, $value)
    {
        $this->$key = $value;
    }

    /**
     * 设置上传的文件名称
     */
    private function set_new_file_name()
    {
        if ($this->is_rand_name) {
            $this->set_option('new_file_name', $this->pro_rand_name());
        } else {
            $this->set_option('new_file_name', $this->origin_name);
        }
    }

    /**
     * 创建随机文件名
     */
    private function pro_rand_name()
    {
        $file_name = date('YmdHis') . '_' . rand(100, 999);
        return $file_name . '.' . $this->file_type;
    }

    /**
     * 检查文件类型
     * 
     * @return boolean
     */
    private function check_file_type()
    {
        if (in_array(strtolower($this->file_type), $this->allow_type)) {
            return true;
        } else {
            $this->set_option('error_code', - 1);
            return false;
        }
    }

    /**
     * 检查文件大小
     * 
     * @return boolean
     */
    private function check_file_size()
    {
        if ($this->file_size > $this->max_size) {
            $this->set_option('error_code', - 2);
            return false;
        } else {
            return true;
        }
    }

    /**
     * 检查存放路径
     * 
     * @return boolean
     */
    private function check_file_path()
    {
        if (empty($this->path)) {
            $this->set_option('error_code', - 3);
            return false;
        }
        if (! file_exists($this->path) || ! is_writable($this->path)) {
            if (! @mkdir($this->path, 0755, true)) {
                $this->set_option('error_code', - 4);
                return false;
            }
        }
        return true;
    }

    /**
     * 复制临时文件到指定目录
     * 
     * @return string|boolean
     */
    private function copy_file()
    {
        if (! $this->error_code) {
            $path = rtrim($this->path, '/') . '/';
            $path .= $this->new_file_name;
            if (@move_uploaded_file($this->tmp_file_name, $path)) {
                return true;
            } else {
                $this->set_option('error_code', - 5);
                return false;
            }
        }
        return false;
    }

    /**
     * 设置出错信息
     * 
     * @return string
     */
    private function get_error()
    {
        $str = "文件名称：{$this->origin_name};出错信息：";
        $error_str = (empty($this->error_code)) ? '' : "({$this->error_code})";
        switch ($this->error_code) {
            case 4:
                $str .= "没有文件被上传";
                break;
            case 3:
                $str .= "文件只有部分被上传";
                break;
            case 2:
                $str .= "上传文件的大小超过了HTML表单中MAX_FILE_SIZE选项指定的值";
                break;
            case 1:
                $str .= "上传的文件超过了php.ini中upload_max_filesize选项限制的值";
                break;
            case - 1:
                $str .= "未允许类型";
                break;
            case - 2:
                $str .= "文件过大,上传的文件不能超过{$this->max_size}个字节";
                break;
            case - 3:
                $str .= "未指定文件上传路径";
                break;
            case - 4:
                $str .= "存放目录建立失败，请重新指定上传目录";
                break;
            case - 5:
                $str .= "上传失败";
                break;
            default:
                $str .= "未知错误" . $error_str;
        }
        return $str;
    }

    /**
     * 添加水印
     */
    public function watermark($dst_path = '')
    {
        // 图片实例
        $dst = imagecreatefromstring(file_get_contents($dst_path));
        list($width, $height, $type, $attr) = getimagesize($dst_path);

        // 添加水印
        $font = rtrim($_SERVER['DOCUMENT_ROOT'], '/') . '/static/font/simsunb.ttf';//字体
        $black = imagecolorallocate($dst, 0x00, 0x00, 0x00);//字体颜色
        // imagefttext($dst, 13, 0, ($width / 2) - 10, ($height / 2) + 6 , $black, $font, 'ZS');
        imagefttext($dst, 13, 0, $width - 25, $height - 9, $black, $font, 'ZS');

        imagepng($dst, $dst_path);
        imagedestroy($dst);
    }

    /**
     * 原始大图地址，缩略图宽度，高度，缩略图地址
     */
    public function img_create_small($big_img, $width, $height, $small_img)
    {
        // 得到原始大图片
        $imgage = getimagesize($big_img);
        // 图像类型判断
        switch ($imgage[2]) {
            case 1:
            $im = imagecreatefromgif($big_img);
            break;
            case 2:
            $im = imagecreatefromjpeg($big_img);
            break;
            case 3:
            $im = imagecreatefrompng($big_img);
            break;
        }
        $src_W = $imgage[0]; //获取大图片宽度
        $src_H = $imgage[1]; //获取大图片高度
        $tn = imagecreatetruecolor($width, $height); //创建缩略图
        imagecopyresampled($tn, $im, 0, 0, 0, 0, $width, $height, $src_W, $src_H); //复制图像并改变大小
        imagejpeg($tn, $small_img); //输出图像
        return true;
    }
}