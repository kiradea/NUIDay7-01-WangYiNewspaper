//
//  LJHomeViewController.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJHomeViewController.h"
#import "LJChannel.h"
#import "LJChannelLabel.h"
#import "LJHomeCollectionViewCell.h"
@interface LJHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *channels;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,assign)int currentIndex;

@end

@implementation LJHomeViewController

-(NSArray *)channels
{
    if (_channels == nil) {
        _channels = [LJChannel channels];
    }
    return _channels;
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.flowLayout.itemSize = self.collectionView.bounds.size;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@",self.channels);
    [self loadChannels];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing  = 0;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator  = NO;
}

-(void)loadChannels
{
    CGFloat marginX = 10;
    CGFloat x = marginX;
    CGFloat h = self.scrollView.bounds.size.height;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    for (LJChannel *channel in self.channels) {
        LJChannelLabel *lbl = [LJChannelLabel channelLabelWithTName:channel.tname];
        [self.scrollView addSubview:lbl];
        lbl.frame = CGRectMake(x, 0, lbl.bounds.size.width, h);
        x += lbl.bounds.size.width + marginX;
    }
    self.scrollView.contentSize = CGSizeMake(x, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    LJChannelLabel *lbl = self.scrollView.subviews[0];
    lbl.scale = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.channels.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LJHomeCollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"news" forIndexPath:indexPath];
    LJChannel *Channel = self.channels[indexPath.item];
    Cell.urlString =  Channel.urlString;
    return Cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //当前label
    LJChannelLabel *currentLabel = self.scrollView.subviews[self.currentIndex];
    int index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    LJChannelLabel *nextLabel = nil;
    //可见cell
    for (NSIndexPath *indexpath in self.collectionView.indexPathsForVisibleItems)
    {
        if (indexpath.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[indexpath.item];
            break;
        }
    }
    if (nextLabel == nil) {
        return;
    }
    CGFloat nextScale = ABS(scrollView.contentOffset.x/scrollView.bounds.size.width - self.currentIndex);
    CGFloat currentScale = 1 - nextScale;
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    LJChannelLabel *lbl = self.scrollView.subviews[self.currentIndex];
    CGFloat offset = lbl.center.x - self.scrollView.bounds.size.width*0.5;
    CGFloat maxOffset = self.scrollView.contentSize.width -lbl.bounds.size.width - self.scrollView.bounds.size.width;
    if (offset<0) {
        offset = 0;
    }else if (offset > maxOffset){
        offset = maxOffset + lbl.bounds.size.width;
    }
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
