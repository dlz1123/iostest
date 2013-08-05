//
//  YIYIAppDelegate.h
//  IYYN
//
//  Created by yiyi on 13-8-2.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LeveyTabBarController;
@class SendMessageToWeiboViewController;
@interface YIYIAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate,WeiboSDKDelegate> {
    UIWindow *window;
    LeveyTabBarController *leveyTabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LeveyTabBarController *leveyTabBarController;
@property (strong, nonatomic) SendMessageToWeiboViewController *viewController;
@end
