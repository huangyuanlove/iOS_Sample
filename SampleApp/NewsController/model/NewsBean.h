//
//  NewsBean.h
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewAuthor.h"
#import "CustomFields.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsBean : NSObject
@property(nonatomic) NSInteger idNumber;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *excerpt;
@property(nonatomic,copy) NSString *date;
@property(nonatomic) NSNumber *commentCount;
@property(nonatomic,copy) NSString *commentStatus;
@property(nonatomic) NewAuthor *newsAthor;
@property(nonatomic) CustomFields * customFields;


-(instancetype) fromDictionary: (NSDictionary *) jsonDic;

@end



NS_ASSUME_NONNULL_END
