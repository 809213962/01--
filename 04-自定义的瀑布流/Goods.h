//
//  Goods.h
//  04-自定义的瀑布流
//
//  Created by vera on 16/8/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject

/**
 *  图片
 */
@property (nonatomic, copy) NSString *img;

/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;

/**
 *  图片的宽度
 */
@property (nonatomic, assign) float w;

/**
 *  图片高度
 */
@property (nonatomic, assign) float h;

+ (instancetype)goodsWithDictionary:(NSDictionary *)dictionary;

@end
