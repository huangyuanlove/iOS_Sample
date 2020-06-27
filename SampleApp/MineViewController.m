//
//  MineViewController.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/21.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor cyanColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        UIButton *toastButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
        toastButton.backgroundColor = [UIColor redColor];
       [toastButton setTitle:@"alert" forState:UIControlStateNormal];
        [toastButton addTarget:self action:@selector(showToast) forControlEvents:UIControlEventTouchDown];
        toastButton;

    })];
    
    
    [self.view addSubview:({
        
        UIButton *locationButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 220, 100, 100)];
       [locationButton setTitle:@"定位" forState:UIControlStateNormal];
        locationButton.backgroundColor = [UIColor greenColor];
        [locationButton addTarget:self action:@selector(showLocation) forControlEvents:UIControlEventTouchDown];
        locationButton;
        
    })];
    
    
    [self.view addSubview:({
        
        UIButton *notificationButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 340, 100, 100)];
        
     
        
        [notificationButton setTitle:@"推送" forState:UIControlStateNormal];
        
        notificationButton.titleLabel.adjustsFontSizeToFitWidth =true;
        notificationButton.backgroundColor = [UIColor grayColor];
        [notificationButton addTarget:self action:@selector(showNotification) forControlEvents:UIControlEventTouchDown];
        notificationButton;
        
    })];
    
}



-(void) showNotification{
    
}

-(void) showLocation{
    
}


-(void) showToast{
    NSLog(@"点击");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"这是标题" message:@"这是message" preferredStyle:UIAlertControllerStyleAlert ];
    
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"action title" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"firstAction handler");
    }];
    
    
    [alertController addAction:firstAction];
    
    
    
    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"alertCompletion");
    }];
    
}

@end
