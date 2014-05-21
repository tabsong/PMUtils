//
//  UIImageView+PM.m
//  hunters-alley-ios
//
//  Created by Peter Meyers on 5/20/14.
//

#import "UIImageView+PMUtils.h"
#import <objc/runtime.h>

@implementation UIImageView (PMUtils)

- (void) setImageEntity:(id)imageEntity
{
    id<UIImageViewDelegate> delegate = [UIImageView delegate];
    NSParameterAssert(delegate);
    [delegate setImageView:self imageForEntity:imageEntity];
}

+ (void) setDelegate:(id<UIImageViewDelegate>)delegate
{
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (id<UIImageViewDelegate>)delegate
{
    return (id<UIImageViewDelegate>)objc_getAssociatedObject(self, @selector(delegate));
}

@end
