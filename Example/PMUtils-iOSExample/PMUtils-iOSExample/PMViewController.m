//
//  PMViewController.m
//  PMUtils-iOSExample
//
//  Created by Peter Meyers on 3/10/14.
//  Copyright (c) 2014 Peter Meyers. All rights reserved.
//

#import "PMViewController.h"
#import "PMUtils.h"

static CGFloat const PMPageControlHeight = 37.0f;

@interface PMViewController () <UICollectionViewDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	/*
	 * This example app only illustrates how to use PMImageFilmstrip, UIImageView's image entity delegate, and
	 * [UIImage blurredImageWithRadius:iterations:scaleDownFactor:saturation:tintColor].
	 * You may use this view controller as a blank canvas to experment with other category methods
	 * provided by PMUtils.
	 *
	 */
	
	UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Tap view to render blurred images.";
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
	
	CGRect pageControlFrame = CGRectMake(0, self.view.bounds.size.height - PMPageControlHeight , self.view.bounds.size.width, PMPageControlHeight);
	self.pageControl = [[UIPageControl alloc] initWithFrame:pageControlFrame];
	self.pageControl.hidden = YES;
	[self.view addSubview:self.pageControl];
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
	UIImage *imgTwo = [img blurredImageWithRadius:20
									   iterations:4
								  scaleDownFactor:4
									   saturation:1
										tintColor:nil
											 crop:CGRectZero];
	duration = CACurrentMediaTime() - start;
	NSLog(@"2: time %f", duration);
	
	PMImageFilmstrip *imageFilmstrip = [PMImageFilmstrip imageFilmstripWithFrame:self.view.bounds
																   imageEntities:@[imgOne, imgTwo]];
	imageFilmstrip.delegate = self;
	[self.view insertSubview:imageFilmstrip belowSubview:self.pageControl];
	
	self.pageControl.numberOfPages = imageFilmstrip.imageEntities.count;
	self.pageControl.hidden = NO;
}

- (void) scrollViewWillEndDragging:(PMImageFilmstrip *)imageFilmstrip withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
	NSIndexPath *indexPath = [imageFilmstrip indexPathForItemAtPoint:*targetContentOffset];
	self.pageControl.currentPage = indexPath.item;
}

@end
