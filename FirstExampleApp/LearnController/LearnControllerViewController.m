//
//  LearnControllerViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/7/26.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "LearnControllerViewController.h"
#import "GTMediator.h"
#import "TransitioningViewController.h"

@interface LearnControllerViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) UINavigationController *navigationController;

@end

@implementation LearnControllerViewController

- (instancetype) initWithController:(UINavigationController *)controller
{
    self = [super init];
    if (self) {
        self.navigationController = controller;
    }
    return self;
}

+ (void) load
{
    [GTMediator registerScheme:@"learn://" processBlock:^(NSDictionary * _Nonnull params) {
        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
        LearnControllerViewController *controller = [[LearnControllerViewController alloc] initWithController:navigationController];
        [navigationController pushViewController:controller animated:YES];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView;
    })];
    
}


#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"learnTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"learnTableViewCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TransitioningViewController *controller = [[TransitioningViewController alloc] initWithController:self.navigationController];
        [self.navigationController pushViewController:controller animated:YES];
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = @"转场动画";
    }
}


@end
