//
//  ShowAlarmViewController.m
//  TimingAlarm
//
//  Created by Mac on 2018/8/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ShowAlarmViewController.h"
#import "ShowAlarmOneTableViewCell.h"
#import "ShowAlarmTwoTableViewCell.h"

#import "Remark.h"

@interface ShowAlarmViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ShowAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.mTableView registerNib:[UINib nibWithNibName:@"ShowAlarmTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ShowAlarmTwoTableViewCell"];
    [self.mTableView registerNib:[UINib nibWithNibName:@"ShowAlarmOneTableViewCell" bundle:nil] forCellReuseIdentifier:@"ShowAlarmOneTableViewCell"];
    self.mTableView.tableFooterView = [UIView new];
    self.mTableView.rowHeight = 60;
    _mTableView.editing = YES;
    self.mTableView.contentInset=UIEdgeInsetsMake(kScreenHeight * 0.2, 0, 0, 0);
    
    self.myImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, - kScreenHeight * 0.2, kScreenWidth, kScreenHeight * 0.2)];
    self.myImageView.contentMode=UIViewContentModeScaleAspectFill;
    self.myImageView.image=[UIImage imageNamed:@"tableViewHeader"];
    self.myImageView.layer.masksToBounds = YES;
    
    [self.mTableView addSubview:self.myImageView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getDataArr];
}

- (void)getDataArr
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    //    判断文件是否存在，不存在则直接创建，存在则直接取出文件中的内容
    if ([fileM fileExistsAtPath:filePath]) {
        _dataArr = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        [self.mTableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShowAlarmOneTableViewCell *cellOne = [tableView dequeueReusableCellWithIdentifier:@"ShowAlarmOneTableViewCell"];
    Remark *re = [_dataArr objectAtIndex:indexPath.row];
    cellOne.title.text = re.title;
    cellOne.time.text = re.date;
    cellOne.switchCell.on = re.isNotification;
    return cellOne;
}

// 设置 cell 是否允许移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}
// 移动 cell 时触发
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    // 移动cell之后更换数据数组里的循序
    [self.dataArr exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
    [NSKeyedArchiver archiveRootObject:_dataArr toFile:filePath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**   点击 删除 按钮的操作 */
    if (editingStyle == UITableViewCellEditingStyleDelete) { /**< 判断编辑状态是删除时. */
        
        /** 1. 更新数据源(数组): 根据indexPaht.row作为数组下标, 从数组中删除数据. */
        [self.dataArr removeObjectAtIndex:indexPath.row];
        
        /** 2. TableView中 删除一个cell. */
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
        [NSKeyedArchiver archiveRootObject:_dataArr toFile:filePath];
    }

}

#pragma mark- 当TableView被拖动时就会触发父类ScrollView的方法，可以在这里实现图片的放大及缩小
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point=scrollView.contentOffset;
    if (point.y<0) {
        CGRect rect=self.myImageView.frame;
        rect.origin.y=point.y;
        rect.size.height=-point.y;
        self.myImageView.frame=rect;
    }
}


@end
