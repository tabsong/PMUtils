//
//  UIView+PMUtils.m
//  
//
//  Created by Peter Meyers on 3/1/14.
//
//

#import "UIView+PMUtils.h"
#import "UIImage+PMUtils.h"

@implementation UIView (PMUtils)

+ (NSString *) nibName
{
	return NSStringFromClass([self class]);
}

+ (UINib *) nib
{
	return [UINib nibWithNibName:[self nibName] bundle:nil];
}

- (void) removeSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

- (void) centerInRect:(CGRect)rect forDirection:(PMDirection)direction;
{
    CGRect frame = self.frame;
    
    if (direction & PMDirectionHorizontal) {
        frame.origin.x = (rect.size.width - frame.size.width) / 2.0f + rect.origin.x;
    }
    
    if (direction & PMDirectionVertical) {
        frame.origin.y = (rect.size.height - frame.size.height) / 2.0f + rect.origin.y;
    }
    
    self.frame = frame;
}

- (UIImage *)blurredViewWithRadius:(CGFloat)radius
						 iterations:(NSUInteger)iterations
					scaleDownFactor:(NSUInteger)scaleDownFactor
						 saturation:(CGFloat)saturation
						  tintColor:(UIColor *)tintColor
							   crop:(CGRect)crop
{
	UIGraphicsBeginImageContextWithOptions(crop.size, YES, 1.0f);

	[self drawViewHierarchyInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) afterScreenUpdates:NO];
	
	UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return 	[snapshot blurredImageWithRadius:radius
								  iterations:iterations
							 scaleDownFactor:scaleDownFactor
								  saturation:saturation
								   tintColor:tintColor
										crop:crop];
}

@end
