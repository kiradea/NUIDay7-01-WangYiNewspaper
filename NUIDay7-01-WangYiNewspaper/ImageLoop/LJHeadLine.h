//
//  LJHeadLine.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "LJNetworkTools.h"
@interface LJHeadLine : AFHTTPSessionManager
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *imgsrc;
+(instancetype)headLineWithDict:(NSDictionary*)dict;
+(void)headlinesWithSuccess:(void(^)(NSArray*array))success error:(void(^)())error;
@end
