//
//  GTRecommandViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/2/29.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTRecommandViewController.h"

@interface GTRecommandViewController ()<UIScrollViewDelegate>

@end

@implementation GTRecommandViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.delegate = self;
    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor lightGrayColor], [UIColor grayColor]];
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
//    scrollView.pagingEnabled = YES;
    
    [self.view addSubview:scrollView];
}

//- (void)viewWillLayoutSubviews {
////    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.hidesBottomBarWhenPushed = YES;
//
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll - %@", @(scrollView.contentOffset.x));
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
}

@end
