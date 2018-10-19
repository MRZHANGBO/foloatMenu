//
//  BaseCell.m
//  foloatMenu
//
//  Created by jx on 2018/10/19.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "BaseCell.h"
#import "Masonry.h"
@interface BaseCell()
@property (nonatomic,strong)UIImageView *iamgeView;
@end

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    _title = [UILabel new];
    _title.font = [UIFont systemFontOfSize:13.f];
    _title.textColor = [UIColor orangeColor];
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(10);
//        make.bottom.equalTo(self);
    }];
    
    _iamgeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头_右"]];
    [self.contentView addSubview:_iamgeView];
    [_iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.width.mas_equalTo(@20);
    }];
}
-(void)setTitleLabel:(NSString *)titleLabel{
    _titleLabel = titleLabel;
    if (_titleLabel) {
        _title.text = _titleLabel;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
