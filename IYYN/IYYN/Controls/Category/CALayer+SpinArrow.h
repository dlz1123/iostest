//
//  CALayer+SpinArrow.h
//  FashionCampus
//
//  Created by Bruce Pei on 12-11-15.
//  Copyright (c) 2012年 Bruce Pei. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (SpinArrow)

/**
 *CALayer 开始转动
 *@param
 *@return
 */
- (void)spinArrowStartAnimating;

/**
 *CALayer 停止转动
 *@param
 *@return
 */
-(void)spinArrowStopAnimating;

@end
