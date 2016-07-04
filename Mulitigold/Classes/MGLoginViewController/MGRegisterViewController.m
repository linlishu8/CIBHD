//
//  MGRegisterViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/29.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGRegisterViewController.h"

@interface MGRegisterViewController ()

@end

@implementation MGRegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [UILabel lableTitleView:@"注册"];
    
    [self initViews];
}

- (void)initViews
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    scrollView.pagingEnabled = NO;
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        
        // 让scrollview的contentSize随着内容的增多而变化
//        make.bottom.mas_equalTo(registerButton.mas_bottom).offset(20);
    }];
    
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
