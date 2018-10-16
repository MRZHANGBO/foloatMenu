//
//  ScrollMenuView.m
//  foloatMenu
//
//  Created by jx on 2018/10/16.
//  Copyright © 2018年 jx. All rights reserved.
//
#define LCColorRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#import "ScrollMenuView.h"
@interface ScrollMenuView ()
@property (nonatomic,strong)UIScrollView *ScrollView;
@property (nonatomic,strong)UIView *bottomBarView;
@property (nonatomic,copy) NSMutableArray *buttonsArray;  //存放所有的菜单按钮
@property (nonatomic,strong)UIButton *currentSelectBtn;  //当前选中的按钮
@property (nonatomic,assign) CGFloat totalTitleWidth;
@property (nonatomic,assign) BOOL isBlock;    //防止block重复传递造成死循环

@end
@implementation ScrollMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setUI];
    }
    return self;
}
-(void)setUI{
    [self addSubview:self.ScrollView];
}

- (NSMutableArray *)buttonsArray{
    
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray new];
    }
    
    return _buttonsArray;
}
- (void)setCurrentPage:(NSInteger)currentPage{
    
    //防止重复设置
    if (_currentPage == currentPage) {
        
        return;
    }
    
    _currentPage = currentPage;
    
    if (self.titleArray.count == 0) {
        return;
    }
    
    
    self.isBlock = NO;
    //改变当前的按钮状态以及偏移对应的菜单
    UIButton *currentBtn = self.buttonsArray[currentPage];
    [self changeSelectedState:currentBtn];
    
    
    
}
- (UIScrollView *)ScrollView{
    
    if (!_ScrollView) {
        _ScrollView = [UIScrollView new];
        _ScrollView.showsHorizontalScrollIndicator = NO;
        _ScrollView.showsVerticalScrollIndicator = NO;
        _ScrollView.backgroundColor = [UIColor whiteColor];
        
        _ScrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-2);
        
    }
    
    return _ScrollView;
}
- (UIView *)bottomBarView{
    
    if (!_bottomBarView) {
        _bottomBarView = [UIView new];
        _bottomBarView.backgroundColor = [UIColor yellowColor];
    }
    
    return _bottomBarView;
}
-(void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    [self setUI];
    self.isBlock = YES;

    NSInteger btnOffset = 0;
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:LCColorRGB(74, 74, 74) forState:UIControlStateNormal];
        [btn setTitleColor:LCColorRGB(173, 135, 72) forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i;
        [btn sizeToFit];
        float butMaxX = i?37+btnOffset:18;
        btn.frame = CGRectMake(butMaxX, 0, btn.frame.size.width, 28);
        btnOffset = CGRectGetMaxX(btn.frame);
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [btn addTarget:self action:@selector(changeSelectedState:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.buttonsArray addObject:btn];
        [self.ScrollView addSubview:btn];
        
        if (i == 0) {
            btn.selected = YES;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.currentSelectBtn = btn;
            [self currentLine:btn];
        }
    }
}
-(void)currentLine:(UIButton*)sender{
    self.bottomBarView.frame = CGRectMake(sender.frame.origin.x, self.ScrollView.frame.size.height-2, sender.frame.size.width, 2);
    [self.ScrollView addSubview:self.bottomBarView];
}

-(void)changeSelectedState:(UIButton*)sender{
    self.currentSelectBtn.selected = NO;
    self.currentSelectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.currentSelectBtn = sender;
    self.currentSelectBtn.selected = YES;
    self.currentSelectBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    
    [UIView animateWithDuration:0.2 animations:^{
        if (sender.tag == 0) {
            [self currentLine:sender];
            [self.ScrollView scrollRectToVisible:CGRectMake(0, 0, self.ScrollView.frame.size.width, self.ScrollView.frame.size.height) animated:YES];

        }else{
            UIButton *btn = self.buttonsArray[sender.tag-1];
            float offsetX = CGRectGetMinX(btn.frame) - 18;
            [self.ScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.ScrollView.frame.size.width, sender.frame.size.height) animated:YES];
            self.bottomBarView.frame = CGRectMake(self.currentSelectBtn.frame.origin.x, self.ScrollView.frame.size.height-2, self.currentSelectBtn.frame.size.width, 2);
        }
        if(self.pageSelectBlock ){
            
            NSLog(@"current seleted menu is %ld",sender.tag);
            self.currentPage = sender.tag;  //更新当前的curPage
            self.pageSelectBlock(sender.tag);
            
        }
    }];

    
}
@end
