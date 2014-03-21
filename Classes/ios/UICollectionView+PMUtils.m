//
//  UICollectionView+PMUtils.m
//  
//
//  Created by Peter Meyers on 3/21/14.
//
//

#import "UICollectionView+PMUtils.h"

@implementation UICollectionView (PMUtils)

- (NSIndexPath *) visibleIndexPathNearestToPoint:(CGPoint)point
{
    NSIndexPath *nearestIndexPath = nil;
    CGFloat closestDistance = MAXFLOAT;
    
    for (NSIndexPath *indexPath in self.indexPathsForVisibleItems) {
        
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        CGRect frame = attributes.frame;
        
        if (CGRectContainsPoint(frame, point)) {
            return indexPath;
        }

        CGFloat distance = [self squaredDistanceFromRect:attributes.frame toPoint:point];
        
        if (distance < closestDistance) {
            closestDistance = distance;
            nearestIndexPath = indexPath;
        }
    }
    return nearestIndexPath;
}

- (CGFloat) squaredDistanceFromRect:(CGRect)rect toPoint:(CGPoint)point
{
    CGPoint closestPoint = rect.origin;
    
    if (point.x > CGRectGetMaxX(rect)) {
        closestPoint.x += rect.size.width;
    }
    else if (point.x > CGRectGetMinX(rect)) {
        closestPoint.x = point.x;
    }
    
    if (point.y > CGRectGetMaxY(rect)) {
        closestPoint.y += rect.size.height;
    }
    else if (point.y > CGRectGetMinY(rect)) {
        closestPoint.y = point.y;
    }
    
    CGFloat dx = point.x - closestPoint.x;
    CGFloat dy = point.y - closestPoint.y;
    
    return dx*dx + dy*dy;
}

@end
