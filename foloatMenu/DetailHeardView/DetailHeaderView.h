//
//  DetailHeaderView.h
//  foloatMenu
//
//  Created by jx on 2018/10/17.
//  Copyright © 2018年 jx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeaderView : UIView
-(instancetype)initWithFrame:(CGRect)frame AndWithImageArray:(NSArray *)array count:(NSInteger)count;
@property(copy,nonatomic) void(^backBlock)(NSInteger index);
@end
