//
//  AbbrCollectionViewController.m
//  HHCollectionView
//
//  Created by luxu on 2018/3/24.
//  Copyright © 2018年 彭训贵. All rights reserved.
//

#import "AbbrCollectionView.h"
#import "AbbrLayoutView.h"

@interface AbbrCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) AbbrLayoutView *layout;

@end

@implementation AbbrCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    _layout = [[AbbrLayoutView alloc] init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    _layout.itemSize = CGSizeMake(frame.size.width / 2, frame.size.height - 10);
    if (self = [super initWithFrame:frame collectionViewLayout:_layout]) {
        self.backgroundColor = [UIColor orangeColor];
        self.showsHorizontalScrollIndicator = NO;
        self.contentInset = UIEdgeInsetsMake(0, (int)(frame.size.width / 4) + 5, 0, (int)(frame.size.width / 4) + 5);
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collection"];
    }
    return self;
}

- (void)setImages:(NSArray *)images {
    _images = images;
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_images.count / 2 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    UIImage *image = [UIImage imageNamed:_images[indexPath.row]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:image];
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat scrDynameter = scrollView.contentOffset.x / (_layout.itemSize.width + 10);
    if(!decelerate){
        NSInteger scrIndex = (NSInteger)(scrDynameter + 1);
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:scrIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat scrDynameter = scrollView.contentOffset.x / (_layout.itemSize.width + 10);
    NSInteger scrIndex = (NSInteger)(scrDynameter + 1);
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:scrIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

@end
