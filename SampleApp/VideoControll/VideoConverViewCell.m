//
//  VideoConverViewCell.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/7.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "VideoConverViewCell.h"
#import "VideoPlayer.h"
#import "VideoToolBar.h"


@interface VideoConverViewCell ()


@property(nonatomic, readwrite, strong) UIImageView *converView;
@property(nonatomic, readwrite, strong) UIImageView *playButton;

@property(nonatomic,copy,readwrite) NSString *videoUrl;
@property(nonatomic,readwrite,strong) VideoToolBar *videoToolBar;

@end


@implementation VideoConverViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:({
            _converView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-VideoToolBarHeight)];
            
            _converView;
        })];
        
        
        [_converView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height-VideoToolBarHeight - 50) / 2, 50, 50)];
            
            _playButton;
        })];
        
        
        
        
        
        [self addSubview:({
            
            _videoToolBar = [[VideoToolBar alloc] initWithFrame:CGRectMake(0, _converView.bounds.size.height, frame.size.width,VideoToolBarHeight )];
            
            
            _videoToolBar;
        })];
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
    
}

-(void) layoutWithVideoConverUrl:(NSString *) converUrl videoUrl:(NSString *)videoUrl{
    
    _converView.image = [UIImage imageNamed:converUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    _videoUrl = videoUrl;
    [_videoToolBar layoutWithModel:nil];
    
    
}




-(void)_tapToPlay{
    
    [[VideoPlayer Player]playVideoWithUrl:_videoUrl attachView:_converView];
    
}


@end
