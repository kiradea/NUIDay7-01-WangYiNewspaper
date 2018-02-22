//
//  LJNewsCell.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/29.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJNewsCell.h"
#import <UIImageView+AFNetworking.h>
#import "LJNews.h"
@interface LJNewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titileView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextraViews;


@end

@implementation LJNewsCell
-(void)setNews:(LJNews *)news
{

    [self.imgsrcView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titileView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d人回帖",news.replyCount.intValue];
    [news.imgextra enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *imgsrc = obj[@"imgsrc"];
        UIImageView *imageView = self.imgextraViews[idx];
        [imageView setImageWithURL:[NSURL URLWithString:imgsrc]];
    }];
}

+(NSString*)getReuseID:(LJNews *)news
{
    if (news.imgType) {
        return @"news1";
    }else if (news.imgextra){
        return @"news2";
    }
    return @"news";
}

+(CGFloat)getRowHeight:(LJNews *)news
{
    if (news.imgType) {
        return 200;
    }else if (news.imgextra){
        return 150;
    }
    return 80;
}
@end
