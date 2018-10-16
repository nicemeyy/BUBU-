//
//  AlarmViewController.m
//  TimingAlarm
//
//  Created by Mac on 2018/8/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "AlarmViewController.h"
#import "RemarkViewController.h"

#import "AlarmAlterView.h"
#import "SleepCycleView.h"
#import "SSQSwitchCell.h"

#import "Remark.h"

@interface AlarmViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,RemarkViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (nonatomic, strong) NSArray *arrayTitle;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, copy) NSString *subtitleAlarmName,*subtitleAlarmTitle,*subtitleSleep;

@property (nonatomic, strong) NSMutableArray *arrayData;

@property (nonatomic, assign) BOOL notification;

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加事项";
    
    self.arrayTitle = @[@"标题",@"响铃",@"备注"];
    
    self.mTableView.tableFooterView = [[UIView alloc] init];
    [self.mTableView registerNib:[UINib nibWithNibName:@"SSQSwitchCell" bundle:nil] forCellReuseIdentifier:@"SSQSwitchCell"];
    self.arrayData = [[NSMutableArray alloc] initWithCapacity:0];
    
    _notification = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mTableView reloadData];
}

#pragma mark tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayTitle.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        static NSString *string = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
        }
        cell.textLabel.text = self.arrayTitle[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.detailTextLabel.text = self.subtitleAlarmName;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
    } else if (indexPath.row == 1){
        SSQSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SSQSwitchCell"];
        cell.switchOrderBlock = ^(BOOL isOrder) {
            _notification = isOrder;
        };
        return cell;
    } else {
        static NSString *string = @"indentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
        }
        cell.textLabel.text = self.arrayTitle[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 2) {
            cell.detailTextLabel.text = self.bremark;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"输入闹钟标题" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"OK", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        self.textField = [alert textFieldAtIndex:0];
        self.textField.placeholder = @"标题";
        self.textField.keyboardType = UIKeyboardTypeNamePhonePad;
        [alert show];
        
    }else if (indexPath.row == 1) {
        
//        AlarmAlterView *alarmView = [AlarmAlterView alterView];
//        alarmView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight + 400);
//        alarmView.topView.backgroundColor = [UIColor clearColor];
//        alarmView.backgroundColor = [UIColor clearColor];
//        alarmView.arrayData = self.arrayData;
//        [shareAppdelegate.window addSubview:alarmView];
//
//        __weak typeof(self)weakSelf = self;
//        alarmView.blockAlarm = ^(NSString *string, NSMutableArray *array) {
//            weakSelf.arrayData = array;
//            weakSelf.subtitleAlarmTitle = string;
//            [weakSelf.mTableView reloadData];
//        };
//
//        [UIView animateWithDuration:0.3 animations:^{
//            alarmView.top = -400;
//            alarmView.topView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
//        }];

    }else if (indexPath.row == 2){
//        SleepCycleView *alarmView = [SleepCycleView alterView];
//        alarmView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight + 400);
//        alarmView.topView.backgroundColor = [UIColor clearColor];
//        alarmView.backgroundColor = [UIColor clearColor];
//        [shareAppdelegate.window addSubview:alarmView];
//
//        __weak typeof(self)weakSelf = self;
//        alarmView.blockPickerRow = ^(NSString *rowData) {
//            weakSelf.subtitleSleep = rowData;
//            [weakSelf.mTableView reloadData];
//        };
//        [UIView animateWithDuration:0.3 animations:^{
//            alarmView.top = -400;
//            alarmView.topView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
//        }];
        RemarkViewController *VC = [[RemarkViewController alloc] init];
        VC.delegate = self;
        [self presentViewController:VC animated:YES completion:nil];
    }
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    if (self.textField.text.length > 0) {
        return YES;
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        self.subtitleAlarmName = self.textField.text;
        if (self.subtitleAlarmName.length > 0) {
            [self.mTableView reloadData];
        }
    }
}

- (void)sendValue:(NSString *)value
{
    _bremark = value;
}

- (IBAction)saveClick:(id)sender {
    
    if(_subtitleAlarmName.length <= 0 || !_subtitleAlarmName){
        return;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    //    判断文件是否存在，不存在则直接创建，存在则直接取出文件中的内容
    if (![fileM fileExistsAtPath:filePath]) {
        [fileM createFileAtPath:filePath contents:nil attributes:nil];
    }
    NSMutableArray *chatLogArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if ((chatLogArray.count == 0)) {
        chatLogArray = [NSMutableArray arrayWithCapacity:1];
    }
    
    //    要保存的自定义模型
    Remark *chatmodel = [[Remark alloc] init];
    chatmodel.title = _subtitleAlarmName;
    chatmodel.isNotification = _notification;
    chatmodel.detail = _bremark;
    //    获取当前时间
    NSDate *currentDate = _datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd hh:mm:ss"];
    NSString *dateString = [formatter stringFromDate:currentDate];
    chatmodel.date = dateString;
    
    [chatLogArray addObject:chatmodel];
    
    
    //    注意 数组中保存的是自定义模型，要想把数组保存在文件中，应该用下面的方法
    //    存
    [NSKeyedArchiver archiveRootObject:chatLogArray toFile:filePath];
    //    取
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
