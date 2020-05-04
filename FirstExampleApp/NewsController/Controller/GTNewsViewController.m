//
//  ViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/2/27.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"

@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@end

@implementation GTNewsViewController

- (instancetype) init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.listLoader = [[GTListLoader alloc] init];
    __weak typeof(self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __weak typeof(self) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
        NSLog(@"");
    }];
    
    
//    UIView *rectView = [[UIView alloc] init];
//    rectView.backgroundColor = [UIColor greenColor];
//    rectView.frame = CGRectMake(150, 150, 100, 100);
//
//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [rectView addGestureRecognizer:tapRecognizer];
    
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    
//    -(instancetype) initWithUrlString:(NSString *)urlString
    
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) pushController
{
    UIViewController *secondController = [[UIViewController alloc] init];
    secondController.view.backgroundColor = [UIColor whiteColor];
    secondController.navigationItem.title = @"内容";
    secondController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:secondController animated:YES];
}

- (void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButtion {
//    NSLog(@"");
//    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButtion.frame toView:nil];
//
//    __weak typeof(self) wself = self;
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __weak typeof(self) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}


@end
