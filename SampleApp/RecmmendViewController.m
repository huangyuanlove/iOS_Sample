//
//  RecmmendViewController.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/3.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "RecmmendViewController.h"
#import "HYSearchBar.h"
#import "ScreenAdapter.h"
@interface RecmmendViewController ()<UIScrollViewDelegate>

@end

@implementation RecmmendViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.view addSubview:({
        HYSearchBar *searchBar = [[HYSearchBar alloc]initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-UI(20), self.navigationController.navigationBar.bounds.size.height)];
        
        
        searchBar;
    })];
    
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     NSLog(@"scrollViewDidEndDragging");
}

@end
