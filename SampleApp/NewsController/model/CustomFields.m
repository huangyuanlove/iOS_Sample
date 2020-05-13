//
//  CustomFields.m
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import "CustomFields.h"

@implementation CustomFields


- (instancetype)fromDic:(NSDictionary *)jsonDic{

    if (self) {
        self.thumbC = [jsonDic objectForKey:@"thumb_c"];
        
    }
    return self;
}

@end
