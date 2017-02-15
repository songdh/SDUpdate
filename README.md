# SDUpdate
fetch app information from AppleStore,  if the information shows that the app need to be updated, then show an alert view in app. And this method can not result in refused.

#ios如何在应用内部提示更新
大家都知道苹果目前审核时要求应用内不能出现提示升级的功能。
我们如何做可以绕过苹果的审核呢？
一般解决方法就是服务端做一个接口开关，在审核的时候关闭这个开关，等审核通过的时候再打开这个开关，客户端就可以提示用户升级。
本文提供一种不需要服务器支持的方法.
	•	主要思路： 我们向AppleStore发起一个查询app信息的请求。然后根据返回值中的数据，来判断当前版本是否需要更新。由于app最新的信息是在审核通过后才能获取到，而审核期间获取到的是上一个发布版本的信息，所以也就不会在app内出现提示更新的功能了。我司的产品一直在使用这个功能，没有被拒的风险。
	•	说明： 所有非界面操作均放到global线程中来执行，因此不需要再进行线程操作。 其中使用了SKStoreProductViewController这个类，可以在app内部弹出appstore界面。
	•	参数说明: appleID:需要通过此参数发起请求，必须要赋值 curAppVersion当前app版本，判断是否需要更新，必须赋值 controller本方法中使用了UIAlertController和SKStoreProductViewController.在弹出这两个界面时，需要提供一个controller。
	•	使用： 使用时将SDUpdate目录拷贝并添加到工程中。   SDUpdate *updater = [SDUpdate shareInstance];
	•	  updater.appleID = @"xxxx";
	•	  updater.curAppVersion = @"5.3.0";
	•	  updater.controller = self;
	•	  [updater begin];
	
如果帮到你了，请不吝点赞^-^


