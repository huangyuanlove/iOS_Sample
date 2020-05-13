//
//  VideoViewController.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/3.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation VideoViewController



- (instancetype) init{
    
    self = [super init];
    if(self){
       
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    
        return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width-30)/2, 100);
    
    
    
    UICollectionView *collectionView= [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    [collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionView"];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;

    [self.view addSubview: collectionView];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionView" forIndexPath:indexPath];
    if(!cell){
        
    }
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.row %3 ==0){
        
        return  CGSizeMake((self.view.frame.size.width-10)/2, 100);
        
        
    }
   else if(indexPath.row %3 ==1){
         return  CGSizeMake((self.view.frame.size.width-10)/2, 200);
    }
    
    else{
        return  CGSizeMake( (self.view.frame.size.width-10)/2, 300);
    }
    
    
}


@end
