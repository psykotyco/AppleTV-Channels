//
//  ChannelClanTV.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelClanTV.h"

static NSString *const kClanTVIdKey = @"id";
static NSString *const kClanTVVideoTitleKey = @"video_title";
static NSString *const kClanTVVideoUrlKey = @"video_url";
static NSString *const kClanTVVideoThumbnailKey = @"video_thumbnail";
static NSString *const kClanTVVideoDurationKey = @"video_duration";
static NSString *const kClanTVVideoDescriptionKey = @"video_description";
static NSString *const kClanTVCidKey = @"cid";
static NSString *const kClanTVCatIdKey = @"cat_id";
static NSString *const kClanTVCategoryNameKey = @"category_name";
static NSString *const kClanTVCategoryImageKey = @"category_image";

@interface ChannelClanTV ()

@property (nonatomic, copy) NSDictionary *channelDatas;

@end

@implementation ChannelClanTV

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
    
    return [self.channelDatas valueForKey:kClanTVIdKey];
}

- (NSString *)getTitle {
    
    return [self.channelDatas valueForKey:kClanTVVideoTitleKey];
}

- (NSString *)getUrl {
    
    return [self.channelDatas valueForKey:kClanTVVideoUrlKey];
}

- (NSString *)getThumbnailName {
    
    return [self.channelDatas valueForKey:kClanTVVideoThumbnailKey];
}

- (NSString *)getDuration {
    
    return [self.channelDatas valueForKey:kClanTVVideoDurationKey];
}

- (NSString *)getChannelDescription {
    
    return [self.channelDatas valueForKey:kClanTVVideoDescriptionKey];
}

- (NSString *)getCid {
    
    return [self.channelDatas valueForKey:kClanTVCidKey];
}

- (NSString *)getCategoryId {
    
    return [self.channelDatas valueForKey:kClanTVCatIdKey];
}

- (NSString *)getCategoryName {
    
    return [self.channelDatas valueForKey:kClanTVCategoryNameKey];
}

- (NSString *)getCategoryImageName {
    
    return [self.channelDatas valueForKey:kClanTVCategoryImageKey];
}

#pragma mark - ---- PUBLIC

@end
