//
//  SSQTextFieldCell.m
//  SSQian
//
//  Created by miles on 2018/8/30.
//  Copyright © 2018年 bestsign. All rights reserved.
//

#import "SSQTextFieldCell.h"

@implementation SSQTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.backgroundColor = [UIColor whiteColor];
}
- (IBAction)fieldEditEnd:(id)sender {
    if (self.textFielfEditEnd) {
        self.textFielfEditEnd(_textField.text);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
