//
//  YIYICell.m
//  IYYN
//
//  Created by yiyi on 13-8-3.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import "YIYICell.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define TT_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }


@implementation YIYICell

@synthesize nameLab = _nameLab;
@synthesize imageBg = _imageBg;
@synthesize imageurl=_imageUrl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // Initialization code
        self.frame = CGRectMake(0, 0, 320, 190);
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
        _nameLab.backgroundColor = [UIColor clearColor];
        _nameLab.font = [UIFont systemFontOfSize:16.0];
        _nameLab.textColor = RGBCOLOR(150, 150, 150);
        [_nameLab setHighlightedTextColor:RGBCOLOR(150, 150, 150)];
        _nameLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:_nameLab];
        
        _imageBg=[[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 300, 140)];
        
        _imageBg.clipsToBounds = YES;
        _imageBg.exclusiveTouch = YES;
        _imageBg.contentMode = UIViewContentModeScaleToFill;
        
        //self.backgroundColor=[UIColor redColor];
        [self addSubview:_imageBg];
       
//        UILabel *_nameLab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 300, 40)];
//        _nameLab1.backgroundColor = [UIColor clearColor];
//        _nameLab1.font = [UIFont systemFontOfSize:16.0];
//        _nameLab1.textColor = RGBCOLOR(150, 150, 150);
//        _nameLab1.text=@"2212";
//        [_nameLab1 setHighlightedTextColor:RGBCOLOR(150, 150, 150)];
//        _nameLab1.textAlignment = UITextAlignmentLeft;
//        [self addSubview:_nameLab1];

        
        
//        UIImageView *lineIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"school_line.png"]];
//        float lineHeight = lineIV.frame.size.height;
//        lineIV.frame = CGRectMake(0, 40-lineHeight, 320, lineHeight);
//        [self addSubview:lineIV];
//        [lineIV release];
//        
//        UIView *selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,40)];
//        selectedView.backgroundColor = RGBCOLOR(232, 245, 255);
//        self.selectedBackgroundView = selectedView;
//        [selectedView release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    
	[super layoutSubviews];
}

- (void)dealloc {
    
    TT_RELEASE_SAFELY(_nameLab);
    
	[super dealloc];
}

@end

