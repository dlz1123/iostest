//
//  YIYIAppDelegate.m
//  IYYN
//
//  Created by yiyi on 13-8-2.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import "YIYIAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LeveyTabBarController.h"
#import "SendMessageToWeiboViewController.h"
#import "ProvideMessageForWeiboViewController.h"
#import "YIYIImageListViewController.h"
@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end
@implementation YIYIAppDelegate

@synthesize window;
@synthesize leveyTabBarController;

- (void)dealloc
{
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
        
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
	SecondViewController *secondVC = [[SecondViewController alloc] init];
	YIYIImageListViewController *thirdVC = [[YIYIImageListViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UIViewController *fourthVC = [[UIViewController alloc] init];
	fourthVC.view.backgroundColor = [UIColor grayColor];
    //thirdVC.tableView.backgroundColor=[UIColor purpleColorre];
	//FirstViewController *fifthVC = [[FirstViewController alloc] init];
	UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:secondVC];
	nc.delegate = self;
	[secondVC release];
	NSArray *ctrlArr = [NSArray arrayWithObjects:firstVC,nc,thirdVC,fourthVC,nil];
	[firstVC release];
	[nc release];
	[thirdVC release];
	[fourthVC release];
	//[fifthVC release];
    
	NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"001_1.png"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"001.png"] forKey:@"Highlighted"];
	[imgDic setObject:[UIImage imageNamed:@"001.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"002_2.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"002.png"] forKey:@"Highlighted"];
	[imgDic2 setObject:[UIImage imageNamed:@"002.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"003_3.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"003.png"] forKey:@"Highlighted"];
	[imgDic3 setObject:[UIImage imageNamed:@"003.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic4 setObject:[UIImage imageNamed:@"004_4.png"] forKey:@"Default"];
	[imgDic4 setObject:[UIImage imageNamed:@"004.png"] forKey:@"Highlighted"];
	[imgDic4 setObject:[UIImage imageNamed:@"004.png"] forKey:@"Seleted"];
    //	NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    //	[imgDic5 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
    //	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
    //	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	
	NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic4,nil];
	
	leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
	[leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"c-2-1.png"]];
	[leveyTabBarController setTabBarTransparent:YES];
    //[leveyTabBarController.view.self setFrame:CGRectMake(0, 0, 111.0f, 10.0f)];
  //thirdVC.tableView.frame = CGRectMake(0, 0, 320,200);
	[self.window addSubview:leveyTabBarController.view];
 
    //UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:self.viewController] autorelease];
   // self.window.rootViewController = leveyTabBarController;
    
    // Override point for customization after application launch.
    
  
    
    self.window.backgroundColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
        ProvideMessageForWeiboViewController *controller = [[[ProvideMessageForWeiboViewController alloc] init] autorelease];
        [self.viewController presentModalViewController:controller animated:YES];
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *title = @"发送结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",
                             response.statusCode, response.userInfo, response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *title = @"认证结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",
                             response.statusCode, [(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


@end
