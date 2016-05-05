//
//  Options.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Options : NSObject

@property (nonatomic,strong) NSString *driverID;//车主ID
@property (nonatomic,strong) NSString *origin;//出发地
@property (nonatomic,strong) NSString *destination;//目的地
@property (nonatomic,strong) NSString *truckType;//车型
@property (nonatomic,strong) NSString *length;//车长
@property (nonatomic,strong) NSString *number;//车辆数量
@property (nonatomic,strong) NSString *load;//承运载重
@property (nonatomic,strong) NSString *volume;//载运体积
@property (nonatomic,strong) NSString *time;//发车时间
@property (nonatomic,strong) NSString *note;//备注
@property (nonatomic,strong) NSString *sendTime;//发布时间 yyyy-mm-dd hh:mm:ss
@property (nonatomic,strong) NSString *carState;//车辆状态
@property (nonatomic,strong) NSString *objectId;//车源ID

@end
