//
//  SSQSwitchCell.h
//  SSQian
//
//  Created by miles on 2018/8/30.
//  Copyright © 2018年 bestsign. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSQSwitchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *questionBtn;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@property (nonatomic,copy) void(^switchOrderBlock)(BOOL);
@property (nonatomic,copy) void(^questionClickBlock)(id);
@end
