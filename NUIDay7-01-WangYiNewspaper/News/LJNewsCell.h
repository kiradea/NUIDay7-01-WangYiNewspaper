//
//  LJNewsCell.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/29.
//  Copyright © 2018年 李君. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJNews;
@interface LJNewsCell : UITableViewCell
@property(nonatomic,strong)LJNews *news;
+(NSString*)getReuseID:(LJNews*)news;
+(CGFloat)getRowHeight:(LJNews*)news;
@end
