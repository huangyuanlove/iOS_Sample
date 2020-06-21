//
//  ScreenAdapter.h
//  SampleApp
//
//  Created by 代烁 on 2020/6/20.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape( [[UIApplication sharedApplication] statusBarOrientation]  ))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.height :[UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.width :[UIScreen mainScreen].bounds.size.height)

#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)


static inline NSInteger UIAdapter(float x){
    //屏幕宽度按比例适配

    
    CGFloat scale = 414/SCREEN_WIDTH;
    return (NSInteger) x / scale;
    
}


static inline CGRect UIRectAdapter(float x, float y,float witdh,float height){
    
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(witdh), UIAdapter(height));
    
    
}


@interface ScreenAdapter : NSObject

@end

NS_ASSUME_NONNULL_END
