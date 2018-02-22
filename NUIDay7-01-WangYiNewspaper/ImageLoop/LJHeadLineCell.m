//
//  LJHeadLineCell.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJHeadLineCell.h"
#import "LJHeadLine.h"
#import <UIImageView+AFNetworking.h>
@interface LJHeadLineCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrc;
@property (weak, nonatomic) IBOutlet UILabel *titileView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
@implementation LJHeadLineCell

-(void)setHeadline:(LJHeadLine *)headline
{
    _headline = headline;
    [self.imgsrc setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    self.titileView.text = headline.title;
    self.pageControl.currentPage = self.tag;
}
@end
