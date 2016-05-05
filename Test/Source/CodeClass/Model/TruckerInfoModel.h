//
//  TruckerInfoModel.h
//  Test
//
//  Created by jang on 16/2/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TruckerInfoModel : NSObject

@property (nonatomic,strong) NSString *plateNumber;//车牌号
@property (nonatomic,strong) NSString *TruckModels;//货车型号
@property (nonatomic,strong) NSString *manufactureYear;//出厂年份
@property (nonatomic,strong) NSString *load;//承运载重
@property (nonatomic,strong) NSString *volume;//载运体积
@property (nonatomic,strong) NSString *length;//车长

@end
