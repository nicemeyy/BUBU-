//
//  RemarkViewController.h
//  TimingAlarm
//
//  Created by 董志盟 on 2018/10/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseViewController.h"

@protocol RemarkViewControllerDelegate <NSObject>

- (void)sendValue:(NSString *)value; //声明协议方法
@end

NS_ASSUME_NONNULL_BEGIN

@interface RemarkViewController : BaseViewController

@property (nonatomic, weak)id <RemarkViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
