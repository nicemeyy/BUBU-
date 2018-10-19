//
//  SSQTextFieldCell.h
//  SSQian
//
//  Created by miles on 2018/8/30.
//  Copyright © 2018年 bestsign. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSQTextFieldCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (copy, nonatomic) void(^textFielfEditEnd)(NSString *);
@end
