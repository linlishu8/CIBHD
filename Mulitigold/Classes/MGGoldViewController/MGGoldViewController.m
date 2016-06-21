//
//  MGGoldViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/21.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGoldViewController.h"
#import "MJRefresh.h"
#import "BaseRefreshHeader.h"


@interface MGGoldViewController ()

@property (nonatomic, strong) BaseTableView *tableView;

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
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.and.right.and.top.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    self.tableView.mj_header = [BaseRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
