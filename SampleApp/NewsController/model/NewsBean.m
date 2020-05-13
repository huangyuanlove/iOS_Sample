//
//  NewsBean.m
//  jandan
//
//  Created by huangyuan on 2019/11/3.
//  Copyright © 2019 huangyuan. All rights reserved.
//

#import "NewsBean.h"
#import "NewAuthor.h"
@implementation NewsBean


- (instancetype)fromDictionary:(NSDictionary *)jsonDic{
    
    if(self){
        self.idNumber = [jsonDic objectForKey:@"id"];
        self.title = [jsonDic objectForKey:@"title"];
        
        self.excerpt = [jsonDic objectForKey:@"excerpt"];
        self.url = [jsonDic objectForKey:@"url"];
        self.date = [jsonDic objectForKey:@"date"];
        self.commentCount = [jsonDic objectForKey:@"comment_count"];
//
        
        self.newsAthor = [[NewAuthor alloc]fromDic:[jsonDic objectForKey:@"author"]];
        self.customFields = [[CustomFields alloc]fromDic: [jsonDic objectForKey:@"custom_fields"]];
    }
    
    
    return self;
}


@end
