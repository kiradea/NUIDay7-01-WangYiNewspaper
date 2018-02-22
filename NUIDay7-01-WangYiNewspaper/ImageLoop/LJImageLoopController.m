//
//  LJImageLoopController.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJImageLoopController.h"
#import "LJHeadLine.h"
#import "LJHeadLineCell.h"
@interface LJImageLoopController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;
@property(nonatomic,assign)NSInteger currentIndex;
@end

@implementation LJImageLoopController

//使用collectionVIew 注意
//1 必须设置flowlayout
//2 必须注册cell

-(void)setHeadlines:(NSArray *)headlines
{
    _headlines = headlines;
    [self.collectionView reloadData]; 
    //始终显示第二个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    [LJHeadLine headlinesWithSuccess:^(NSArray *array) {
        self.headlines = array;
    } error:^{
        NSLog(@"error");
    }];
    [self setCollectionViewStyle];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.flowlayout.itemSize = self.collectionView.frame.size;
    
}

-(void)setCollectionViewStyle
{
    //设置flowlayout
    self.flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowlayout.minimumLineSpacing = 0;
    self.flowlayout.minimumInteritemSpacing = 0;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}
//数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.headlines.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LJHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headline" forIndexPath:indexPath];
//    cell.headline = nil;
    //滚动过程中item的值之可能是2 或 0
    NSInteger index = (self.currentIndex + indexPath.item - 1 + self.headlines.count) % self.headlines.count;
    cell.tag = index;
    cell.headline = self.headlines[index];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算下一张图片的索引
    int offsetx = scrollView.contentOffset.x / scrollView.bounds.size.width -1;
    self.currentIndex = (self.currentIndex  + offsetx + self.headlines.count) % self.headlines.count;
    [self.collectionView reloadData];
    //始终显示第二个cell
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
    });
    
}

@end
