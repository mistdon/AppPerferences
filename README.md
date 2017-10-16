# AppPerferences

<img src="https://github.com/momo13014/AppPerferences/master/screenshots/one.png" width="180">
<img src="https://github.com/momo13014/AppPerferences/master/screenshots/two.png" width="180">
<img src="https://github.com/momo13014/AppPerferences/master/screenshots/three.png" width="180">


### 偏好设置
iPhone自定的设置里面，可以对WLAN，Location等权限进行设置，我们也可以增加一个自己的自定义设置。原理就是利用Setting.Bundle和NSUserDefaults的属性，生成一个全局的变量，以供App内部使用。

### 可以设置哪些？
iPhone的设置里面提供了7中“设置类型”，供开发者自行设置和定义，

![Setting Preference control types](http://upload-images.jianshu.io/upload_images/1126977-e0583d8512b17ab8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
[每种类型的介绍及里面的自定义设置](https://developer.apple.com/library/content/documentation/PreferenceSettings/Conceptual/SettingsApplicationSchemaReference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007071)

### 如何设置
1.  选择File -> New -> New File -> Sources -> Setting.bundle
2.  Setting.bundle就是我们需要的设置文件，在里面默认有两个文件
 ```
Settings.bundle/
    Root.plist
    en.lproj/
          Root.strings
```
其中的Root.plist文件就是我们要设置的偏好plist文件, 具体编写规则见*参考链接1*
3.  获取和更改
每一个属性都有一个“Identifier”的值, 通过获取着key获取实际的value
```
// 获取
  NSArray *identifiers = @[@"play_sounds_preference",
                           @"3D_Sound_preference",
                           @"user_name",
                           @"experience_preference",
                           @"gravity_preference"];


  for (NSString *key in identifiers) {
      NSLog(@"key = %@, value = %@",key, [[NSUserDefaults standardUserDefaults] objectForKey:key]);
  }
// 设置
  [[NSUserDefaults standardUserDefaults] setObject:@"DON" forKey:@"user_name"];
  [[NSUserDefaults standardUserDefaults] synchronize];
```
4. 添加更多的plist文件和本地化文件
    参考Root.plist文件和Root.strings(本地化)实现更多的设置条件。
    如果实际中需要针对不同的类型有更多的设置，可以通过China Pane实现。
    首先选中一个Row，右击Add Row，将Type设置为PSChildPaneSpecifier，
   
    [Child Pane Element Guide](https://developer.apple.com/library/content/documentation/PreferenceSettings/Conceptual/SettingsApplicationSchemaReference/Articles/PSChildPaneSpecifier.html#//apple_ref/doc/uid/TP40007017-SW1)
5. 自定义参数的设置
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"subTitle_perference":@"sub title",
                                                              @"subEnvironment_preference":@"QA"
                                                              }];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}
```
** 需要注意的是：在自定义的plist文件中，Identifier应该改为Key(首字母大写), 否则识别有问题

### 应用

  在APP环境测试的时候，我们可能需要在不同的环境中切换，以确保不同的环境中请求返回的结果。因此我们可以在自定义设置中通过切换不同的环境以达到在APP内环境切换的效果。

实践的项目：[Bootstrap](https://github.com/krzysztofzablocki/Bootstrap)

### 参考链接
1. [Preferences and Settings Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html#//apple_ref/doc/uid/10000059i-CH6-SW14)
2. [iOS App 偏好设置](http://chars.tech/2016/01/15/ios-preference-setting/)
