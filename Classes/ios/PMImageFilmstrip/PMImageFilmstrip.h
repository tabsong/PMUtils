//
//  PMImageFilmstrip.h
//  hunters-alley-ios
//
//  Created by Peter Meyers on 4/16/14.
//  Copyright (c) 2014 Hunters Alley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMImageFilmstrip : UICollectionView

- (instancetype) initWithFrame:(CGRect)frame imageEntities:(NSArray *)imageEntities;
+ (instancetype) imageFilmstripWithFrame:(CGRect)frame imageEntities:(NSArray *)imageEntities;

@property (strong, nonatomic) NSArray *imageEntities;

@end
