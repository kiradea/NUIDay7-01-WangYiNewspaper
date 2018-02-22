//
//  LJChannel.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//

#import <Foundation/Foundation.h>
//新闻的频道
@interface LJChannel : NSObject
@property(nonatomic,copy)NSString *tname;
@property(nonatomic,copy)NSString *tid;

@property(nonatomic,copy,readonly) NSString *urlString;

+(instancetype)channelWithDict:(NSDictionary*)dict;
+(NSArray*)channels;
@end
