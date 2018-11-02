<?php
namespace app\common\model;
use think\Validate;
use think\Db;
use Flc\Dysms\Client;
use Flc\Dysms\Request\SendSms;

class Sms extends \think\Model
{
	
	
	public function sendSMSCode($data=[])
	{
		$validate = new Validate([
		
			['mobile','require|/1[34578]{1}\d{9}$/','手机号错误|手机号错误'],
		]);
		
		if (!$validate->check($data)) {
			return $validate->getError();
		}
		
		$config = Db::name('config')->where('name', 'ALIYUN_SMS')->find();
	
		// 读取阿里云短息相关配置信息
   	$config = unserialize($config['value']);
  	$smsConfig = [
      	'accessKeyId' => $config ['accessKeyId'],                 // your appid
      	'accessKeySecret' => $config ['accessKeySecret'],         // your app_secret
      	'signName'    => $config ['signName'],                    // your 签名
      	'templateCode' => $config ['templateCode'],         // your 模板编号
      
  	];
    	
		$client  = new Client($smsConfig);
		$sendSms = new SendSms;
		$sendSms->setPhoneNumbers($data['mobile']);
		$sendSms->setSignName($smsConfig['signName']);
		$sendSms->setTemplateCode($smsConfig['templateCode']);
		$sendSms->setTemplateParam(['code' => $data['number']]);
		$sendSms->setOutId('demo');
		$resp = $client->execute($sendSms);
		$result = json_decode(json_encode($resp),true);
	
		if (isset($result['Code']) && $result['Code'] == 'OK'){
		
			return "0";
		}
		\think\Log::record('sms inferface failure='.json_encode($result));
		return "-1";
	}
	
	
private function xml_to_array($xml){
		$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
		if(preg_match_all($reg, $xml, $matches)){
			$count = count($matches[0]);
			for($i = 0; $i < $count; $i++){
			$subxml= $matches[2][$i];
			$key = $matches[1][$i];
				if(preg_match( $reg, $subxml )){
					$arr[$key] = $this->xml_to_array( $subxml );
				}else{
					$arr[$key] = $subxml;
				}
			}
		}
		return $arr;
	}
	public function sendSmsCodeForFuDong($data=[]){
		$target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		$postData = "account=cf_0743&password=f7a7f592f336d01dab8d09c2835ee1bb&mobile=".$data['mobile']."&content=".rawurlencode("您的验证码是：".$data['number']."。请不要把验证码泄露给其他人。");
	
		$gets =  $this->xml_to_array($this->Post($postData,$target));
		return $gets['SubmitResult']['code'];
	}
	
	private function Post($curlPost,$url){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
		$return_str = curl_exec($curl);
		curl_close($curl);
		return $return_str;
}
	private function _simplexml_to_array($obj)
	{
		
		if(count($obj) >= 1){
			$result = $keys = [];
			foreach($obj as $key=>$value){
				isset($keys[$key]) ? ($keys[$key] += 1) : ($keys[$key] = 1);
				if( $keys[$key] == 1 ){
					$result[$key] = $this->_simplexml_to_array($value);
				}elseif( $keys[$key] == 2 ){
					$result[$key] = [$result[$key], $this->_simplexml_to_array($value)];
				}else if( $keys[$key] > 2 ){
					$result[$key][] = $this->_simplexml_to_array($value);
				}
			}
			return $result;
		}else if(count($obj) == 0){
			return (string)$obj;
		}
	}
}
?>