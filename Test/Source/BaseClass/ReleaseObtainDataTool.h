//
//  ReleaseObtainDataTool.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PassValue)(NSArray *array);

@interface ReleaseObtainDataTool : NSObject

//单例初始化工具类
+(ReleaseObtainDataTool *)shareReleaseData;

//发布货源
-(BOOL)podShareCargoInfo:(CargoInfo *)aCargoInfo;

//获取车源
-(void)getShareOption:(NSString *)location PassValue:(PassValue)passValue;

//查询车源
-(void)getShareOptionWithOrigin:(NSString *)origin Destination:(NSString *)destination PassValue:(PassValue)passValue;

@end
