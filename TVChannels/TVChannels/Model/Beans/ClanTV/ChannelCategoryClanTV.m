//
//  ChannelCategoryClanTV.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelCategoryClanTV.h"

NSString *const kClanTVCategoryIdKey = @"cid";
NSString *const kClanTVCategoryNameKey = @"category_name";
NSString *const kClanTVCategoryImageKey = @"category_image";

@interface ChannelCategoryClanTV ()

@property (nonatomic, copy) NSDictionary *categoryDatas;
@property (nonatomic, copy) NSArray *channels;

@end


@implementation ChannelCategoryClanTV

#pragma mark - ---- LIFECYCLE

- (instancetype)initWithDictionary:(NSDictionary *)dictionary channels:(NSArray *)newChannels {

    self = [super init];
    if (self) {
        _categoryDatas = dictionary;
        _channels = newChannels;
    }
    
    return self;
}

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (NSString *)getCategoryId {
    
    return [self.categoryDatas valueForKey:kClanTVCategoryIdKey];
}

- (NSString *)getCategoryName {
    
    return [self.categoryDatas valueForKey:kClanTVCategoryNameKey];
}

- (NSString *)getCategoryImageName {
    
    return [self.categoryDatas valueForKey:kClanTVCategoryImageKey];
}

- (NSArray *)getCategoryChannels {
    
    return self.channels;
}

@end
