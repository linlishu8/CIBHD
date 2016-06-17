//
//  MGLoginViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/14.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGLoginViewController.h"

@interface MGLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation MGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)initViews
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    scrollView.pagingEnabled = NO;
    [self.view addSubview:scrollView];
    
    
    @weakify(self);
    UIButton *closeButton = [UIButton buttonImage:@"MG_Login_close"];
    [closeButton addActionHandler:^(NSInteger tag) {
        @strongify(self);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [scrollView addSubview:closeButton];
    
    UIButton *headButton = [UIButton buttonImage:@"MG_Login_head"];
    [headButton addActionHandler:^(NSInteger tag) {
        @strongify(self);
        [self updateUserHeadImage];
    }];
    [scrollView addSubview:headButton];
    
    UIView *nameTextField = [UIView new];
    [scrollView addSubview:nameTextField];
    
    nameTextField = [UIView textFieldAndLabelView:nameTextField
                                        labelText:@"账号"
                                  placeholderText:@"请输入手机号/黄金卡号"
                                     isSecureText:NO
                                           target:self];
    
    UIView *pwdTextField = [UIView new];
    [scrollView addSubview:pwdTextField];
    
    pwdTextField = [UIView textFieldAndLabelView:pwdTextField
                                        labelText:@"密码"
                                  placeholderText:@"请输入8~16位登录密码"
                                     isSecureText:YES
                                          target:self];
    
    self.loginButton = [UIButton buttonText:@"登录" font:SYSTEMFONT(15.0) textColor:[UIColor whiteColor]];
    [self.loginButton setBackgroundColor:COLOR1f81c2];
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 4;
    [scrollView addSubview:self.loginButton];
    
    
    UIButton *forgetButton = [UIButton buttonText:@"忘记密码？" font:SYSTEMFONT(14.0) textColor:COLOR333333];
    [scrollView addSubview:forgetButton];
    
    UIButton *registerButton = [UIButton buttonText:@"注册" font:SYSTEMFONT(14.0) textColor:COLOR333333];
    [scrollView addSubview:registerButton];
    /**
     *  布局
     */
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(38);
        make.size.mas_equalTo(CGSizeMake(WIDTH_LFL(16), HEIGHT_LFL(16)));
    }];
    [headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(closeButton.mas_bottom).offset(42);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.and.height.equalTo(@(WIDTH_LFL(60)));
    }];
    
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(headButton.mas_bottom).offset(22);
        make.height.equalTo(@(HEIGHT_LFL(45)));
    }];
    [pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.height.equalTo(nameTextField);
        make.top.equalTo(nameTextField.mas_bottom);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(pwdTextField.mas_bottom).offset(24);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@(HEIGHT_LFL(43)));
    }];
    
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.loginButton.mas_bottom).offset(20);
        make.width.equalTo(@(HEIGHT_LFL(70)));
        make.height.equalTo(@(HEIGHT_LFL(20)));
    }];
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(forgetButton);
        make.width.equalTo(@(HEIGHT_LFL(30)));
        make.height.equalTo(@(HEIGHT_LFL(20)));
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        
        // 让scrollview的contentSize随着内容的增多而变化
//        make.bottom.mas_equalTo(lastLabel.mas_bottom).offset(20);
    }];
    
    
    [nameTextField addBorderLayerWithColor:COLORf4f4f4 size:1 borderType:BorderTypeBottom];//分割线
    [pwdTextField addBorderLayerWithColor:COLORf4f4f4 size:1 borderType:BorderTypeBottom];//分割线
}

- (void)updateUserHeadImage
{

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
