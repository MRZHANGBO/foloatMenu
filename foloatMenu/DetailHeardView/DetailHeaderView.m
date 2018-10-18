//
//  DetailHeaderView.m
//  foloatMenu
//
//  Created by jx on 2018/10/17.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "DetailHeaderView.h"
#import "DetailContentView.h"
#import "Masonry.h"
@interface DetailHeaderView()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSArray *iamgeCount;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,assign)NSInteger currentIndex;
@property (nonatomic,strong)DetailContentView *contentView;
@end
@implementation DetailHeaderView

-(instancetype)initWithFrame:(CGRect)frame AndWithImageArray:(NSArray *)array count:(NSInteger)count{
    self = [super initWithFrame:frame];
    if (self) {
        _iamgeCount = array;
        _count = count;
        [self setUI];

    }
    return self;
}
-(void)setUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height )];
    _scrollView.backgroundColor = [UIColor blackColor];
    [_scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0)];

    _scrollView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(self.bounds.size.width * (_count+2), self.bounds.size.height);
    
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = 2;
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    
    for (int i = 0; i < _iamgeCount.count+2; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 100 + i;
        imageView.frame = CGRectMake(self.bounds.size.width*i, 0,self.bounds.size.width, self.bounds.size.height);
        if (i == 0) {
            imageView.image = [UIImage imageNamed:_iamgeCount[_count - 1]];
        }else if (i == _count + 1){
            imageView.image = [UIImage imageNamed:_iamgeCount[0]];
        }else{
            imageView.image = [UIImage imageNamed:_iamgeCount[i - 1]];
        }        [_scrollView addSubview:imageView];
       // [_imageViewList addObject:imageView];
        
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scaleImage:)];
        [imageView addGestureRecognizer:gesture];
    }
    DetailContentView *ContentView  = [[DetailContentView alloc]init];
    ContentView.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)_iamgeCount.count];
    [self addSubview:ContentView];
    
    [ContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    _contentView = ContentView;
}
//
-(void)scaleImage:(UITapGestureRecognizer *)sender{
    UIImageView *imgV = (UIImageView *)sender.view;
    //    ViewController2 *VC2 = [ViewController2 new];
    //    VC2.imges = _imges;
    //    VC2.index = imgV.tag - 100;
    //    VC2.backBlock = ^(NSInteger index){
    //        [_scrollview scrollRectToVisible:CGRectMake(kScreenWidth*(index - 1) , 100, kScreenWidth, 200) animated:NO];
    //    };
    //    [self presentViewController:VC2 animated:YES completion:nil];
    
    if (self.backBlock) {
        self.backBlock( imgV.tag - 100);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateUserInterfaceWithScrollViewContentOffset:scrollView.contentOffset];
}
- (void)updateUserInterfaceWithScrollViewContentOffset:(CGPoint)contentOffset {
    
    if (_scrollView.contentOffset.x >= CGRectGetWidth(_scrollView.frame) * _count + 1) {
        _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame), 0);
    }else if (_scrollView.contentOffset.x == 0){
        _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame)*_count, 0);
    }
    _currentIndex = _scrollView.contentOffset.x/CGRectGetWidth(_scrollView.frame);
    NSLog(@"%ld----%ld",_currentIndex,_count);
    NSString *str = [NSString stringWithFormat:@"%ld/%ld",_currentIndex,_count];
    _contentView.text = str;
}
@end
