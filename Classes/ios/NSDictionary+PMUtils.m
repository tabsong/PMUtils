//
//  NSDictionary+PMUtils.m
//  Pods
//
//  Created by Peter Meyers on 5/5/14.
//
//

#import "NSDictionary+PMUtils.h"

@implementation NSDictionary (PMUtils)

- (NSDictionary *) replaceKey:(id<NSCopying>)currentKey withKey:(id<NSCopying>)newKey
{
    id value = self[currentKey];
    if (value) {
        NSMutableDictionary *mutableSelf = [self mutableCopy];
        mutableSelf[newKey] = value;
        [mutableSelf removeObjectForKey:currentKey];
        return mutableSelf;
    }
    return self;
}

@end
