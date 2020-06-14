//
//  VideoPlayer.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/14.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "VideoPlayer.h"

#import <AVFoundation/AVFoundation.h>
@interface VideoPlayer ()
@property(nonatomic,readwrite,strong) AVPlayerItem * videoItem;
@property(nonatomic,readwrite,strong) AVPlayer * avPlayer;
@property(nonatomic,readwrite,strong) AVPlayerLayer *palyerLayer;

@end



@implementation VideoPlayer


+ (VideoPlayer *)Player{
    
    static VideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc]init];
    });
    return player;
    
    
}


-(void) playVideoWithUrl:(NSString *)videoUrlString attachView:(UIView *) attachView {
    [self _stopPlay];
   
    NSURL * videoUrl = [NSURL URLWithString:videoUrlString];
    
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    _videoItem = [AVPlayerItem   playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放缓冲： %f",CMTimeGetSeconds(time));
    }];
    
    _palyerLayer  = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _palyerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_palyerLayer ];
    
    
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

    NSLog(@"点击了播放");
    
}



-(void) _stopPlay{
     [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_palyerLayer removeFromSuperlayer];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _videoItem=nil;
    _avPlayer = nil;
    
}


-(void) _handlePlayEnd{
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}




- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"status"]){
        NSLog(@"状态变化status %@", change);
        if(((NSNumber *) [change objectForKey:NSKeyValueChangeNewKey]).intValue == AVPlayerItemStatusReadyToPlay){
           
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }else if( [keyPath isEqualToString:@"loadedTimeRanges"] ){
//       NSLog(@"状态变化loadedTimeRanges %@", change);
         NSLog(@"缓冲 %@", [change objectForKey:NSKeyValueChangeNewKey] );
    }
}

@end
