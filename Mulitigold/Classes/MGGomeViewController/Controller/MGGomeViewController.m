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
#import "MGGomeImagesCell.h"
#import "MGGomePriceCell.h"

@interface MGGomeViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) BaseTableView *tableView;


@end

@implementation MGGomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    self.tableView.tableDelegate.heightForHeader = ^(NSInteger section) {
        if (section == 2) {
            return HEIGHT_LFL(10.0);
        }
        return 0.0;
    };
    
    self.tableView.tableDelegate.viewForHeader = ^(NSInteger section) {
        if (section == 2) {
            UIView *view = [[UIView alloc] init];
            [view setBackgroundColor:COLORf4f4f4];
            return view;
        }
        return [[UIView alloc] init];
    };
    
    self.tableView.tableDelegate.heightForFooter = ^(NSInteger section) {
        if (section == 2) {
            return HEIGHT_LFL(10.0);
        }
        return 0.0;
    };
    
    self.tableView.tableDelegate.viewForFooter = ^(NSInteger section) {
        if (section == 2) {
            UIView *view = [[UIView alloc] init];
            [view setBackgroundColor:COLORf4f4f4];
            return view;
        }
        return [[UIView alloc] init];
    };
    
    self.tableView.tableDelegate.sections = ^NSInteger() {
        return 5.0;
    };
    
    //创建cell
    self.tableView.tableDelegate.cellAtIndexPath = ^(id cell, NSIndexPath *indexPath) {
        @strongify(self);
        if (indexPath.section == 0) {
            MGGomeCycleCell *cellView = (MGGomeCycleCell *)cell;
            cellView.delegate = self;
        } else if (indexPath.section == 2) {
            MGGomeMenuCell *cellView = (MGGomeMenuCell *)cell;
            [cellView setButtons:@[@"卖金",@"提金",@"充值",@"提现",@"金价走势",
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
            return HEIGHT_LFL(60.0);
        } else if (indexPath.section == 2) {
            return HEIGHT_LFL(160.0);
        } else if (indexPath.section == 3) {
            return HEIGHT_LFL(210.0);
        } else if (indexPath.section == 4) {
            return HEIGHT_LFL(90.0);
        }
        return 0.0;
    };
    
    //cell复用标识
    self.tableView.tableDelegate.cellIdentifier = ^(NSIndexPath *indexPath) {
        if (indexPath.section == 0) {
            return @"MGGomeCycleCell";
        } else if (indexPath.section == 1) {
            return @"MGGomePriceCell";
        } else if (indexPath.section == 2) {
            return @"MGGomeMenuCell";
        } else if (indexPath.section == 3) {
            return @"MGGomeImagesCell";
        } else if (indexPath.section == 4) {
            return @"MGGomeLogoCell";
        }
        return @"cell";
    };
    
    [self setKeyScrollView:self.tableView scrolOffsetY:HEIGHT_LFL(100.0) options:HYHidenControlOptionRight | HYHidenControlOptionTitle];
    
    self.navigationItem.titleView = [UILabel lableFrame:CGRectMake(0, 0, WIDTH_LFL(200), HEIGHT_LFL(30)) text:@"国美黄金" font:SYSTEMFONT(20.0) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithFrame:CGRectMake(0, 0, WIDTH_LFL(20), HEIGHT_LFL(20)) Image:@"MG_Home_QRcode2" actionBlock:^{
        NSLog(@"二维码啦");
    }]];
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
