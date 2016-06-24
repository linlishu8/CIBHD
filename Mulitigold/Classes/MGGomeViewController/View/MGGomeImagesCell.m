//
//  MGGomeImagesCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/20.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeImagesCell.h"
#import "BannerDataModel.h"

@interface MGGomeImagesCell ()

@property (nonatomic, strong) NSArray *imageItems;
@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;

@end

@implementation MGGomeImagesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self httpRequestBannerImages];
    }
    return self;
}

- (void)httpRequestBannerImages
{
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"keyWord":@"m_index"} path:BannerListPage addressType:YAAddressManagerType1 requestType:YAAPIManagerRequestTypeGet complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSMutableArray *imageItems = [NSMutableArray array];
            for (NSDictionary *orderDict in data[@"result"][@"bannerElements"]) {
                NSError* error;
                BannerImageModel *model = [MTLJSONAdapter modelOfClass:[BannerImageModel class] fromJSONDictionary:orderDict error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                }
                [imageItems addObject:model];
            }
            self.imageItems = imageItems;
        }
    }];
}

- (void)setImageItems:(NSArray *)imageItems
{
    for (NSInteger i = 0; i < [imageItems count]; i++) {
        BannerImageModel *model = imageItems[i];
        UIImageView *imageView = [UIImageView new];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
        [self.contentView addSubview:imageView];
        
        @weakify(self);
        switch (i) {
            case 0:
            {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    @strongify(self);
                    make.left.and.top.and.bottom.equalTo(self.contentView);
                    make.width.equalTo(self.contentView).dividedBy(2);
                }];
                
                [imageView addBorderLayerWithColor:COLORf4f4f4 size:1 borderType:BorderTypeRight];
            }
                break;
            case 1:
            {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    @strongify(self);
                    make.left.equalTo(self.contentView.mas_centerX);
                    make.top.and.right.equalTo(self.contentView);
                    make.height.equalTo(self.contentView).dividedBy(2);
                }];
                
                [imageView addBorderLayerWithColor:COLORf4f4f4 size:1 borderType:BorderTypeBottom];
            }
                break;
            case 2:
            {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    @strongify(self);
                    make.left.equalTo(self.contentView.mas_centerX);
                    make.top.equalTo(self.contentView.mas_centerY);
                    make.bottom.and.right.equalTo(self.contentView);
                }];
            }
                break;
                
            default:
                break;
        }
    }
}

@end
