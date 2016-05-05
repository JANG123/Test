//
//  ReleaseObtainDataTool.m
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ReleaseObtainDataTool.h"
static ReleaseObtainDataTool *rd;
@implementation ReleaseObtainDataTool

//单例初始化工具类
+(ReleaseObtainDataTool *)shareReleaseData
{
    static dispatch_once_t once_token;
    if (rd == nil) {
        dispatch_once(&once_token, ^{
            rd = [[ReleaseObtainDataTool alloc]init];
        });
    }
    return rd;
}

//发布货源
-(BOOL)podShareCargoInfo:(CargoInfo *)aCargoInfo;
{
    AVObject *postCargoInfo = [AVObject objectWithClassName:@"CargoInfo"];

    [postCargoInfo setObject:aCargoInfo.shipperID forKey:@"shipperID"];
    [postCargoInfo setObject:aCargoInfo.origin forKey:@"origin"];
    [postCargoInfo setObject:aCargoInfo.destination forKey:@"destination"];
    [postCargoInfo setObject:aCargoInfo.note forKey:@"note"];
    [postCargoInfo setObject:aCargoInfo.truckType forKey:@"truckType"];
    [postCargoInfo setObject:aCargoInfo.length forKey:@"length"];
    [postCargoInfo setObject:aCargoInfo.number forKey:@"number"];
    [postCargoInfo setObject:aCargoInfo.load forKey:@"load"];
    [postCargoInfo setObject:aCargoInfo.volume forKey:@"volume"];
    [postCargoInfo setObject:aCargoInfo.price forKey:@"price"];
    [postCargoInfo setObject:aCargoInfo.phoneNumber forKey:@"phoneNumber"];
    [postCargoInfo setObject:aCargoInfo.sendTime forKey:@"sendTime"];
    [postCargoInfo setObject:@"未接单" forKey:@"orderState"];
    
    NSError *error = [[NSError alloc]init];
    if ([postCargoInfo save:&error]) {
        return YES;
    }else{
        return NO;
    }
    
}

//获取车源
-(void)getShareOption:(NSString *)location PassValue:(PassValue)passValue
{
    NSMutableArray *tempArr = [NSMutableArray array];
    AVQuery *priorityQuery = [AVQuery queryWithClassName:@"Option"];
    [priorityQuery whereKey:@"origin" equalTo:location];
    
    AVQuery *stateQuery = [AVQuery queryWithClassName:@"Option"];
    [stateQuery whereKey:@"carState" equalTo:@"未预约"];
    
    AVQuery *query = [AVQuery andQueryWithSubqueries:[NSArray arrayWithObjects:stateQuery,priorityQuery,nil]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            for (AVQuery *q in objects) {
                Options *aOptions= [[Options alloc]init];
                aOptions.driverID = [q valueForKey:@"driverID"];
                aOptions.origin = [q valueForKey:@"origin"];
                aOptions.destination = [q valueForKey:@"destination"];
                aOptions.note = [q valueForKey:@"note"];
                aOptions.truckType = [q valueForKey:@"truckType"];
                aOptions.length = [q valueForKey:@"length"];
                aOptions.number = [q valueForKey:@"number"];
                aOptions.load = [q valueForKey:@"load"];
                aOptions.volume = [q valueForKey:@"volume"];
                aOptions.time = [q valueForKey:@"time"];
                aOptions.sendTime = [q valueForKey:@"sendTime"];
                aOptions.objectId = [q valueForKey:@"objectId"];
                aOptions.carState = [q valueForKey:@"carState"];
                [tempArr addObject:aOptions];
            }
            passValue(tempArr);
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

//查询车源
-(void)getShareOptionWithOrigin:(NSString *)origin Destination:(NSString *)destination PassValue:(PassValue)passValue
{
    NSMutableArray *tempArr = [NSMutableArray array];
    
    
    AVQuery *priorityQuery = [AVQuery queryWithClassName:@"Option"];
    [priorityQuery whereKey:@"origin" equalTo:origin];
    
    AVQuery *statusQuery = [AVQuery queryWithClassName:@"Option"];
    [statusQuery whereKey:@"destination" equalTo:destination];
    
    AVQuery *stateQuery = [AVQuery queryWithClassName:@"Option"];
    [stateQuery whereKey:@"carState" equalTo:@"未预约"];
    
    AVQuery *query = [AVQuery andQueryWithSubqueries:[NSArray arrayWithObjects:statusQuery,priorityQuery,stateQuery,nil]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            for (AVQuery *q in objects) {
                Options *aOptions= [[Options alloc]init];
                aOptions.driverID = [q valueForKey:@"driverID"];
                aOptions.origin = [q valueForKey:@"origin"];
                aOptions.destination = [q valueForKey:@"destination"];
                aOptions.note = [q valueForKey:@"note"];
                aOptions.truckType = [q valueForKey:@"truckType"];
                aOptions.length = [q valueForKey:@"length"];
                aOptions.number = [q valueForKey:@"number"];
                aOptions.load = [q valueForKey:@"load"];
                aOptions.volume = [q valueForKey:@"volume"];
                aOptions.time = [q valueForKey:@"time"];
                aOptions.sendTime = [q valueForKey:@"sendTime"];
                aOptions.objectId = [q valueForKey:@"objectId"];
                aOptions.carState = [q valueForKey:@"carState"];
                [tempArr addObject:aOptions];
            }
            passValue(tempArr);
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
