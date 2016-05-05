//
//  OrderInfo.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CargoInfo;
@interface OrderInfo : NSObject

@property (nonatomic,strong) NSString *orderID;//订单ID
@property (nonatomic,strong) NSString *driverID;//司机ID
@property (nonatomic,strong) NSString *shipperID;//货主ID
@property (nonatomic,strong) CargoInfo *cargoInfo;//货物信息
@property (nonatomic,strong) NSString *ordeTime;//订单时间
@property (nonatomic,strong) NSString *orderStatus;//订单状态
@property (nonatomic,strong) NSString *location;//地理位置

@end
