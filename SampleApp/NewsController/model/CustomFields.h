//
//  CustomFields.h
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomFields : NSObject
@property(nonatomic) NSArray * thumbC;

-(instancetype) fromDic:(NSDictionary *) jsonDic;
@end

NS_ASSUME_NONNULL_END
