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
    _buyPrice = [UILabel new];
    _buyPrice.font = [UIFont systemFontOfSize:18.f];
    _buyPrice.text = @"¥ 139";
    _buyPrice.textColor = [UIColor orangeColor];
    [self addSubview:_buyPrice];
    [_buyPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(5);
        make.width.equalTo(self);
    }];
    
    _onlineSales = [UILabel new];
    _onlineSales.numberOfLines = 0;
    _onlineSales.font = [UIFont systemFontOfSize:16.f];
    _onlineSales.text = @"同款门店有售";
    _onlineSales.textColor = [UIColor lightGrayColor];
    [self addSubview:_onlineSales];
    [_onlineSales mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_buyPrice.mas_bottom).offset(5);
        make.left.equalTo(_buyPrice.mas_left).offset(5);
        make.width.equalTo(self);
    }];
}
@end
