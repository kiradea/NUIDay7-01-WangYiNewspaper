//
//  LJNewsDetailController.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/22.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJNewsDetailController.h"

@interface LJNewsDetailController ()<UIWebViewDelegate>

@end

@implementation LJNewsDetailController


//
-(instancetype)initWithurlString:(NSString *)urlString
{
    self = [super init];
    if (self) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:webView];
        NSURL *url = [NSURL URLWithString:urlString];
        [webView loadRequest:[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:10]];
        webView.delegate = self;
    }
    return self;
}

-(void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
