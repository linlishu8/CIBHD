//
//  MGGomeViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeViewController.h"
#import "BannerDataModel.h"
#import "MGGomeCycleCell.h"
#import "MGGomeMenuCell.h"
#import "MGGomeCellFootView.h"

@interface MGGomeViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) BaseTableView *tableView;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) NSMutableArray *bannerItems;


@end

@implementation MGGomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"keyWord":@"ios"} path:BannerListPage addressType:YAAddressManagerType1 requestType:YAAPIManagerRequestTypeGet complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSLog(@"%@",data[@"result"][@"bannerElements"]);
            self.bannerItems = [NSMutableArray array];
            for (NSDictionary *orderDict in data[@"result"][@"bannerElements"]) {
                NSError* error;
                BannerDataModel *model = [MTLJSONAdapter modelOfClass:[BannerDataModel class] fromJSONDictionary:orderDict error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                }
                [self.bannerItems addObject:model];
                [self.tableView reloadData];
            }
        }
    }];
}

- (void)setUpTableView
{
    self.tableView = [[BaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.tableDelegate.heightForFooter = ^(NSInteger section) {
        if (section == 0) {
            return HEIGHT_LFL(60.0);
        }
        return 0.0;
    };
    
    self.tableView.tableDelegate.viewForFooter = ^(NSInteger section) {
        return [MGGomeCellFootView setupFootView];
    };
    
    self.tableView.tableDelegate.sections = ^NSInteger() {
        return 2.0;
    };
    
    //创建cell
    @weakify(self);
    self.tableView.tableDelegate.cellAtIndexPath = ^(id cell, NSIndexPath *indexPath) {
        @strongify(self);
        if (indexPath.section == 0) {
            MGGomeCycleCell *cycleCell = (MGGomeCycleCell *)cell;
            cycleCell.bannerItems = self.bannerItems;
            cycleCell.delegate = self;
        } else if (indexPath.section == 1) {
            MGGomeMenuCell *cycleCell = (MGGomeMenuCell *)cell;
            [cycleCell setButtons:@[@"卖金",@"提金",@"充值",@"提现",@"金价走势",
                                   @"黄金贷",@"银行卡",@"每日签到"] clickItemBlock:^(NSInteger tag) {
                                       NSLog(@"%ld",(long)tag);
                                   }];
        }
    };
    
    //cell高度
    self.tableView.tableDelegate.heightForRow = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return HEIGHT_LFL(150.0);
        } else if (indexPath.section == 1) {
            return HEIGHT_LFL(160.0);
        }
        return 0.0;
    };
    
    //cell复用标识
    self.tableView.tableDelegate.cellIdentifier = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return @"MGGomeCycleCell";
        } else if (indexPath.section == 1) {
            return @"MGGomeMenuCell";
        }
        return @"cell";
    };
    
    [self setKeyScrollView:self.tableView scrolOffsetY:HEIGHT_LFL(150.0) options:HYHidenControlOptionLeft | HYHidenControlOptionTitle];
    
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
