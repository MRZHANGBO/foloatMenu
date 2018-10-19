//
//  GoodSaleCell.m
//  foloatMenu
//
//  Created by jx on 2018/10/19.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "GoodSaleCell.h"
#import "Masonry.h"
@interface GoodSaleCell()
@property (nonatomic,strong)UILabel * buyPrice;//卖出的价格
@property (nonatomic ,strong) UIButton *labBtn;

@end
@implementation GoodSaleCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUIj];
        self.titleLabel = @"优惠";
    }
    return self;
}
-(void)setUIj{
    
    UIImageView *iamgeView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下降"]];
    [self.contentView addSubview:iamgeView];
    [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.title.mas_centerY);
        make.left.equalTo(self.title.mas_right).offset(15);
        make.height.width.mas_equalTo(@14);
    }];
    
    _buyPrice = [UILabel new];
    _buyPrice.font = [UIFont systemFontOfSize:14.f];
    _buyPrice.text = @"领券至少减少¥ 10";
    _buyPrice.textColor = [UIColor blackColor];
    [self.contentView addSubview:_buyPrice];
    [_buyPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.title.mas_centerY);
        make.left.equalTo(iamgeView.mas_right).offset(4);
    }];
    
    UILabel *lable = [UILabel new];
    lable = [UILabel new];
    lable.font = [UIFont boldSystemFontOfSize:13.f];
    lable.text = @"店铺优惠券：";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title.mas_right).offset(15);
        make.top.equalTo(iamgeView.mas_bottom).offset(5);
    }];
    for (int i = 0; i<2; i++) {
        UIButton *but = [[UIButton alloc]init];
        but.titleLabel.font = [UIFont systemFontOfSize:10.f];
        [but setTitle:@"满30减10" forState:UIControlStateNormal];
        [but sizeToFit];
        [but setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [but setBackgroundImage:[UIImage imageNamed:@"优惠券"] forState:UIControlStateNormal];
        [self.contentView addSubview:but];
        
        [but mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(125+i*70));
            make.top.equalTo(iamgeView.mas_bottom).offset(5);
            make.centerY.equalTo(lable.mas_centerY);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(23);
        }];
        _labBtn = but;
    }
    
    UILabel *scorelable = [UILabel new];
    scorelable = [UILabel new];
    scorelable.font = [UIFont boldSystemFontOfSize:13.f];
    scorelable.text = @"积分";
    scorelable.backgroundColor = [UIColor redColor];
    scorelable.textAlignment = NSTextAlignmentCenter;
    scorelable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:scorelable];
    [scorelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title.mas_right).offset(15);
        make.top.equalTo(_labBtn.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom);
        
    }];
    
    
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self.contentView addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(scorelable.mas_bottom).offset(5);
//        make.left.right.equalTo(self);
//        make.bottom.equalTo(self.contentView.mas_bottom);
//        make.height.mas_equalTo(@10);
//    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
