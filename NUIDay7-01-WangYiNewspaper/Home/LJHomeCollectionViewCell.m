//
//  LJHomeCollectionViewCell.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJHomeCollectionViewCell.h"
#import "LJNewsController.h"
@interface LJHomeCollectionViewCell()
@property(nonatomic,strong)LJNewsController *newsController;
@end
@implementation LJHomeCollectionViewCell
-(void)awakeFromNib
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsController = [sb instantiateInitialViewController];
    [self.contentView addSubview:self.newsController.view];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.newsController.view.frame = self.bounds;
}
-(void)setUrlString:(NSString *)urlString
{
    self.newsController.urlString = urlString;
}
@end
