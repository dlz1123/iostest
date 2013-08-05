//
//  YIYICell.h
//  IYYN
//
//  Created by yiyi on 13-8-3.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YIYICell : UITableViewCell{
    UILabel *_nameLab;
    UIImageView *_imageBg;
    NSString *_imageUrl;
    
}

@property (nonatomic, readonly, retain) UILabel *nameLab;
@property (nonatomic, retain) NSString *imageurl;
@property (nonatomic, retain) UIImageView *imageBg;

@end