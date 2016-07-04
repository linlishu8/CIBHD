//
//  MGDataBase.m
//  Mulitigold
//
//  Created by 动感超人 on 16/7/4.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGDataBase.h"
#import "FMDB.h"

@interface MGDataBase ()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation MGDataBase

#pragma mark - shartInstance

+ (instancetype)shareDataBase{
    static MGDataBase * shareDataBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareDataBase = [[MGDataBase alloc]init];
    });
    return shareDataBase;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        // Sets the database filename
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"MTLFMDBTests.sqlite"];
        
        // Tell FMDB where the database is
        self.db = [FMDatabase databaseWithPath:filePath];
    }
    return self;
}

- (void)createTables
{

}


@end
