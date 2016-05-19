//
//  ACTableViewDelegte.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/19.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "ACTableViewDelegte.h"
#import "UITableView+FDTemplateLayoutCell.h"

@implementation ACTableViewDelegte

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:self.cellIdentifier(indexPath) configuration:^(id cell) {
//        cell.entity = self.feedEntities[indexPath.row];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections();
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rows(section);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = self.cellIdentifier(indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    return cell;
}

@end
