//
//  VideoConverViewCell.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/7.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "VideoConverViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoConverViewCell ()

@property(nonatomic,readwrite,strong) AVPlayerItem * videoItem;
@property(nonatomic,readwrite,strong) AVPlayer * avPlayer;
@property(nonatomic,readwrite,strong) AVPlayerLayer *palyerLayer;
@property(nonatomic, readwrite, strong) UIImageView *converView;
@property(nonatomic, readwrite, strong) UIImageView *playButton;

@property(nonatomic,copy,readwrite) NSString *videoUrl;

@end


@implementation VideoConverViewCell


- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:({
            _converView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            
            _converView;
        })];


        [_converView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            
            _playButton;
        })];
    }

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];


    return self;

}

-(void) layoutWithVideoConverUrl:(NSString *) converUrl videoUrl:(NSString *)videoUrl{
    
    _converView.image = [UIImage imageNamed:converUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    _videoUrl = videoUrl;
    
    
}


-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
}


- (void)_tapToPlay {
    
    
    NSURL * videoUrl = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    _videoItem = [AVPlayerItem   playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    _palyerLayer  = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _palyerLayer.frame = _converView.bounds;
    [_converView.layer addSublayer:_palyerLayer ];
    
    
    NSLog(@"点击了播放");
    

}


-(void) _handlePlayEnd{
    [_palyerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
    
}




- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"status"]){
        
        if(((NSNumber *) [change objectForKey:NSKeyValueChangeNewKey]).intValue == AVPlayerItemStatusReadyToPlay){
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
        
        
    }
}

@end
