//
//  MGGoldViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/21.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGoldViewController.h"
#import "MGGoldIncomeCell.h"
#import "MGIncomeModel.h"

@interface MGGoldViewController ()

@property (nonatomic, strong) BaseTableView *tableView;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) MGIncomeModel *incomeModel;

@end

@implementation MGGoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel lableTitleView:@"存金"];
    [self setUpTableView];
}

- (void)setUpTableView
{
    @weakify(self);
    self.tableView = [[BaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView addTableViewRefreshHeader:self selector:@selector(loadNewData)];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.and.right.and.top.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    self.tableView.tableDelegate.sections = ^NSInteger() {
        return 1.0;
    };
    
    //创建cell
    self.tableView.tableDelegate.cellAtIndexPath = ^(id cell, NSIndexPath *indexPath) {
        @strongify(self);
        if (indexPath.section == 0) {
            if (self.incomeModel) {
                MGGoldIncomeCell *cellView = (MGGoldIncomeCell *)cell;
                cellView.incomeModel = self.incomeModel;
            }
        }
    };
    
    //cell高度
    self.tableView.tableDelegate.heightForRow = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return HEIGHT_LFL(87.0);
        }
        return 0.0;
    };
    
    //cell复用标识
    self.tableView.tableDelegate.cellIdentifier = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return @"MGGoldIncomeCell";
        }
        return @"cell";
    };
}

- (void)httpRequestIncome
{
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"property":@"1",@"rateIdentifier":@"0",@"timeLimit":@"0"} path:GoldIncome addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        } else {
            NSLog(@"%@",data[@"responseParams"]);
            NSDictionary *inrate = data[@"responseParams"];
            if (inrate) {
                NSError *error;
                self.incomeModel = [MTLJSONAdapter modelOfClass:[MGIncomeModel class] fromJSONDictionary:inrate error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                } else {
                    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:0];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    [self.tableView.mj_header endRefreshing];
                }
            }
        }
    }];
}

- (void)loadNewData
{
    [self httpRequestIncome];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
