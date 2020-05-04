//
//  GTVideoViewController.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/2/29.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"
#import "GTVideoToolBar.h"

@interface GTVideoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype) init {
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
        self.navigationItem.title = @"UICollectionView";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width / 16) * 9 + GTVideoToolBarHeight);
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    
    [self.view addSubview:collectionView];

    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        [(GTVideoCoverView *)cell layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
      
    return cell;
}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if ((indexPath.item % 3) == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//    }
//}
                                                   

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
