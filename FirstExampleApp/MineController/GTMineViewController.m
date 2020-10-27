//
//  GTMineViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/6/23.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTMineViewController.h"
#import "GTMediator.h"

@interface GTMineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) UIView  *tableViewHeaderView;
@property(nonatomic, strong, readwrite) UIImageView *headerImageView;

@end

@implementation GTMineViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
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
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        [GTMediator openUrl:@"learn://" params:@{@"controller": self.navigationController}];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _tableViewHeaderView.backgroundColor = [UIColor whiteColor];
        
        [_tableViewHeaderView addSubview:({
            _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3, 30, self.view.frame.size.width / 3, self.view.frame.size.width / 3)];
            _headerImageView.backgroundColor = [UIColor whiteColor];
            _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
            _headerImageView.clipsToBounds = YES;
            _headerImageView.userInteractionEnabled = YES;
            _headerImageView;
        })];
        
        [_tableViewHeaderView addGestureRecognizer:({
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapImage)];
            tapGesture;
        })];
    }

    
    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (![[GTLogin sharedLogin] isLogin]) {
        [_headerImageView setImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];
    } else {
//        [self.headerImageView setImage]
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = [[GTLogin sharedLogin] isLogin] ? [GTLogin sharedLogin].nick : @"昵称";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = [[GTLogin sharedLogin] isLogin] ? [GTLogin sharedLogin].address : @"地区";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"学习";
    };
}

- (void) _tapImage {
    if (![[GTLogin sharedLogin] isLogin]) {
        [[GTLogin sharedLogin] loginWithFinishBlock:^(BOOL isLogin) {
            if (isLogin) {
                [self.tableView reloadData];
            }
        }];
    } else {
        [[GTLogin sharedLogin] logOut];
        [self.tableView reloadData];
    }
}

@end
