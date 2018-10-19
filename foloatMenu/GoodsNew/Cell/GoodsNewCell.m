//
//  GoodsNewCell.m
//  foloatMenu
//
//  Created by jx on 2018/10/18.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "GoodsNewCell.h"
#import "Masonry.h"

@interface GoodsNewCell()
@property (nonatomic,strong)UILabel * buyPrice;//卖出的价格
@property (nonatomic,strong)UILabel * oldPrice;//原价
@property (nonatomic,strong)UILabel * goodsNew;//产品信息
@property (nonatomic,strong)UILabel * onlineSales;//线上，线下方式

@property (nonatomic,strong)UILabel * emsPrice;//快递价格
@property (nonatomic,strong)UILabel * sales;//销量
@property (nonatomic,strong)UILabel * address;//地址
@property (nonatomic,strong)UIImageView *iamgeView;//分享图片
@end
@implementation GoodsNewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    _buyPrice = [UILabel new];
    _buyPrice.font = [UIFont systemFontOfSize:18.f];
    _buyPrice.text = @"¥ 139";
    _buyPrice.textColor = [UIColor orangeColor];
    [self.contentView addSubview:_buyPrice];
    [_buyPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.width.equalTo(self);
    }];
    
    _onlineSales = [UILabel new];
    _onlineSales.numberOfLines = 0;
    _onlineSales.font = [UIFont systemFontOfSize:13.f];
    _onlineSales.text = @"同款门店有售";
    _onlineSales.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_onlineSales];
    [_onlineSales mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_buyPrice.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.width.equalTo(self);
    }];
    _goodsNew = [UILabel new];
    _goodsNew.font = [UIFont boldSystemFontOfSize:16.f];
    _goodsNew.numberOfLines =0;
    _goodsNew.text = @"广义的商品除了可以是有形的产品外，还可以是无形的服务";
    _goodsNew.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_goodsNew];
    [_goodsNew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_onlineSales.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.width.mas_equalTo(@300);
    }];
    
    _emsPrice = [UILabel new];
    _emsPrice.font = [UIFont boldSystemFontOfSize:12.f];
    _emsPrice.text = @"快递：0.02";
    _emsPrice.textAlignment = NSTextAlignmentLeft;
    _emsPrice.textColor = [UIColor lightGrayColor];
    
    _sales = [UILabel new];
    _sales.font = [UIFont boldSystemFontOfSize:12.f];
    _sales.text = @"销量";
    _sales.textAlignment = NSTextAlignmentCenter;
    _sales.textColor = [UIColor lightGrayColor];
    
    _address = [UILabel new];
    _address.font = [UIFont boldSystemFontOfSize:12.f];
    _address.text = @"上海";
    _address.textAlignment = NSTextAlignmentRight;
    _address.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_emsPrice];
    [self.contentView addSubview:_address];
    [self.contentView addSubview:_sales];

    // 设置array的垂直方向的约束
    [_emsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsNew.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.width.mas_equalTo(@100);
    }];
    

    [_sales mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsNew.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.mas_equalTo(@100);
    }];
    
    [_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsNew.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.width.mas_equalTo(@100);
    }];
    
    _iamgeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分享"]];
    [self.contentView addSubview:_iamgeView];
    [_iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.width.mas_equalTo(@32);
    }];
    
    
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_emsPrice.mas_bottom).offset(5);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(@10);
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
