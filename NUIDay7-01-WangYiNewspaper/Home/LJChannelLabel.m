//
//  LJChannelLabel.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//
#define KBIGFONT 18
#define KSMALLFONT 14
#import "LJChannelLabel.h"

@implementation LJChannelLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)channelLabelWithTName:(NSString *)tName
{
    LJChannelLabel *label = [self new];
    label.text = tName;
    label.textAlignment = NSTextAlignmentCenter;
    //让label和大字体一样
    label.font = [UIFont systemFontOfSize:KBIGFONT];
    [label sizeToFit];
    label.font = [UIFont systemFontOfSize:KSMALLFONT];
    return label;
}

-(void)setScale:(CGFloat)scale
{
    CGFloat max = KBIGFONT * 1.0 / KSMALLFONT - 1;
    self.transform = CGAffineTransformMakeScale( max*scale+1, max*scale+1);
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}
@end
