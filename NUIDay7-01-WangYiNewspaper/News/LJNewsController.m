//
//  LJNewsController.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/29.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJNewsController.h"
#import "LJNews.h"
#import "LJNewsCell.h"
#import "LJNewsDetailController.h"

@interface LJNewsController ()
@property(nonatomic,strong)NSArray *newsList;
@end

@implementation LJNewsController

-(void)setNewsList:(NSArray *)newsList
{
    _newsList = newsList;
    [self.tableView reloadData];
}

-(void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    [LJNews newlistWithURLString:urlString success:^(NSArray *array) {
        self.newsList = array;
        
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //异步加载数据
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJNews *news = self.newsList[indexPath.row];
    LJNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[LJNewsCell getReuseID:news]];
    cell.news = news;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LJNews *news = self.newsList[indexPath.row];
    return [LJNewsCell getRowHeight:news];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LJNews *news = self.newsList[indexPath.row];
    LJNewsDetailController *detail = [[LJNewsDetailController alloc]initWithurlString:news.url];
    
}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    LJNewsDetailController *detail = segue.destinationViewController;
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    NSLog(@"%@",indexPath);
//    LJNews *news = [self.newsList objectAtIndex:indexPath.row];
//    detail.url = news.url;
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
