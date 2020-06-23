//
//  GTDetailViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/3/14.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "GTMediator.h"

@interface GTDetailViewController () <WKNavigationDelegate>
@property(nonatomic, strong, readwrite) WKWebView *webview;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, strong, readwrite) NSString *articleUrl;
@end

@implementation GTDetailViewController

-(instancetype) initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

+ (void)load {
//    [GTMediator registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
//        NSString *url = [params objectForKey:@"url"];
//        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
//        GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:url];
//        [navigationController pushViewController:controller animated:YES];
//    }];
    
    [GTMediator registerProtol:@protocol(GTDetailViewControllerProtocol) class:[self class]];
}

-(void)dealloc {
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
}

//- (void)viewWillLayoutSubviews {
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    self.progressView.hidden = YES;
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    NSLog(@"");
    self.progressView.progress = self.webview.estimatedProgress;
}

#pragma mark -
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl
{
    return [[[self class] alloc] initWithUrlString:detailUrl];
}

@end
