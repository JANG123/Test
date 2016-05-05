//
//  Evaluation.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Evaluation : NSObject
@property (nonatomic,strong) NSString *driverID;//车主ID
@property (nonatomic,strong) NSString *shipperID;//货主ID
@property (nonatomic,strong) NSString *score;//评分
@property (nonatomic,strong) NSString *comments;//评价
@end
