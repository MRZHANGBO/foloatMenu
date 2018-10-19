//
//  ActivityCell.m
//  foloatMenu
//
//  Created by jx on 2018/10/19.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "ActivityCell.h"
#import "Masonry.h"
@implementation ActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setUIj];
        self.titleLabel = @"活动";
        UIImageView *iamgeView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"天猫国际快车"]];
        [self.contentView addSubview:iamgeView];
        [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.title.mas_centerY);
            make.left.equalTo(self.title.mas_right).offset(15);
//            make.height.mas_equalTo(@14);
//            make.width.mas_equalTo(@70);
        }];
        
        
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor lightGrayColor];
            [self.contentView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(iamgeView.mas_bottom).offset(5);
                make.left.right.equalTo(self);
                make.bottom.equalTo(self.contentView.mas_bottom);
                make.height.mas_equalTo(@10);
            }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
