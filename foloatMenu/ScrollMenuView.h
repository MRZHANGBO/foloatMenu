//
//  ScrollMenuView.h
//  foloatMenu
//
//  Created by jx on 2018/10/16.
//  Copyright © 2018年 jx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollMenuView : UIView
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,assign) NSInteger currentPage; //当前的页码
@property (nonatomic,copy) void (^pageSelectBlock)(NSInteger curPage); //菜单选择回调
@end
