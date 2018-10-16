//
//  Remark.h
//  TimingAlarm
//
//  Created by 董志盟 on 2018/10/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Remark : NSObject

@property(nonatomic,copy)   NSString *title;
@property(nonatomic,assign) BOOL isNotification;
@property(nonatomic,strong) NSString *date;
@property(nonatomic,strong) NSString *detail;

@end

NS_ASSUME_NONNULL_END
