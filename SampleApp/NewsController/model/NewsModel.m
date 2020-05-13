//
//  NewsModel.m
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

-(instancetype) fromDic:(NSDictionary *)jsonDic{

    if(self){
        self.status = [jsonDic objectForKey:@"status"];
        self.count = [jsonDic objectForKey:@"count"];
        self.countTotal = [jsonDic objectForKey:@"count_total"];
        
        NSArray * postsJsonArray = [jsonDic objectForKey:@"posts"];
        NSMutableArray * newsBeanArray = [[NSMutableArray alloc]init];
        for(NSDictionary * dict in postsJsonArray){
         [newsBeanArray addObject:   [[NewsBean alloc]fromDictionary:dict]];
        }
        self.posts = newsBeanArray;
        
    }
    return self;
}

@end
