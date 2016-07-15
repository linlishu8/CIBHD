//
//  MGGoldViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/21.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGoldViewController.h"
#import "MGGoldIncomeCell.h"
#import "MGUserNewsCell.h"
#import "MGIncomeModel.h"
#import "MGLoginViewController.h"
#import "BaseNavigationController.h"

@interface MGGoldViewController ()

@property (nonatomic, strong) BaseTableView *tableView;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) MGIncomeModel *incomeModel;
@property (nonatomic, strong) NSArray *useNews;

@end

@implementation MGGoldViewController
{
    BOOL isComplete;//两个请求一个是否完成
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel lableTitleView:@"存金"];
    isComplete = NO;
    
    [self setUpTableView];
}

- (void)setUpTableView
{
    @weakify(self);
    self.tableView = [[BaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView addTableViewRefreshHeader:self selector:@selector(loadNewData)];
    [self.view addSubview:self.tableView];
    
    //取本地
    NSArray *items = [[MGDataBase shareDataBase] findAll:[MGForUseNewModel class]];
    if ([items count] > 0) {
        self.useNews = items;
        [self.tableView reloadData];
    }
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.tableDelegate.sections = ^NSInteger() {
        return 2.0;
    };
    
    self.tableView.tableDelegate.rows = ^NSInteger(NSInteger section) {
        @strongify(self);
        if (section == 0) {
            return 1;
        } else {
            if ([self.useNews count] > 0) {
                return [self.useNews count];
            }
            return 0;
        }
    };
    
    //创建cell
    self.tableView.tableDelegate.cellAtIndexPath = ^(id cell, NSIndexPath *indexPath) {
        @strongify(self);
        if (indexPath.section == 0) {
            if (self.incomeModel) {
                MGGoldIncomeCell *cellView = (MGGoldIncomeCell *)cell;
                cellView.incomeModel = self.incomeModel;
            }
        } else {
            if ([self.useNews count] > indexPath.row) {
                MGUserNewsCell *cellView = (MGUserNewsCell *)cell;
                cellView.newsModel = self.useNews[indexPath.row];
            }
        }
    };
    
    //cell高度
    self.tableView.tableDelegate.heightForRow = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return HEIGHT_LFL(100.0);
        }
        return 186.0;
    };
    
    //cell复用标识
    self.tableView.tableDelegate.cellIdentifier = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return @"MGGoldIncomeCell";
        }
        return @"MGUserNewsCell";
    };
    
    self.tableView.tableDelegate.selectRow = ^(NSIndexPath *path) {
        @strongify(self);
        [MBProgressHUD showMBProgressHUD:self.navigationController.view];
        [[MGUserInformation sharedInstance] goldAccountInformationQuery:^(MGAccountModel *model) {
            [MBProgressHUD hideMBProgressHUD:self.navigationController.view];
            if ([model.rntCode isEqualToString:@"UserNotLogin"]) {
                MGLoginViewController *loginView = [[MGLoginViewController alloc] init];
                BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:loginView];
                [self presentViewController:nav animated:YES completion:nil];
            } else {
            
            }
        }];
    };
}

- (void)httpRequestIncome
{
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"property":@"1",@"rateIdentifier":@"0",@"timeLimit":@"0"} path:GoldIncome addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        } else {
            NSDictionary *inrate = data[@"responseParams"];
            if (inrate) {
                NSError *error;
                self.incomeModel = [MTLJSONAdapter modelOfClass:[MGIncomeModel class] fromJSONDictionary:inrate error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                } else {
                    if (isComplete) {
                        [self.tableView reloadData];
                        [self.tableView.mj_header endRefreshing];
                    } else {
                        isComplete = YES;
                    }
                }
            }
        }
    }];
}

- (void)httpRequestForUseNew
{
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"channelId":@"21"} path:DetailForUseNew addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        } else {
            NSMutableArray *useNews = [NSMutableArray array];
            [[MGDataBase shareDataBase] createTable:[MGForUseNewModel class]];//取本地
            
            for (NSDictionary *orderDict in data[@"responseParams"]) {
                NSError* error;
                MGForUseNewModel *model = [MTLJSONAdapter modelOfClass:[MGForUseNewModel class] fromJSONDictionary:orderDict error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                } else {
                    [[MGDataBase shareDataBase] insertModel:model];//取本地
                    [useNews addObject:model];
                }
            }
            if ([useNews count] > 0) {
                self.useNews = useNews;
                if (isComplete) {
                    [self.tableView reloadData];
                    [self.tableView.mj_header endRefreshing];
                } else {
                    isComplete = YES;
                }
            }
        }
    }];
}

- (void)loadNewData
{
    [self.gomeDataEngine cancelRequest];
    
    [self httpRequestIncome];
    [self httpRequestForUseNew];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
