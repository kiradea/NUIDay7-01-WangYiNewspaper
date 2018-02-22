//
//  LJNetworkTools.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJNetworkTools.h"

@implementation LJNetworkTools
+(instancetype)sharedManager
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //http://c.m.163.com/nc/ad/headline/0-4.html
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        //配置超时时长
        config.timeoutIntervalForRequest = 15;
        instance = [[self alloc]initWithBaseURL:baseURL sessionConfiguration:config];
        
    });
    return instance;
}
@end
