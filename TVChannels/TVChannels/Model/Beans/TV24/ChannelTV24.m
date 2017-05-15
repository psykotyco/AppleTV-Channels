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
static NSString *const kTV24ChannelLogoKey = @"logo";

static NSString *const kTV24CurrentProgramTitleKey = @"on-now";
static NSString *const kTV24CurrentProgramDescriptionKey = @"on-now-description";
static NSString *const kTV24CurrentProgramTimeKey = @"on-now-time";

static NSString *const kTV24NextProgramTitleKey = @"up-next";
static NSString *const kTV24NextProgramTimeKey = @"up-next-time";

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

- (NSString *)getChannelLogo {

    return [self.channelDatas valueForKey:kTV24ChannelLogoKey];
}

- (NSString *)getChannelCurrentProgramTitle {

    return [self.channelDatas valueForKey:kTV24CurrentProgramTitleKey];
}

- (NSString *)getChannelCurrentProgramDescription {

    return [self.channelDatas valueForKey:kTV24CurrentProgramDescriptionKey];
}

- (NSString *)getChannelCurrentProgramTime {

    return [self.channelDatas valueForKey:kTV24CurrentProgramTimeKey];
}

- (NSString *)getChannelNextProgramTitle {

    return [self.channelDatas valueForKey:kTV24NextProgramTitleKey];
}

- (NSString *)getChannelNextProgramTime {

    return [self.channelDatas valueForKey:kTV24NextProgramTimeKey];
}

#pragma mark - ---- PUBLIC


@end
