package
{
	import com.keymob.AdPositions;
	import com.keymob.AdSizes;
	import com.keymob.KeymobAd;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Keyboard;
	
	public class keymobdemo extends Sprite
	{
		[Embed(source="ads.json",mimeType="application/octet-stream")]
		var jsonConfig:Class;
		
		var km:KeymobAd;
		public function keymobdemo()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			var ui:UI=new UI(onClickButton);
			addChild(ui);
			ui.addButton("banner",10,10);
			ui.addButton("hidebanner",200,10);
			ui.addButton("full",10,100);
			ui.addButton("video",200,100);
			ui.addButton("appwall",10,200);
			km=KeymobAd.getInstance();
				var config:String=new jsonConfig();
			if(km.supportDevice){
//				km.initFromJSON(config);
				km.initFromKeymobService("1",true);
			}
		}
		
		private function onClickButton(label:String):void
		{
			trace("onClickButton",label,km.supportDevice);
			if(label=="banner"){
				km.showRelationBanner(AdSizes.BANNER,AdPositions.BOTTOM_CENTER,10);
			}
			if(label=="hidebanner"){
				km.removeBanner();
			}
			if(label=="full"){
				if(km.isInterstitialReady()){
					km.showInterstitial();
				}else{
					km.loadInterstitial();
				}
			}
			if(label=="video"){
				if(km.isVideoReady()){
					km.showVideo();
				}else{
					km.loadVideo();
				}
			}
			if(label=="appwall"){
				if(km.isAppWallReady()){
					km.showAppWall();
				}else{
					km.loadAppWall();
				}
			}
		}
	}
}