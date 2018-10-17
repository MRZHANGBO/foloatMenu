//
//  DetailContentView.m
//  foloatMenu
//
//  Created by jx on 2018/10/17.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "DetailContentView.h"
#import "Masonry.h"
@interface DetailContentView()
@property (nonatomic,strong)UILabel *lable;
@end
@implementation DetailContentView
-(instancetype)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    UILabel* label = [UILabel new];
    label.text=@"文本信息";//设置内容
    NSLog(@"%@",label.text);//读取内容
    label.textColor= [UIColor redColor];
    label.font= [UIFont systemFontOfSize:20];//一般方法
    label.textAlignment=NSTextAlignmentRight;
    [self addSubview:label];
    self.lable = label;
    [self.lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(self.mas_height);
        make.width.equalTo (@40);
    }];
}
-(void)setText:(NSString *)text{
    _text = text;
    self.lable.text = _text;
    
}
@end
