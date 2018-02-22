//
//  LJChannelLabel.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJChannelLabel : UILabel
+(instancetype)channelLabelWithTName:(NSString*)tName;
@property(nonatomic,assign) CGFloat scale;
@end
