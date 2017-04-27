//
//  ChannelTV24.m
//  TVChannels
//
//  Created by Ricardo Suarez Martinez on 2017-04-27.
//  Copyright © 2017 Ricardo Suarez. All rights reserved.
//

#import "ChannelTV24.h"

static NSString *const kTV24IdKey = @"id";
static NSString *const kTV24VideoTitleKey = @"channel";
static NSString *const kTV24VideoUrlKey = @"stream";
static NSString *const kTV24VideoThumbnailKey = @"thumb";
static NSString *const kTV24VideoDurationKey = @"video_duration";
static NSString *const kTV24VideoDescriptionKey = @"video_description";
static NSString *const kTV24CidKey = @"cid";
static NSString *const kTV24CatIdKey = @"cat_id";
static NSString *const kTV24CategoryNameKey = @"category_name";
static NSString *const kTV24CategoryImageKey = @"category_image";


@interface ChannelTV24 ()

@property (nonatomic, copy) NSDictionary *channelDatas;

@end

@implementation ChannelTV24

#pragma mark - ---- LIFECYCLE

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {
        self.channelDatas = dictionary;
    }

    return self;
}

#pragma mark - ---- PRIVATE

- (NSString *)getChannelId {

    return [self.channelDatas valueForKey:kTV24IdKey];
}

- (NSString *)getTitle {

    return [self.channelDatas valueForKey:kTV24VideoTitleKey];
}

- (NSString *)getUrl {

    return [self.channelDatas valueForKey:kTV24VideoUrlKey];
}

- (NSString *)getThumbnailName {

    return [self.channelDatas valueForKey:kTV24VideoThumbnailKey];
}

- (NSString *)getDuration {

    return [self.channelDatas valueForKey:kTV24VideoDurationKey];
}

- (NSString *)getChannelDescription {

    return [self.channelDatas valueForKey:kTV24VideoDescriptionKey];
}

- (NSString *)getCid {

    return [self.channelDatas valueForKey:kTV24CidKey];
}

- (NSString *)getCategoryId {

    return [self.channelDatas valueForKey:kTV24CatIdKey];
}

- (NSString *)getCategoryName {

    return [self.channelDatas valueForKey:kTV24CategoryNameKey];
}

- (NSString *)getCategoryImageName {

    return [self.channelDatas valueForKey:kTV24CategoryImageKey];
}

#pragma mark - ---- PUBLIC


@end
