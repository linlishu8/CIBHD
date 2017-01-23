//
//  MGGoldViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGGoldViewController.h"
#import "MGGoldViewModel.h"
#import "SDCycleScrollView.h"

@interface MGGoldViewController () <SDCycleScrollViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong, readonly) MGGoldViewModel *viewModel;

@end

@implementation MGGoldViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [UIScrollView new];
    [scrollView setBackgroundColor:[UIColor redColor]];
    [scrollView setContentSize:CGSizeMake(0, 1000)];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    [self setKeyScrollView:scrollView scrolOffsetY:150 options:MGHidenControlOptionLeft | MGHidenControlOptionRight];

    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [scrollView addSubview:cycleScrollView];
    
    @weakify(self);
    [RACObserve(self.viewModel, models) subscribeNext:^(id x) {
        @strongify(self);
        
    }];
    
    
}

#pragma mark SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {

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
