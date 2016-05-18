//
//  MGGomeViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeViewController.h"

@interface MGGomeViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MGGomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self setKeyScrollView:self.tableView scrolOffsetY:600 options:HYHidenControlOptionLeft | HYHidenControlOptionTitle];
    
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
    self.tableView.rowHeight = 100;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.backgroundColor = indexPath.row % 2 ? [UIColor orangeColor]:[UIColor greenColor];
    
    cell.textLabel.text = @"zzzz";
    return cell;
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
