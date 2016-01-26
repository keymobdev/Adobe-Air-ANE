### Keymob is a simple lib to manage ad 
Keymob can be very easy to use management  various advertising platforms in application, including which platform ad impressions, the proportion of each platform, setting priorities.<br/>
Support admob, chartboost, inmobi.mmedia, amazon, iad, baidu and other common advertising platform, more  platforms will been supported.<br/>
Support rich forms of advertising, including the popular  banner  a variety of sizes, rect ads, Interstitial ads, video ads, More APP Ad.<br/>
Ad config can been managed in  www.keymob.com ,  modify and adjust easy, you can config keymob with json format file , and then put it in  the project or on the website.<br/>

support ios and android,required air sdk 20 release version or later.

### Instructions

#### 1. Download and install the library files
Download keymob sdk,  add keymob.ane to the library path of  air project<br/>

#### 2. Add code

  a. add import

	import com.keymob.*;

   Before using keymob, first import keymob related classes.  Most  core classes  of keymob is in com.keymob package, so we can import all at once.<br/>
  
#### b. Set and initialize Keymob By json profile

 	KeymobAd.getInstance().initFromJSON (jsonString);
   
jsonString is String of Json format that contains ID,priority of each platform,  template file can been found in demo folder.<br/>
   
#### c.Setup and initializate Keymob by Keymob.com Web Services 

      KeymobAd.getInstance().initFromKeymobService ("1", false);

The first parameter is obtain in  www.Keymob.com <br/>
The second argument is whether test mode. if you are  release your app,set false<br/>

NOTE:  set up platform keys in www.keymob.com before start<br/>

##### d. banner ad 

	 KeymobAd.getInstance().showRelationBanner (AdSizes.BANNER, AdPositions.BOTTOM_CENTER, 10);

The above means that displays the standard banner ad at the bottom of the device . The first parameter is the ad size, the type size can be selected in BannerSizes constants, including the standard banner, rectange banner, smart banner and so on.<br/>
Other banner size outside  standard size(320*50) may have  small differences in the different platforms, run to see the effects.<br/>
The second parameter is the position of the banner displayed,  the value of each position is  in BannerPositions constants,including the top left, top center, top right-hand and so on ,9 kinds of common position total.<br/>
The third parameter is offsetY, i.e., the relative positional deviation, e.g., on the bottom of the application, the upward offset 80 pixels, that is, the effect of the above code. If you want to stick to the bottom of the application, set the offsetY 0.<br/>
 
#### d.display banner at Fixed position

 	KeymobAd.getInstance().showBannerABS(AdSizes.BANNER, 0, 200);

The above code is display standard banner at point(0,200)<br/>
Although the relative positioning to meet the needs of the majority of advertising location settings, but to meet the needs of some special position, keymob provides absolute fixed position display banner advertising api.<br/>
The first parameter is the size of the banner, the second argument and third parameters are the position x and y values of banner.<br/>

#### e. Hide banne

	KeymobAd.getInstance().removeBanner ();

"removeBanner" hidden banner advertising, but advertising will not be destroyed so show can be quickly presented to the user next time. Some advertising platform will continue to  load ad after hidden , so the event will dispatched also.<br/>
    
#### f. Load and display Interstitial ads

	KeymobAd.getInstance().loadInterstitial();

Load Interstitial ads, does not automatically show after load successfully, this can better control Interstitial ad at the right time to show to the user,<br/>
If you want to show immediate after load,just handler onLoadedSuccess  in eventListener and call showInterstitial.<br/>

	KeymobAd.getInstance().showInterstitial ();

Display Interstitial advertising, ads will appear immediately after the call showInterstitial. However, please ensure that advertising has finished loading.

	KeymobAd.getInstance().isInterstitialReady ();

Check the Interstitial ad is loaded complete. If call showInterstitial directly when an ad  has not finished loading unpredictable events will occur, som advertising platform could lead to crash.<br/>
So make sure the Interstitial is ready before every show.Below is the overall look.<br/>

	if (KeymobAd.getInstance (). isInterstitialReady ()) {
		KeymobAd.getInstance().showInterstitial ();
	}

#### g. Load and display video ads

	KeymobAd.getInstance().loadVideo ();

Load video ads, does not automatically show after load successfully, this can better control video ad at the right time to show to the user,<br/>
If you want to show immediate after load,just handler onLoadedSuccess  in eventListener and call showVideo.<br/>

	KeymobAd.getInstance().showVideo ();

Display video ads, ads will appear immediately after the call showVideo. However, please ensure that advertising has finished loading.<br/>

	KeymobAd.getInstance().isVideoReady ();

Check the video ad is loaded complete. If call showVideo directly when an ad  has not finished loading unpredictable events will occur, some advertising platform could lead to crash.<br/>
So make sure the video is ready before every show.Below is the overall look.<br/>

   if (KeymobAd.getInstance (). isVideoReady ()) {
		KeymobAd.getInstance().showVideo ();
       }

#### h. Application load and display more app advertising

	KeymobAd.getInstance().loadAppWall ();

Load more app ads, does not automatically show after load successfully, this can better control video ad at the right time to show to the user,<br/>
If you want to show immediate after load,just handler onLoadedSuccess  in eventListener and call showAppWall.<br/>

	KeymobAd.getInstance().showAppWall ();

Display more app ads, ads will appear immediately after the call showAppWall. However, please ensure that advertising has finished loading.

	KeymobAd.getInstance().isAppWallReady ();

Check the More App ad is loaded complete. If call showAppWall directly when an ad  has not finished loading unpredictable events will occur, some advertising platform could lead to crash.<br/>
So make sure the More App is ready before every show.Below is the overall look.<br/>

   if (KeymobAd.getInstance (). isAppWallReady ()) {
	   KeymobAd.getInstance().showAppWall ();
	}

i. handler ad event
	KeymobAd.getInstance().addEventListener(AdEvent.ON_LOADED_SUCCESS,onLoadSuccess);
	 function onLoadSuccess(event:AdEvent):void
	{
		if(event.adtype==AdTypes.INTERSTITIAL){
			KeymobAd.getInstance().showInterstitial();
		}
	}


### 3. Set profile for android

#### a. Configuring air Android app permissions

```
	<!-- base permission -->
	<uses-permission android:name="android.permission.INTERNET"/>
	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
	<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
	<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
	<!-- base permission for location-->
	<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
	<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />			    
	<!-- base permission  required by chartboost and baidu-->
	<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
	<!-- permission required by mmedia -->
	<uses-permission android:name="android.permission.RECORD_AUDIO" />
	<uses-feature android:name="android.hardware.microphone" android:required="false" />

```
  
The above are permissions advertising platform needs, basic permissions are required by all advertising platform, location is required by some platforms, in order to save the sake , both blocks can be added to this configuration.<br/>
WRITE_EXTERNAL_STORAGE  permission is required by chartboost, if added chartboost, you need to add this permission.<br/>
The audio and microphone permissions are required by  mmedia, if used mmedia platform,  add it to configuration<br/>


#### b. Configure the android platform and service-related activity
```
<!-- Admob -->
        <meta-data
            android:name="com.google.android.gms.version"
            android:value="8115000" />

        <activity
            android:name="com.google.android.gms.ads.AdActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"
            android:theme="@android:style/Theme.Translucent" />

        <!-- Amazon Mobile Ads -->
        <activity
            android:name="com.amazon.device.ads.AdActivity"
            android:configChanges="keyboardHidden|orientation|screenSize" />

        <!-- InMobi -->
        <activity
            android:name="com.inmobi.rendering.InMobiAdActivity"
            android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize"
            android:hardwareAccelerated="true"
            android:theme="@android:style/Theme.Translucent.NoTitleBar"
            />

        <!-- Millennial Media -->
        <activity
            android:name="com.millennialmedia.internal.MMActivity"
            
            android:theme="@android:style/Theme.Translucent.NoTitleBar" />
        <activity
            android:name="com.millennialmedia.internal.MMIntentWrapperActivity"
            android:label="sdk" />
        

        <!-- Keymob -->
        <activity
            android:name="com.keymob.sdk.core.KeymobActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"
            android:theme="@android:style/Theme.Dialog" />
        <!-- baidu -->
        <activity
            android:name="com.baidu.mobads.AppActivity"
            android:configChanges="keyboard|keyboardHidden|orientation" />

        <!-- adcolony -->
        <activity
            android:name="com.jirbo.adcolony.AdColonyOverlay"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
        <activity
            android:name="com.jirbo.adcolony.AdColonyFullscreen"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Black.NoTitleBar.Fullscreen" />
        <activity
            android:name="com.jirbo.adcolony.AdColonyBrowser"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Black.NoTitleBar.Fullscreen" />

        <!-- guang dian tong -->
        <service
            android:name="com.qq.e.comm.DownloadService"
            android:exported="false" />
            <activity
            android:name="com.qq.e.ads.ADActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenSize" />

        <!-- chartboost -->
        	<activity android:name="com.chartboost.sdk.CBImpressionActivity"
            	   android:excludeFromRecents="true"
                   android:hardwareAccelerated="true"
            	   android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen"
                   android:configChanges="keyboardHidden|orientation|screenSize"/>
        
 	 
```
  The above is the various advertising platforms require configuration activity, choose according to their own advertising platform, add a corresponding configuration to androidmanifest.xml in activity.

#### c. add platform resource
     if you plan to use baidu ,copy biduad_plugin into folder src of   project
     if you plan to use gdt ,copy gdt_plugin into folder src of   project
     copy com_keymob_sdks into folder src of project.if you do not want to use admob as default platform ,download other adapters from https://github.com/keymobdev/admob-adapter/archive/master.zip
     Note: The file name of the adapter can not be modified,only need add one default platform.

### The advertising platform configuration file templates

```
	{
		"isTesting":true,//Whether it is in test mode
		"rateModel":1,//0 said priority is  represents the weight of each platform ,1 said the priority is the order of each platform to display ads
		"platforms":[
		{"class":"AdmobAdapter","priority":10,"key1":"ca-app-pub-xxx/xxx","key2":"ca-app-pub-xxx/xxx"},//admob  ,key1 banner ID，key2 Interstitial id
		{"class":"BaiduAdapter","priority":10,"key1":"apid","key2":"banner id","param":"{\"interstitialID\":\"interstitial ID\",\"videoID\":\"video ID\"}"},//baidu platform,param is a json string.remove video ID key value for ios
		{"class":"AmazonAdapter","priority":10,"key1":"xxx"},//amazon ,key1 appkey
		{"class":"ChartboostAdapter","priority":10,"key1":"xxx","key2":"xxx"},//chartboost ,key1 appID，key2 signature
		{"class":"InmobiAdapter","priority":10,"key1":"xxx","key2":"","param":" interstitial placement"},//inmobi ,key1 appid ,key2 banner placement,param interstitial placement
		{"class":"IadAdapter","priority":10,"key1":"appid"},//iad ,will be automatically ignored on android
		{"class":"GDTAdapter","priority":10,"key1":"appid","key2":"banner id", "param":"{\"interstitialID\":\"interstitial ID\",\"appWallID\":\"app Wall ID\"}"},//gdt platform
		{"class":"AdcolonyAdapter","priority":10,"key1":"appid","key2":"zone interstitia","param":"video zone"},//adcolony platform
		{"class":"MMediaAdapter","priority":10,"key1":"banner id","key2":"Interstitial id"}//mmedia ,key1 banner apID，key2 Interstitial apid
		]
	}
```

Depending ratemodel priority will become the sort of number or proportion. class is impliment of  platform, the value can not be altered

Project home https://github.com/keymobdev/Adobe-Air-ANE
qq group :310513042