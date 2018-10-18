//
//  GoodsNewView.m
//  foloatMenu
//
//  Created by jx on 2018/10/18.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "GoodsNewView.h"
#import "Masonry.h"

@interface GoodsNewView()
@property (nonatomic,strong)UILabel * buyPrice;//卖出的价格
@property (nonatomic,strong)UILabel * oldPrice;//原价
@property (nonatomic,strong)UILabel * goodsNew;//产品信息
@property (nonatomic,strong)UILabel * onlineSales;//线上，线下方式

@property (nonatomic,strong)UILabel * emsPrice;//快递价格
@property (nonatomic,strong)UILabel * sales;//销量
@property (nonatomic,strong)UILabel * address;//地址

@end
@implementation GoodsNewView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
}
@end
