//
//  MyTabbar.h
//  TimingAlarm
//
//  Created by Mac on 2018/8/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

//MyTabBar的代理必须实现addButtonClick，以响应中间“+”按钮的点击事件
@protocol MyTabBarDelegate <NSObject>

-(void)addButtonClick:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar

@property (nonatomic, weak) id<MyTabBarDelegate>myTabBarDelegate;

@end
