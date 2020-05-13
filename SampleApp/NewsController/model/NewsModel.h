//
//  NewsModel.h
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsBean.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject
@property(nonatomic) NSString *status;
@property(nonatomic) NSInteger count;
@property(nonatomic) NSArray<NewsBean *> *posts;
@property(nonatomic) NSInteger countTotal;

-(instancetype) fromDic:(NSDictionary *)jsonDic;

@end

NS_ASSUME_NONNULL_END
