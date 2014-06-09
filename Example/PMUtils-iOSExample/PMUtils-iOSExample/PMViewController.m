//
//  PMViewController.m
//  PMUtils-iOSExample
//
//  Created by Peter Meyers on 3/10/14.
//  Copyright (c) 2014 Peter Meyers. All rights reserved.
//

#import "PMViewController.h"
#import "PMUtils.h"


@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	/*
	 * This example only illustrates how to use 
	 * [UIImage blurredImageWithRadius:iterations:scaleDownFactor:saturation:tintColor].
	 * You may use this view controller as a blank canvas to experment with other category methods
	 * provided by PMUtils.
	 *
	 */
	
	UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Tap view to render blurred images.";
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tap:(UITapGestureRecognizer *)sender
{
	UIImage *img = [UIImage imageNamed:@"Sample.jpg"];

	CFTimeInterval start = CACurrentMediaTime();
	UIImage *imgOne = [img blurredImageWithRadius:10
									   iterations:3
								  scaleDownFactor:2
									   saturation:1
										tintColor:nil
											 crop:CGRectZero];
	CFTimeInterval duration = CACurrentMediaTime() - start;
	NSLog(@"1: time %f", duration);

	start = CACurrentMediaTime();
	UIImage *imgtwo = [img blurredImageWithRadius:20
									   iterations:4
								  scaleDownFactor:4
									   saturation:1
										tintColor:nil
											 crop:CGRectZero];
	duration = CACurrentMediaTime() - start;
	NSLog(@"2: time %f", duration);
	
	CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2.0f);
	UIImageView *one = [[UIImageView alloc] initWithFrame:rect];
	rect.origin.y = rect.size.height;
	UIImageView *two = [[UIImageView alloc] initWithFrame:rect];
	
	one.image = imgOne;
	two.image = imgtwo;
	
	[self.view addSubview:one];
	[self.view addSubview:two];
}

@end
