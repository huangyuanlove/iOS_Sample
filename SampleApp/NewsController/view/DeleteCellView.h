//
//  DeleteCellView.h
//  SampleApp
//
//  Created by huangyuan on 2020/5/5.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteCellView : UIView
-(void) showDeleteViewFromPoint:(CGPoint )point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
