# TYShareSDK


#### facebook
[iOS Facebook配置指引](https://developers.facebook.com/docs/ios/getting-started/)
##### 一. 注册应用
1. 在facebook开发者平台创建应用；
2. 在 Xcode 中找到捆绑标识符，并将它复制到剪贴板。
![](https://scontent-lax3-1.xx.fbcdn.net/v/t39.2365-6/13178078_604673089695202_313884316_n.png?_nc_cat=103&_nc_ht=scontent-lax3-1.xx&oh=64ea8733338b54a9d64474d002a1d3d0&oe=5D26D647)
3. 返回应用面板，将捆绑标识符粘贴到捆绑标识符一栏。
![](https://scontent-lax3-1.xx.fbcdn.net/v/t39.2365-6/13065894_1735818543297942_1369236631_n.png?_nc_cat=109&_nc_ht=scontent-lax3-1.xx&oh=88e4c506177e540bd3e42255d4862168&oe=5D2289B7)

4. 启用单点登录
5. 点击应用面板窗口底部的“保存更改”
6. 讲应用发布状态改为“已发布”

##### 二、配置 Info.plist

1. 在 Xcode 中，右键点击项目的 Info.plist 文件并选择 Open As（打开方式）-> Source Code（源代码）
2. 在最后的 </dict> 元素前，将以下 XML 代码片段插入文件正文。

```
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>fb{your-app-id}</string>
    </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>{your-app-id}</string>
<key>FacebookDisplayName</key>
<string>{your-app-name}</string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
</array>
```

3. 将 {your-app-id} 和 {your-app-name} 分别替换为 Facebook 应用面板上提供的应用编号和名称。

##### 三、安装

```
  pod 'FacebookSDK'
  pod 'FBSDKCoreKit'  
  pod 'FBSDKShareKit'
  
```
* 下载TYShareSDK中.h  .m 引入工程

##### 四、使用

````

	#import "TYShareSDK.h"
	
	@interface AppDelegate ()
	
	@end
	
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
	{
	    
	    [TYShareSDK configWith:application didFinishLaunchingWithOptions:launchOptions];
	    return YES;
	}
	
	- (BOOL)application:(UIApplication *)application
	            openURL:(NSURL *)url
	            options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
	{
	    return [TYShareSDK application:application openURL:url options:options];
	}
	
````


#### Messenger

#### Instagram
