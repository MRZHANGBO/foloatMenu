//
//  ViewController.m
//  foloatMenu
//
//  Created by jx on 2018/10/16.
//  Copyright © 2018年 jx. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "ScrollMenuView.h"
/**图片浏览器*/
#import "DetailHeaderView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) ScrollMenuView *selectMenu;
@property (nonatomic,copy) NSMutableArray *sectionHeaderArray;
@property (nonatomic,strong)NSArray *imageArray;
@end

@implementation ViewController

- (NSMutableArray *)sectionHeaderArray{
    
    if (!_sectionHeaderArray) {
        _sectionHeaderArray = [NSMutableArray new];
        
        for (int i = 0; i < self.selectMenu.titleArray.count; i++) {
            
            UIView *sectionHeader = [UIView new];
            sectionHeader.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
            sectionHeader.backgroundColor = [UIColor whiteColor];
            
            UILabel *titlLabel = [UILabel new];
            titlLabel.frame = CGRectMake(0, 0, 150, 44);
            titlLabel.font = [UIFont systemFontOfSize:14];
            titlLabel.textAlignment = NSTextAlignmentCenter;
            titlLabel.center = sectionHeader.center;
            
            titlLabel.text = self.selectMenu.titleArray[i];
            
            [sectionHeader addSubview:titlLabel];
            
            [_sectionHeaderArray addObject:sectionHeader];
            
        }
        
        
    }
    
    return _sectionHeaderArray;
}
#pragma mark --- 懒加载
- (ScrollMenuView *)selectMenu{
    
    if (!_selectMenu) {
        _selectMenu = [ScrollMenuView new];
        _selectMenu.frame = CGRectMake(0, 196, SCREEN_WIDTH, 44);
        _selectMenu.titleArray = @[@"商品介绍",@"商品型号",@"商品参数",@"相关评论",@"相关推荐"];
        __weak typeof(self) _ws = self;
        
        [_selectMenu setPageSelectBlock:^(NSInteger index) {
            NSLog(@"++++%ld+++++",index);
            CGRect rect = [_ws.tableView rectForSection:index];
            
            CGFloat offsetY = rect.origin.y - 64;
            
            [_ws.tableView setContentOffset:CGPointMake(0, offsetY) animated:YES];
            
//            _ws.scrollFlag = YES; //打开菜单点击标志，防止滚动代理didScrollView触发
            
        }];
        
        
    }
    
    return _selectMenu;
}
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
       [_tableView addSubview:self.selectMenu];
    }
    
    return _tableView;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [UIView new];
        self.imageArray = @[@"img_1",@"img_2",@"img_3"];
        DetailHeaderView *imageView = [[DetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 184) AndWithImageArray:self.imageArray count:self.imageArray.count];
        imageView.backBlock = ^(NSInteger index) {
            NSLog(@"点击了哪一个%ld",index);
        };
        [_headerView addSubview:imageView];
        _headerView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 250);
        
    }
    
    return _headerView;
}
#pragma mark --- tableView 的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.selectMenu.titleArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.sectionHeaderArray[section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return 200;
//    }else if (section == 1){
//        return 50;
//    }else if (section == 2){
//        return 100;
//    }
    return 44;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
//    self.scrollFlag = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"+++++++%f+++++++=",offsetY);
    if (offsetY > 184-64) {
        NSLog(@"走了");
        //防止多次更改页面层级
        if ([self.selectMenu.superview isEqual:self.view]) {
            
            return;
        }
        
        //加载到view上
        self.selectMenu.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
        [self.view addSubview:self.selectMenu];
    }else{
        //防止多次更改页面层级
        if ([self.selectMenu.superview isEqual:self.tableView]) {
            
            return;
        }
        
        //加载到view上
        self.selectMenu.frame = CGRectMake(0, 196, SCREEN_WIDTH, 44);
        [self.tableView addSubview:self.selectMenu];
    }
}

@end
