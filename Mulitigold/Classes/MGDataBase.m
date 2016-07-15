//
//  MGDataBase.m
//  Mulitigold
//
//  Created by 动感超人 on 16/7/4.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGDataBase.h"
#import "FMDB.h"
#import "MTLFMDBAdapter.h"

@interface MGDataBase ()

@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation MGDataBase

#pragma mark - shartInstance

+ (instancetype)shareDataBase {
    static MGDataBase *shareDataBase = nil;
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
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"MGDB.sqlite"];
        self.queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    }
    return self;
}

/** 数据库中是否存在表 */
- (BOOL)isExistInTable:(Class)aClass
{
    __block BOOL res = NO;
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *tableName = NSStringFromClass(aClass);
        res = [db tableExists:tableName];
    }];
    return res;
}

/**
 * 创建表
 * 如果已经创建，清空表
 */
- (void)createTable:(Class)aClass
{
    if ([self isExistInTable:aClass]) {
        [self clearTable:aClass];
    } else {
        [self.queue inDatabase:^(FMDatabase *db) {
            if ([db open]) {
                NSString *sql = [MTLFMDBAdapter createTable:NSStringFromClass(aClass) class:aClass];
                handleDbexecuteUpdateSql(db, sql, nil);
            }
        }];
    }
}

/** 清空表 */
- (BOOL)clearTable:(Class)aClass
{
    __block BOOL res = NO;
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *tableName = NSStringFromClass(aClass);
        NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@",tableName];
        res = [db executeUpdate:sql];
        NSLog(res ? @"清空成功" : @"清空失败");
    }];
    return res;
}

/** 查询全部数据 */
- (NSArray *)findAll:(Class)aClass
{
    NSMutableArray *datas = [NSMutableArray array];
    [self.queue inDatabase:^(FMDatabase *db) {
        MTLModel *resultUser = nil;
        NSError *error = nil;
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",NSStringFromClass(aClass)];
        FMResultSet *resultSet = [db executeQuery:sql];
        while ([resultSet next]) {
            resultUser = [MTLFMDBAdapter modelOfClass:aClass fromFMResultSet:resultSet error:&error];
            [datas addObject:resultUser];
            FMDBRelease(resultUser);
        }
    }];
    
    return datas;
}

- (void)insertModel:(MTLModel<MTLFMDBSerializing> *)model {
    [self insertModel:model completion:nil];
}


- (void)insertModel:(MTLModel<MTLFMDBSerializing> *)model completion:(void(^)(BOOL success))completion {
    [self.queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = [MTLFMDBAdapter insertStatementForModel:model];
            NSArray *parameters = [MTLFMDBAdapter columnValues:model];
            handleDbexecuteUpdateSqlwithArgumentsInArray(db, sql, parameters, completion);
        }
    }];
}

- (void)deleteModel:(MTLModel<MTLFMDBSerializing> *)model fromTable:(NSString *)tableName {
    [self deleteModel:model fromTable:tableName completion:nil];
}
- (void)deleteModel:(MTLModel<MTLFMDBSerializing> *)model fromTable:(NSString *)tableName completion:(void(^)(BOOL success))completion {
    [self.queue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString * sql = [MTLFMDBAdapter deleteStatementForModel:model fromTable:tableName];
            NSArray * parameters = [MTLFMDBAdapter primaryKeysValues:model];
            handleDbexecuteUpdateSqlwithArgumentsInArray(db, sql, parameters, completion);
        }
    }];
}

#pragma mark - private C founctions

void handleDbexecuteUpdateSql(FMDatabase *db ,NSString *sql ,void(^completion)(BOOL success)) {
    BOOL success = [db executeUpdate:sql];
    handleOperationResultAndSql(success, sql ,completion);
}

void handleDbexecuteUpdateSqlwithArgumentsInArray(FMDatabase *db ,NSString *sql ,NSArray *arguments ,void(^completion)(BOOL success)) {
    BOOL success = [db executeUpdate:sql withArgumentsInArray:arguments];
    handleOperationResultAndSql(success, sql, completion);
}

void handleOperationResultAndSql(BOOL success ,NSString *sql ,void(^completion)(BOOL success)) {
    if (success) {
        NSLog(@"sql:%@\n操作成功",sql);
    } else {
        NSLog(@"sql:%@\n操作失败",sql);
    }
    
    if (completion) {
        completion(success);
    }
}


@end
