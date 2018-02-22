//
//  LJNetworkTools.h
//  NUIDay7-01-WangYiNewspaper
//
//  Created by 李君 on 2018/1/28.
//  Copyright © 2018年 李君. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface LJNetworkTools : AFHTTPSessionManager
+(instancetype)sharedManager;
@end
