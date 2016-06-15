//
//  MGLoginViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/14.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGLoginViewController.h"

@interface MGLoginViewController ()

@end

@implementation MGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addPresentModalBack];
}

- (void)addPresentModalBack
{
    @weakify(self);
    UIButton *closeButton = [UIButton buttonImage:@"MG_Login_close"];
    [closeButton addActionHandler:^(NSInteger tag) {
        @strongify(self);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.view addSubview:closeButton];
    
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(38);
        make.size.mas_equalTo(CGSizeMake(15, 14));
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
