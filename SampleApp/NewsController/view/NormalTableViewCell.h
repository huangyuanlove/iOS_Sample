//
//  NormalTableViewCell.h
//  SampleApp
//
//  Created by huangyuan on 2020/5/3.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NewsBean;

@protocol NormalTableViewCellDelegate <NSObject>

-(void) tableViewCell:(UITableViewCell *) tableViewCell clickDeleteButton:(UIButton *) deleteButton;

@end



@interface NormalTableViewCell : UITableViewCell
@property(nonatomic,weak,readwrite) id<NormalTableViewCellDelegate> delegate;
-(void)setData:(NewsBean *) bean;
@end

NS_ASSUME_NONNULL_END
