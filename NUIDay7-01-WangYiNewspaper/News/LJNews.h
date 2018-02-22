//
//  LJNews.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/29.
//  Copyright © 2018年 李君. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJNews : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *digest;
@property (nonatomic, copy) NSString *url;
@property(nonatomic,copy)NSNumber *replyCount;
@property(nonatomic,copy)NSString *imgsrc;

@property(nonatomic,assign)BOOL imgType;


@property(nonatomic,copy)NSArray*imgextra;
+(instancetype)newsWithDict:(NSDictionary*)dict;
+(void)newlistWithURLString:(NSString*)urlString success:(void(^)(NSArray*array))successBlock error:(void(^)(NSError *error))errorBlock;
@end
