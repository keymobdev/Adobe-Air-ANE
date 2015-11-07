package 
{
	import com.keymob.KeymobAd;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class SimpleDemo extends Sprite
	{
		[Embed(source="template.json",mimeType="application/octet-stream")]
		private var config:Class;
	
		public function SimpleDemo()
		{
			super();
//			KeymobAd.getInstance().initFromKeymobService("1");//在www.keymob.com创建一个app，配置各个广告平台的key，会得到一个appid，1就是个appid
			KeymobAd.getInstance().initFromJSON(new config());
			KeymobAd.getInstance().loadInterstitial();
			stage.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			if(KeymobAd.getInstance().isInterstitialReady()){
				KeymobAd.getInstance().showInterstitial();
			}else{
				KeymobAd.getInstance().loadInterstitial();
			}
		}
	}
}