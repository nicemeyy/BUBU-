//
//  AlarmViewController.h
//  TimingAlarm
//
//  Created by Mac on 2018/8/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseViewController.h"

@interface AlarmViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSDate  *date;
@property (nonatomic, copy) NSString *bremark;

@end
