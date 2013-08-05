//
//  YIYIImageListViewController.h
//  IYYN
//
//  Created by yiyi on 13-8-3.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface YIYIImageListViewController : UITableViewController <EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *heroData;
    NSMutableArray *heroSections;
    UIControl *_cardFooterView;
    UILabel *_cardFooterLabel;
    CALayer *_arrowImage;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL isLoading;
    CALayer *layer;
    UIButton *_arrowBtn;
    BOOL _reloading;
}

- (void) createHeroData;

@end

