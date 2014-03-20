//
//  UIView+PMUtils.h
//  
//
//  Created by Peter Meyers on 3/1/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, PMDirection) {
    PMDirectionVertical = 0,
    PMDirectionHorizontal = 1
};

@interface UIView (PMUtils)

+ (NSString *) nibName;

+ (UINib *) nib;

- (void) removeSubviews;

- (void) centerInRect:(CGRect)rect forDirection:(PMDirection)direction;

- (UIImage *)blurredViewWithRadius:(CGFloat)radius
						iterations:(NSUInteger)iterations
				   scaleDownFactor:(NSUInteger)scaleDownFactor
						saturation:(CGFloat)saturation
						 tintColor:(UIColor *)tintColor
							  crop:(CGRect)crop;
@end
