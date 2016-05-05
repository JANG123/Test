//
//  CargoInfo.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CargoInfo : NSObject

@property (nonatomic,strong) NSString *shipperID;//货主ID
@property (nonatomic,strong) NSString *origin;//出发地
@property (nonatomic,strong) NSString *destination;//目的地
@property (nonatomic,strong) NSString *note;//备注
@property (nonatomic,strong) NSString *truckType;//车型
@property (nonatomic,strong) NSString *length;//车长
@property (nonatomic,strong) NSString *number;//车辆数量
@property (nonatomic,strong) NSString *load;//承运载重
@property (nonatomic,strong) NSString *volume;//载运体积
@property (nonatomic,strong) NSString *price;//单车价格
@property (nonatomic,strong) NSString *phoneNumber;//收货电话
@property (nonatomic,strong) NSString *sendTime;//发布时间 yyyy-mm-dd hh:mm:ss
@property (nonatomic,strong) NSString *objectId;//运单ID
@property (nonatomic,strong) NSString *orderState;//订单状态


@end
