//
//  RecmmendViewController.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/3.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "RecmmendViewController.h"

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
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.delegate = self;
    
    NSArray * colorArray = @[[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],[UIColor blueColor],[UIColor grayColor]];
    
    
    for(int i =0;i < 5;i++){
        
        [scrollView addSubview:({
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width *i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
            
            
        })];
        
    }
    
    
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
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
