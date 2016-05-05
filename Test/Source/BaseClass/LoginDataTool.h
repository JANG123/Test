//
//  LoginDataTool.h
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReturnValueBlock)(BOOL code);
typedef void (^FailureBlock)(NSError *error);

@interface LoginDataTool : NSObject

@property (nonatomic,strong)UserModle *aUser;

//单例初始化工具类
+(LoginDataTool *)shareLoginData;

//用户注册登录验证码
-(void)CodeWithPhone:(NSString *)phone
WithReturnValeuBlock:(ReturnValueBlock) block
    WithFailureBlock:(FailureBlock) failureBlock;

//用户注册登录
-(void)LoginWithPhone:(NSString *)phone
                 Code:(NSString *)code
 WithReturnValeuBlock:(ReturnValueBlock) block;



@end
