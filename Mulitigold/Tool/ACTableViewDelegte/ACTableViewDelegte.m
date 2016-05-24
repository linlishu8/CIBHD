//
//  ACTableViewDelegte.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/19.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "ACTableViewDelegte.h"

@implementation ACTableViewDelegte

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.heightForRow(indexPath);
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
        cell = [[NSClassFromString(self.cellIdentifier(indexPath)) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier(indexPath)];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    self.cellAtIndexPath(cell, indexPath);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectRow(indexPath);
}

@end
