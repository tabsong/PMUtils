//
//  UICollectionViewFlowLayout+PMUtils.h
//  Pods
//
//  Created by Peter Meyers on 4/9/14.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionViewFlowLayout (PMUtils)

- (BOOL) cell:(UICollectionViewCell *)cell requiresScrollAnimationToPosition:(UICollectionViewScrollPosition)scrollPosition;

@end
