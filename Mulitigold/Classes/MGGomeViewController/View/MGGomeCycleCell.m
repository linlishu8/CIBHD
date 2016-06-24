//
//  MGGomeCycleCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeCycleCell.h"
#import "BannerDataModel.h"

@interface MGGomeCycleCell ()

@property(nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) NSArray *bannerItems;

@end

@implementation MGGomeCycleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:nil placeholderImage:[UIImage imageNamed:@"banner_normal"]];
        self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        self.cycleScrollView.pageControlDotSize = CGSizeMake(8, 8);
        self.cycleScrollView.autoScrollTimeInterval = 5.0;
        [self.contentView addSubview:self.cycleScrollView];
        
        UIButton *codeButton = [UIButton buttonImage:@"MG_Home_QRcode"];
        [self.contentView addSubview:codeButton];
        
        @weakify(self);
        [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.edges.equalTo(self.contentView);
        }];
        
        [codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.equalTo(self.cycleScrollView).offset(25);
            make.right.equalTo(self.cycleScrollView).offset(-15);
            make.width.and.height.equalTo(@(WIDTH_LFL(30)));
        }];
        
        [self httpRequestBannerElements];
    }
    return self;
}

- (void)httpRequestBannerElements
{
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"keyWord":@"ios"} path:BannerListPage addressType:YAAddressManagerType1 requestType:YAAPIManagerRequestTypeGet complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSMutableArray *bannerItems = [NSMutableArray array];
            for (NSDictionary *orderDict in data[@"result"][@"bannerElements"]) {
                NSError* error;
                BannerDataModel *model = [MTLJSONAdapter modelOfClass:[BannerDataModel class] fromJSONDictionary:orderDict error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                }
                [bannerItems addObject:model];
            }
            self.bannerItems = bannerItems;
        }
    }];
}

- (void)setBannerItems:(NSArray *)bannerItems
{
    NSMutableArray *items = [NSMutableArray array];
    for (BannerDataModel *model in bannerItems) {
        [items addObject:model.imgUrl];
    }
    self.cycleScrollView.imageURLStringsGroup = items;
}

- (void)setDelegate:(id<SDCycleScrollViewDelegate>)delegate
{
    self.cycleScrollView.delegate = delegate;
}

@end
