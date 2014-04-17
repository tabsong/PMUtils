//
//  PMViewController.m
//  PMUtils-iOSExample
//
//  Created by Peter Meyers on 3/10/14.
//  Copyright (c) 2014 Peter Meyers. All rights reserved.
//

#import "PMViewController.h"
#import "PMUtils.h"

@interface PMViewController ()
@property (nonatomic, strong) UIImageView *one;
@property (nonatomic, strong) UIImageView *two;
@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2.0f);
	self.one = [[UIImageView alloc] initWithFrame:rect];
	rect.origin.y = rect.size.height;
	self.two = [[UIImageView alloc] initWithFrame:rect];
	
	[self.view addSubview:self.one];
	[self.view addSubview:self.two];
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
	
	self.one.image = imgOne;
	self.two.image = imgtwo;
}

@end
