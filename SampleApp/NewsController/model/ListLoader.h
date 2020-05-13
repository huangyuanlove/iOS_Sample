//
//  ListLoader.h
//  SampleApp
//
//  Created by huangyuan on 2020/5/5.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsBean;


NS_ASSUME_NONNULL_BEGIN

typedef void(^ListLoaderFinishBlock)(BOOL success,NSArray<NewsBean *> *dataArray);


@interface ListLoader : NSObject


-(void) loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
