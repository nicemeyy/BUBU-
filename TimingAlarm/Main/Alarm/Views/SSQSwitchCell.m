//
//  SSQSwitchCell.m
//  SSQian
//
//  Created by miles on 2018/8/30.
//  Copyright © 2018年 bestsign. All rights reserved.
//

#import "SSQSwitchCell.h"

@implementation SSQSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.switchBtn.onTintColor = kColorActionBlue;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (IBAction)questionClick:(id)sender {
    if (self.questionClickBlock) {
        self.questionClickBlock(sender);
    }
}
- (IBAction)SwitchClick:(id)sender {
    BOOL isButtonOn = [self.switchBtn isOn];
    if (isButtonOn) {
        
        NSLog(@"开");
    }else {
        NSLog(@"关");
    }
    if (self.switchOrderBlock) {
        self.switchOrderBlock(isButtonOn);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
