//
//  RemarkViewController.m
//  TimingAlarm
//
//  Created by 董志盟 on 2018/10/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "RemarkViewController.h"
#import "AlarmViewController.h"

@interface RemarkViewController ()
@property (strong, nonatomic) IBOutlet UIButton *cancalBtn;
@property (strong, nonatomic) IBOutlet UIButton *saveBtn;
@property (strong, nonatomic) IBOutlet UITextView *remartTextView;

@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _remartTextView.limitLength = @300;
    _remartTextView.placeholder = @"请输入您的备注内容";
    _remartTextView.placeholdColor = [UIColor lightGrayColor];
    _remartTextView.limitPlaceColor = [UIColor lightGrayColor];
    _remartTextView.placeholdFont = [UIFont systemFontOfSize:17];
    _remartTextView.limitPlaceFont = [UIFont systemFontOfSize:17];
    _remartTextView.font = [UIFont systemFontOfSize:17];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

- (void)keyboardHide:(UITapGestureRecognizer *)tap
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (IBAction)cancalClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveClick:(id)sender {
    [self.delegate sendValue:_remartTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
