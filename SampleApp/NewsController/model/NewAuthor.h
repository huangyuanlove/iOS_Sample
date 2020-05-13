//
//  NewAuthor.h
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewAuthor : NSObject
@property(nonatomic,copy) NSString *description;
@property(nonatomic,copy) NSString *firstName;
@property(nonatomic,copy) NSString *lastName;
@property(nonatomic) NSInteger idNumber;
@property(nonatomic) NSString *name;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy) NSString *slug;
@property(nonatomic,copy) NSString *url;


-(instancetype) fromDic:(NSDictionary *) jsonDic;
@end

NS_ASSUME_NONNULL_END
