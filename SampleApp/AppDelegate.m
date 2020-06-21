//
//  AppDelegate.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/1.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecmmendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =  [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen]bounds]    ];
    UITabBarController *tableViewController =  [[UITabBarController alloc] init];
    
    
    NewsViewController *newsViewController = [[NewsViewController alloc]init];
    newsViewController.view.backgroundColor = [UIColor whiteColor];
    newsViewController.tabBarItem.title = @"新闻";
    newsViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    newsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    VideoViewController *videoViewController = [[VideoViewController alloc]init];
  
    
    RecmmendViewController * recmmendViewController = [[RecmmendViewController alloc]init];
    
    
    UIViewController * mineViewController = [[UIViewController alloc]init];
    mineViewController.view.backgroundColor = [UIColor blueColor];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    mineViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    [tableViewController setViewControllers:@[newsViewController,videoViewController,recmmendViewController,mineViewController] animated:true];
    tableViewController.delegate = self;
    
    
    UINavigationController *rootViewController =  [[UINavigationController alloc]initWithRootViewController:tableViewController];
    

    
    
    
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController API_AVAILABLE(ios(3.0)){
    
    NSLog(@"shouldSelectViewController");
    return YES;
    
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSLog(@"didSelectViewController");
    
}



#pragma mark -- URL

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"url : %@",url);
    NSLog(@"options: %@",options);
    return YES;
}



@end
