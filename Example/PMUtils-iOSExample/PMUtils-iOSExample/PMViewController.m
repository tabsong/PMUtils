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
@end

@implementation PMViewController
{
	UIPageControl *_pageControl;
	PMImageFilmstrip *_imageFilmstrip;
}

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
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
	[self.view addGestureRecognizer:tap];
	
	UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Tap view to render blurred images.";
	label.textAlignment = NSTextAlignmentCenter;
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:label];
	
	CGRect pageControlFrame = CGRectMake(0, self.view.bounds.size.height - PMPageControlHeight , self.view.bounds.size.width, PMPageControlHeight);
	_pageControl = [[UIPageControl alloc] initWithFrame:pageControlFrame];
	_pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_pageControl.hidden = YES;
	[self.view addSubview:_pageControl];
}


- (void)tap:(UITapGestureRecognizer *)sender
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
	
	_imageFilmstrip = [PMImageFilmstrip imageFilmstripWithFrame:self.view.bounds
																   imageEntities:@[imgOne, imgTwo]];
	_imageFilmstrip.delegate = self;
	_imageFilmstrip.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[self.view insertSubview:_imageFilmstrip belowSubview:_pageControl];
	
	_pageControl.numberOfPages = _imageFilmstrip.imageEntities.count;
	_pageControl.hidden = NO;
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	((UICollectionViewFlowLayout *)_imageFilmstrip.collectionViewLayout).itemSize = self.view.bounds.size;
}

- (void) scrollViewWillEndDragging:(PMImageFilmstrip *)imageFilmstrip withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
	NSIndexPath *indexPath = [imageFilmstrip indexPathForItemAtPoint:*targetContentOffset];
	_pageControl.currentPage = indexPath.item;
}

@end
