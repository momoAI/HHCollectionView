//
//  ViewController.m
//  HHCollectionView
//
//  Created by luxu on 2018/3/24.
//  Copyright © 2018年 彭训贵. All rights reserved.
//

#import "ViewController.h"
#import "AbbrCollectionView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) AbbrCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    _datas = [NSMutableArray array];
    for (int i = 1; i < 10; i ++) {
        [_datas addObject:[NSString stringWithFormat:@"timg%d.jpg",i]];
    }
    _collectionView = [[AbbrCollectionView alloc] initWithFrame:CGRectMake(0, screenH / 4, screenW, screenH / 2)];
    _collectionView.images = _datas;
    [self.view addSubview:_collectionView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
