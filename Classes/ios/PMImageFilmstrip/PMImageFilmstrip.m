//
//  PMImageFilmstrip.m
//  hunters-alley-ios
//
//  Created by Peter Meyers on 4/16/14.
//  Copyright (c) 2014 Hunters Alley. All rights reserved.
//

#import "PMImageFilmstrip.h"
#import "PMUtils.h"

static NSString * const PMImageFilmstripCellReuseIdentifier = @"PMImageFilmstripCellReuseIdentifier";

@interface PMImageFilmstrip () <UICollectionViewDataSource>
@end

@implementation PMImageFilmstrip


+ (instancetype) imageFilmstripWithFrame:(CGRect)frame imageEntities:(NSArray *)imageEntities
{
	return [[self alloc] initWithFrame:frame imageEntities:imageEntities];
}

- (instancetype) initWithFrame:(CGRect)frame imageEntities:(NSArray *)imageEntities
{
	UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = frame.size;
    layout.minimumLineSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionViewLayout = layout;
	
	self = [super initWithFrame:frame collectionViewLayout:layout];
	if (self) {
		_imageEntities = imageEntities;
		[self _commonPMImageFilmstripInit];
	}
	return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self _commonPMImageFilmstripInit];
}

- (void) setImageEntities:(NSArray *)imageEntities
{
    if (_imageEntities != imageEntities) {
        _imageEntities = imageEntities;
        [self reloadData];
    }
}


#pragma mark - UICollectionView DataSource Delegate


- (NSInteger) collectionView: (UICollectionView *) collectionView
      numberOfItemsInSection: (NSInteger) section
{
    return self.imageEntities.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PMImageFilmstripCellReuseIdentifier forIndexPath:indexPath];
	
	UIImageView *imageView = nil;
	if (cell.contentView.subviews.count) {
		imageView = cell.contentView.subviews.firstObject;
	}
	else {
		imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
		imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[cell.contentView addSubview:imageView];
	}
	
	id imageEntity = self.imageEntities[indexPath.item];
	[imageView setImageEntity:imageEntity];

	return cell;
}


#pragma mark - Private Methods


- (void) _commonPMImageFilmstripInit
{
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:PMImageFilmstripCellReuseIdentifier];
    self.dataSource = self;
    self.allowsSelection = NO;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = [UIColor whiteColor];
}


@end
