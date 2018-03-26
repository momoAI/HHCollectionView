//
//  AbbrLayoutView.m
//  HHCollectionView
//
//  Created by luxu on 2018/3/24.
//  Copyright © 2018年 彭训贵. All rights reserved.
//

#import "AbbrLayoutView.h"

@implementation AbbrLayoutView

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    CGRect visitRect = {self.collectionView.contentOffset,self.collectionView.bounds.size};
    NSMutableArray *attributesCopy = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        UICollectionViewLayoutAttributes *attributeCopy = [attribute copy];
        [attributesCopy addObject:attributeCopy];
    }
    
    for (UICollectionViewLayoutAttributes *attribute in attributesCopy) {
        CGFloat distance = CGRectGetMidX(visitRect) - attribute.center.x;
        CGFloat coefficient = distance / (self.itemSize.width * 6);
        //        attribute.transform3D = CATransform3DMakeRotation(coefficient * M_PI , 1, 0, 0);
        CATransform3D rotate = CATransform3DMakeRotation(coefficient * M_PI, 0, 1, 0);
        attribute.transform3D = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
    }
    return attributesCopy;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ) {
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f / disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ) {
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

@end
