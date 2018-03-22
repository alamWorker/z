<?php
namespace app\common\controller;

use think\Controller;

class SendMsg extends Controller
{

    private $appkey = '';

    private $secret_key = '';
    // 签名名称
    private $sign_name = '';
    // 公共回传参数
    private $extend = '';
    // 短信类型
    private $sms_type = 'normal';
    // 短信模板变量
    private $sms_param;
    // 接收号码
    private $rec_num;
    // 模板ID
    private $sms_templateCode;

    public function init($param = [])
    {
        $aliyun_msg = config('aliyun.aliyun_msg');
        $this->appkey = $aliyun_msg['appkey'];
        $this->secret_key = $aliyun_msg['secret_key'];
        $this->sign_name = $aliyun_msg['sign_name'];
        
        $this->set_param($param);

        return $this;
    }

    /**
     * 设定参数
     */
    public function set_param($param = [])
    {
        if (empty($param)) {
            return $this;
        }
        foreach ($param as $key => $value) {
            $this->$key = $value;
        }
        return $this;
    }

    public function send_msg()
    {
        if (empty($this->sms_templateCode) || empty($this->sms_param)) {
            return false;
        }
        $request = new \aliyunMsg\AlibabaAliqinFcSmsNumSendRequest();
        $client = new \aliyunMsg\TopClient();
        
        $client->appkey = $this->appkey;
        $client->secretKey = $this->secret_key;
        
        $request->setExtend($this->extend);
        $request->setSmsType($this->sms_type);
        $request->setSmsFreeSignName($this->sign_name);
        $request->setSmsParam($this->sms_param);
        $request->setRecNum($this->rec_num);
        $request->setSmsTemplateCode($this->sms_templateCode);

        $result = $client->execute($request);

        return $result;
        if (empty($result->code)) {
            return true;
        }
        return false;
    }
}