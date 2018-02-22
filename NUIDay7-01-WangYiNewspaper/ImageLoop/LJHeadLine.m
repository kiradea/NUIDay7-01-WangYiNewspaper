//
//  LJHeadLine.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJHeadLine.h"

@implementation LJHeadLine
+(instancetype)headLineWithDict:(NSDictionary *)dict
{
    LJHeadLine *headline = [self new];
    [headline setValuesForKeysWithDictionary:dict];
    return headline;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+(void)headlinesWithSuccess:(void (^)(NSArray *))success error:(void (^)())error
{
    [[LJNetworkTools sharedManager] GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        //获取字典的第一个键
        NSString* rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:4];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LJHeadLine *headline = [self headLineWithDict:obj];
            [mArray addObject:headline];
        }];
        if (success) {
            success(mArray.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull er) {
        if (error) {
            error();
        }
    }];}
@end
