//
//  ChannelCategoryTV24.m
//  TVChannels
//
//  Created by Ricardo Suarez Martinez on 2017-04-27.
//  Copyright © 2017 Ricardo Suarez. All rights reserved.
//

#import "ChannelCategoryTV24.h"

NSString *const kTV24CategoryIdKey = @"cid";
NSString *const kTV24CategoryNameKey = @"category_name";
NSString *const kTV24CategoryImageKey = @"category_image";

@interface ChannelCategoryTV24 ()

@property (nonatomic, copy) NSDictionary *categoryDatas;
@property (nonatomic, copy) NSArray *channels;

@end

@implementation ChannelCategoryTV24

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

    return [self.categoryDatas valueForKey:kTV24CategoryIdKey];
}

- (NSString *)getCategoryName {

    return [self.categoryDatas valueForKey:kTV24CategoryNameKey];
}

- (NSString *)getCategoryImageName {

    return [self.categoryDatas valueForKey:kTV24CategoryImageKey];
}

- (NSArray *)getCategoryChannels {

    return self.channels;
}


@end
