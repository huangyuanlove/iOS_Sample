//
//  HYNotification.h
//  SampleApp
//
//  Created by 代烁 on 2020/6/21.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYNotification : NSObject
+(HYNotification *) notificationManager;
-(void) checkNotificationAuthorization;
@end

NS_ASSUME_NONNULL_END
