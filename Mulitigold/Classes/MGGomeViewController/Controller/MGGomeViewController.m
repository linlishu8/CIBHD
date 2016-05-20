//
//  MGGomeViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeViewController.h"
#import "BannerDataModel.h"
#import "MGGomeDataEngine.h"

@interface MGGomeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) NSMutableArray *bannerItems;

@end

@implementation MGGomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self keyWord:@"ios" complete:^(NSDictionary *data, NSError *error) {
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
            }
//            NSArray *bannerElements = data[@"bannerElements"];
//            for (NSDictionary *dic in bannerElements) {
//                BannerDataModel *model = [MTLJSONAdapter modelOfClass:[BannerDataModel class]
//                                                   fromJSONDictionary:dic
//                                                                error:nil];
//                [self.bannerItems addObject:model];
//            }
        }
        
    }];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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

- (void)setUpTableView
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
