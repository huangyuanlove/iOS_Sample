//
//  NewsViewController.m
//  SampleApp
//
//  Created by huangyuan on 2020/5/1.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "NewsViewController.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "DeleteCellView.h"
#import "ListLoader.h"
#import "NewsBean.h"




@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate,NormalTableViewCellDelegate>

@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray<NewsBean*> *dataArray;
@property(nonatomic,strong,readwrite) ListLoader *listLoader;
@end

@implementation NewsViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    _tableView.dataSource = self;
    _tableView.delegate =self;
    
    [self.view addSubview: _tableView];
    
    self.listLoader = [[ListLoader alloc]init];
    
    
    
    __weak typeof (self)wself = self;
    
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<NewsBean *> * _Nonnull dataArray) {
        __strong typeof (wself) strongSelf = wself;
        NSLog(@"%d",success);
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
    

}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


-(void )tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *controller = [[DetailViewController alloc]init];
    
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];

    NewsBean * bean =[self.dataArray objectAtIndex:indexPath.row];
    
    controller.url = bean.url;
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
   
    [cell setData: [self.dataArray objectAtIndex:indexPath.row]];
    cell.delegate = self;
    
    return cell;
    
}
-(void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
    NSLog(@"点击了删除");
    DeleteCellView *view = [[DeleteCellView alloc]initWithFrame:self.view.bounds];
    
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof (self) wself = self;
    
    [view showDeleteViewFromPoint:rect.origin clickBlock:^{
        NSLog(@"++++");
        __strong typeof (self) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation: UITableViewRowAnimationAutomatic];
    }];
}



@end
