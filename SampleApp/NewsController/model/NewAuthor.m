//
//  NewAuthor.m
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import "NewAuthor.h"

@implementation NewAuthor

- (instancetype)fromDic:(NSDictionary *)jsonDic{
    if(self){
        self.idNumber = [jsonDic objectForKey:@"id"];
        self.name = [jsonDic objectForKey:@"name"];
        self.nickName = [jsonDic objectForKey:@"nickname"];
    }
    return self;
}

@end
