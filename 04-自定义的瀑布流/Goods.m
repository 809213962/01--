//
//  Goods.m
//  04-自定义的瀑布流
//
//  Created by vera on 16/8/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "Goods.h"

@implementation Goods

+ (instancetype)goodsWithDictionary:(NSDictionary *)dictionary
{
    Goods *goods = [[self alloc] init];
    [goods setValuesForKeysWithDictionary:dictionary];
    
    return goods;
}

@end
