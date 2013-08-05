//
//  CALayer+SpinArrow.m
//  FashionCampus
//
//  Created by Bruce Pei on 12-11-15.
//  Copyright (c) 2012年 Bruce Pei. All rights reserved.
//

#import "CALayer+SpinArrow.h"

BOOL isStoped = NO;

@implementation CALayer (SpinArrow)

- (void)spinArrowStartAnimating {
    
    isStoped = NO;

    [CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	CGRect frame = self.frame;
	self.anchorPoint = CGPointMake(0.5, 0.5);
	self.position = CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height);
	[CATransaction commit];
    
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:1.0] forKey:kCATransactionAnimationDuration];
    
	CABasicAnimation *animation;
	animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	animation.fromValue = [NSNumber numberWithFloat:0.0];
	animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
	animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	[self addAnimation:animation forKey:@"rotationAnimation"];
    
	[CATransaction commit];
}

-(void)spinArrowStopAnimating {
    // 标记，结束后，停止
    isStoped = YES;
}

#pragma mark - 

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished
{
    // 当一轮结束且无停止，则继续进行下一轮;
	if (finished&&!isStoped)
	{
		[self spinArrowStartAnimating];
	}
}


@end
