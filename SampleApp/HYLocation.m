//
//  HYLocation.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/21.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "HYLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface HYLocation ()<CLLocationManagerDelegate>

@property(nonatomic,strong,readwrite) CLLocationManager *manager;

@end

@implementation HYLocation

+(HYLocation *) locationManager{
    
    static HYLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[HYLocation alloc]init];
    });
    
    return location;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc]init];
        self.manager.delegate = self;
    }
    return self;
}



-(void)checkLocationAuthorization{
    //判断是否开启定位服务器
    if([CLLocationManager locationServicesEnabled]){
        if( [CLLocationManager authorizationStatus]== kCLAuthorizationStatusNotDetermined){
            [self.manager requestWhenInUseAuthorization];
            
        }else {
            
        }
        
        
        
        
    }else{
        //引导
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"didChangeAuthorizationStatus");
    
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        NSLog(@"WhenInUse");
        [self.manager startUpdatingLocation];
    }else if(status == kCLAuthorizationStatusNotDetermined){
        NSLog(@"NotDetermined");
    }else if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        NSLog(@"WhenInUse");
    }else if(status == kCLAuthorizationStatusAuthorizedAlways){
        NSLog(@"Always");
    }else if(status == kCLAuthorizationStatusDenied){
        NSLog(@"Denied");
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"didUpdateLocations");
    
    CLLocation *location = [locations firstObject];
    CLGeocoder *coder = [[CLGeocoder  alloc]init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"");
        
        
    }];
    
    
    
}




@end
