//
//  LJChannel.m
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/2/15.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "LJChannel.h"

@implementation LJChannel
+(instancetype)channelWithDict:(NSDictionary *)dict
{
    LJChannel *channel = [LJChannel new];
    [channel setValuesForKeysWithDictionary:dict];
    return channel;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+(NSArray*)channels
{
    NSString *path  = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dict[@"tList"];
    //字典转模型
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LJChannel *channel = [self channelWithDict:obj];
        [mArray addObject:channel];
    }];
    return [mArray sortedArrayUsingComparator:^NSComparisonResult(LJChannel *obj1, LJChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
}
-(NSString *)urlString
{
    return [NSString stringWithFormat:@"article/headline/%@/0-140.html",self.tid];
}
@end
