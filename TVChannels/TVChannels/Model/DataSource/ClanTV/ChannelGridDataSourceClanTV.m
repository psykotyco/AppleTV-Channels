//
//  ChannelGridClanTVDataSource.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridDataSourceClanTV.h"
#import "ChannelClanTV.h"
#import "ChannelCategoryClanTV.h"
#import "NetworkRequestLauncher.h"

static NSString *const CHANNELS_SERVICES_CATEGORY_CHANNELS_KEY = @"cat_id";
static NSString *const CHANNELS_SERVICES_PAGE_PARAM_KEY = @"latest";
static NSInteger const CHANNELS_SERVICES_PAGE_PARAM_VALUE = 25;
static NSString *const CHANNELS_SERVICES_PATH = @"/clan/applegreen/api.php";
static NSString *const IMAGES_SERVICES_PATH = @"/images";
static NSString *const SERVER_BASE_URL = @"http://ildom.es";
static NSString *const SERVER_IMAGE_BASE_URL = @"http://cdn.redyinfo.com";
static NSString *const RESPONSE_DICTIONARY_KEY = @"DailyMotion";

@implementation ChannelGridDataSourceClanTV

#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

- (NSString *)getChannelWebServiceUrl  {
    
    return [NSString stringWithFormat:@"%@%@", SERVER_BASE_URL, CHANNELS_SERVICES_PATH];
}

- (NSString *)getImageUrlForImageWithName:(NSString *)imageName {
    
    return [NSString stringWithFormat:@"%@%@/%@", SERVER_IMAGE_BASE_URL, IMAGES_SERVICES_PATH, imageName];
}

#pragma mark - ---- PUBLIC

- (void)getCategoryListWithCompletion:(categoryListCompletionBlock)block {

    NSString *url = [self getChannelWebServiceUrl];
    NSDictionary *params = @{CHANNELS_SERVICES_PAGE_PARAM_KEY:@(CHANNELS_SERVICES_PAGE_PARAM_VALUE)};
    
    [[NetworkRequestLauncher new] launchUrl:url headers:nil queryParams:params completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
        } else {
            id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

            if ([[jsonResponse class] isSubclassOfClass:[NSDictionary class]]) {

                NSArray *latestChannelsResponse = jsonResponse[RESPONSE_DICTIONARY_KEY];
                NSMutableArray *categories = [NSMutableArray new];
                NSMutableArray *channels = [NSMutableArray new];

                for (NSDictionary *channel in latestChannelsResponse) {
                    [channels addObject:[[ChannelClanTV alloc] initWithDictionary:channel]];
                }

                NSDictionary *category = @{kClanTVCategoryIdKey : @"", kClanTVCategoryNameKey : @"Principales", kClanTVCategoryImageKey : @"7929_star.png"};
                ChannelCategoryClanTV *channelCategory = [[ChannelCategoryClanTV alloc] initWithDictionary:category channels:channels];
                [categories addObject:channelCategory];

                block([categories copy], nil);
            }
        }
    }];
}

- (void)getImageWithName:(NSString *)imageName completion:(imageCompletionBlock)block {
    
    NSString *url = [self getImageUrlForImageWithName:imageName];
    [[NetworkRequestLauncher new] launchUrl:url completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil,error);
        } else {
            block([UIImage imageWithData:data scale:1.0f], nil);
        }
    }];
}

@end
