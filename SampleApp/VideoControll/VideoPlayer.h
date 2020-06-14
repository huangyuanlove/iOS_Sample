//
//  VideoPlayer.h
//  SampleApp
//
//  Created by 代烁 on 2020/6/14.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

+(VideoPlayer *) Player;

-(void) playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *) attachView ;

@end

NS_ASSUME_NONNULL_END
