//
//  LoginDataTool.m
//  Test
//
//  Created by jang on 16/3/3.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "LoginDataTool.h"
#import <AVOSCloud/AVOSCloud.h>
static LoginDataTool *ld;
@implementation LoginDataTool

//单例初始化工具类
+(LoginDataTool *)shareLoginData
{
    static dispatch_once_t once_token;
    if (ld == nil) {
        dispatch_once(&once_token, ^{
            ld = [[LoginDataTool alloc]init];
        });
    }
    return ld;
}

-(void)CodeWithPhone:(NSString *)phone WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    AVQuery *queryemail = [AVUser query];
    [queryemail whereKey:@"username" equalTo:phone];
    NSLog(@"%ld",[queryemail findObjects].count);
    if ([queryemail findObjects].count > 0) {
        //登录
        [AVOSCloud requestSmsCodeWithPhoneNumber:phone callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                block(succeeded);
            }else{
                failureBlock(error);
            }
        }];
    }else{
        //注册
        [AVUser requestLoginSmsCode:phone withBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                block(succeeded);
            }else{
                failureBlock(error);
            }
        }];
    }
}

//用户注册登录
-(void)LoginWithPhone:(NSString *)phone Code:(NSString *)code WithReturnValeuBlock:(ReturnValueBlock)block {
    AVQuery *queryemail = [AVUser query];
    [queryemail whereKey:@"username" equalTo:phone];
    NSLog(@"%ld",[queryemail findObjects].count);
    if ([queryemail findObjects].count > 0) {
         //登录
        [AVUser logInWithMobilePhoneNumberInBackground:phone smsCode:code block:^(AVUser *user, NSError *error) {
            if (error == nil) {
                _aUser = [[UserModle alloc]init];
                _aUser.objectId = [user valueForKey:@"objectId"];
                _aUser.username = [user valueForKey:@"username"];
                _aUser.userType = [user valueForKey:@"userType"];
                _aUser.userIP = [user valueForKey:@"userIP"];
                _aUser.userState = [user valueForKey:@"userState"];
                _aUser.userNames = [user valueForKey:@"userNames"];
                block(YES);
            }else{
                block(NO);
            }
        }];
    }else{
        //注册
        [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:phone smsCode:code block:^(AVUser *user, NSError *error) {
            if (error == nil) {
                [user setObject:@"货主" forKey:@"userType"];//用户类别
                [user setObject:[NetWorkTolls getIPAddress] forKey:@"userIP"];//登录ip
                [user setObject:nil forKey:@"userState"];//认证状态
                [user setObject:nil forKey:@"userNames"];//用户名
                block(YES);
            }else{
                block(NO);
            }
        }];
    }
}

@end
