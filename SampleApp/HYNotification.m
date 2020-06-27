//
//  HYNotification.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/21.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "HYNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface HYNotification ()<UNUserNotificationCenterDelegate>

@end


@implementation HYNotification


+(HYNotification *) notificationManager{
    static HYNotification * notificationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationManager = [[HYNotification alloc]init];
    });
    return notificationManager;
    
}



-(void) checkNotificationAuthorization{
    UNUserNotificationCenter *notificationCenter =  [UNUserNotificationCenter currentNotificationCenter];
    notificationCenter.delegate = self;
    
    [notificationCenter requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"requestAuthorizationWithOptions");
        
        if(granted){
             NSLog(@"granted");
            [self _pushLocationNotification];
            
        }else{
            NSLog(@"denied");
        }
        
    }];
    
    
}


-(void) _pushLocationNotification{
    NSLog(@"发送通知");
    UNMutableNotificationContent *notificationContent = [[UNMutableNotificationContent alloc]init];
    notificationContent.badge=@(1);
    notificationContent.title = @"iOS Sample";
    notificationContent.body = @"notification body";
    
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.f repeats:    NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"xuan" content:notificationContent trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"");
         NSLog(@"notication completion handler");
    }];
    
    
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    NSLog(@"willPresentNotification");
    
    completionHandler(UNNotificationPresentationOptionAlert);
    
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
     NSLog(@"didReceiveNotificationResponse");
    completionHandler();
}


@end
