//
//  LJNews.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/29.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJNews.h"
#import "LJNetworkTools.h"

@implementation LJNews
+(instancetype)newsWithDict:(NSDictionary *)dict
{
    LJNews *news = [self new];
    [news setValuesForKeysWithDictionary:dict];
    return news;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(void)newlistWithURLString:(NSString*)urlString success:(void(^)(NSArray*array))successBlock error:(void(^)(NSError *error))errorBlock
{
    //http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
    NSLog(@"%@",urlString);
    [[LJNetworkTools sharedManager]GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LJNews *news = [self newsWithDict:obj];
            [mArray addObject:news];
        }];
        if (successBlock) {
            successBlock(mArray.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
@end
