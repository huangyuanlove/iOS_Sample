//
//  NormalTableViewCell.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/3.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "NormalTableViewCell.h"
#import "NewsBean.h"
#import <SDWebImage.h>
#import "ScreenAdapter.h"

@interface NormalTableViewCell ()

@property(nonatomic,strong,readwrite) UILabel *titleLable;
@property(nonatomic,strong,readwrite) UILabel *excerpt;
@property(nonatomic,strong,readwrite) UILabel *commentLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UIImageView * rightImageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;


@end

@implementation NormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self.contentView addSubview:({
            self.titleLable= [[UILabel alloc]initWithFrame:UIRect(20, 15, self.contentView.frame.size.width, 30)];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable.numberOfLines = 2;
            self.titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLable;
        })];
        
        [self.contentView addSubview:({

            self.excerpt= [[UILabel alloc]initWithFrame:UIRect(20, self.titleLable.frame.size.height +15, self.contentView.frame.size.width, 20)];
            self.excerpt.font = [UIFont systemFontOfSize:12];
            self.excerpt.textColor = [UIColor grayColor];
            self.excerpt.numberOfLines = 2;
            self.excerpt.lineBreakMode = NSLineBreakByTruncatingTail;
            self.excerpt;
        })];
        [self.contentView addSubview:({
            self.commentLable= [[UILabel alloc]initWithFrame:UIRect(20, 80, 50, 20)];
            self.commentLable.font = [UIFont systemFontOfSize:12];
            self.commentLable.textColor = [UIColor grayColor];
            self.commentLable;
        })];
        [self.contentView addSubview:({
            self.timeLable= [[UILabel alloc]initWithFrame:UIRect(150, 80, 50, 20)];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable;
        })];
        [self.contentView addSubview:({
            self.rightImageView= [[UIImageView alloc]initWithFrame:UIRect(self.contentView.frame.size.width, 15, 70, 70)];
            self.rightImageView;
        })];
        

        
        
        
    }
    return self;
    
}

-(void)clickDeleteButton{
    NSLog(@"clickDeleteButton");
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
    
}


-(void)setData:(NewsBean *) bean{
    self.titleLable.text= bean.title;
    
    self.excerpt.text= bean.excerpt;
    [self.excerpt sizeToFit];
    
    self.commentLable.text= [NSString stringWithFormat:@"%@", bean.commentCount ];
    [self.commentLable sizeToFit];
    
    self.timeLable.text= bean.date;
    [self.timeLable sizeToFit];

    
            NSString *imageUrlString =[bean.customFields.thumbC objectAtIndex:0];
            NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    
//    [self.rightImageView sd_setImageWithURL:imageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//    }];
//
    
    
    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage  *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: imageUrl  ]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
        
        
    });
    
}

@end
