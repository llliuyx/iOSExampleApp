//
//  TransitioningViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/7/26.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "TransitioningViewController.h"
#import "ForithmFromViewController.h"
#import "SwipeFromViewController.h"
#import "CustomFromViewController.h"
#import "SpringFromViewController.h"
#import "RoundDotFromViewController.h"
#import "PageFromViewController.h"

@interface TransitioningViewController ()

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) UINavigationController *navigationController;

@end

@implementation TransitioningViewController

- (instancetype) initWithController:(UINavigationController *)controller
{
    self = [super init];
    if (self) {
        self.navigationController = controller;
    }
    return self;
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
    
    _dataArray = @[@"逐渐出现",@"右滑拉动",@"底部卡片",@"弹性POP",@"圆点扩散",@"翻页效果"];

}


#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"learnTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"learnTableViewCell"];
        cell.textLabel.text = _dataArray[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
            case 0:{
                    
                    // 逐渐显示自定义转场
                    ForithmFromViewController * controlller =  [[ForithmFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
                   }
                    break;
                    
            case 1:{
                    
                    // 逐渐显示自定义转场
                    SwipeFromViewController * controlller =  [[SwipeFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
                   }
                    break;
    
            case 2:{
                    
                    // 底部卡片自定义转场
                    CustomFromViewController * controlller =  [[CustomFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
                    }
                    break;
            case 3:{
                    
                    //弹性POP
                    SpringFromViewController * controlller =  [[SpringFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
            }
                    break;
            case 4:{
                    
                    //圆点扩散
                    RoundDotFromViewController * controlller =  [[RoundDotFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
            }
                    break;
            case 5:{
                    //圆点扩散
                    PageFromViewController * controlller =  [[PageFromViewController alloc]init];
                    UINavigationController * naController = [[UINavigationController alloc]initWithRootViewController:controlller];
                    [self presentViewController:naController animated:YES completion:nil];
            }
                    break;
            default:
                    break;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = @"逐渐出现";
    } else if (indexPath.row == 1) {
        
    }
}


@end
