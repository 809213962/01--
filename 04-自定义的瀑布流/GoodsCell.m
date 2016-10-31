//
//  GoodsCell.m
//  04-自定义的瀑布流
//
//  Created by vera on 16/8/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "GoodsCell.h"
#import "UIImageView+WebCache.h"

@interface GoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation GoodsCell

- (void)setGoods:(Goods *)goods
{
    /*
     如果从网络上下载图片：需要在info.plist里面添加App Transport Security Settings
     */
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"egopv_photo_placeholder"]];
    self.priceLabel.text = goods.price;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
