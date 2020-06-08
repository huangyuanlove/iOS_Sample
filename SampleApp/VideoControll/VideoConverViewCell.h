//
//  VideoConverViewCell.h
//  SampleApp
//
//  Created by 代烁 on 2020/6/7.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoConverViewCell : UICollectionViewCell

-(void) layoutWithVideoConverUrl:(NSString *) converUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
