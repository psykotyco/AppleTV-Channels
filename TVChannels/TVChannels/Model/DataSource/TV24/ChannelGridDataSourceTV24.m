//
//  ChannelGridDataSourceTV24.m
//  TVChannels
//
//  Created by Ricardo Suarez Martinez on 2017-04-27.
//  Copyright © 2017 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridDataSourceTV24.h"
#import "ChannelTV24.h"
#import "ChannelCategoryTV24.h"
#import "NetworkRequestLauncher.h"

static NSString *const CHANNELS_SERVICES_CATEGORY_CHANNELS_KEY = @"cat_id";
static NSString *const CHANNELS_SERVICES_PATH = @"/output.json";
static NSString *const SERVER_BASE_URL = @"https://webscraper.000webhostapp.com";
static NSString *const RESPONSE_DICTIONARY_KEY = @"data";

@implementation ChannelGridDataSourceTV24

#pragma mark - ---- LIFECYCLE
#pragma mark - ---- PRIVATE
#pragma mark - ---- PUBLIC

- (NSString *)getChannelWebServiceUrl  {

    return [NSString stringWithFormat:@"%@%@", SERVER_BASE_URL, CHANNELS_SERVICES_PATH];
}

- (void)getCategoryListWithCompletion:(categoryListCompletionBlock)block {

    NSString *url = [self getChannelWebServiceUrl];

    [[NetworkRequestLauncher new] launchUrl:url headers:nil queryParams:nil completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
        } else {

            id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

            if ([[jsonResponse class] isSubclassOfClass:[NSDictionary class]]) {
                NSArray *channelsResponse = jsonResponse[RESPONSE_DICTIONARY_KEY];
                NSMutableArray *channels = [NSMutableArray new];
                for (NSDictionary *channelDictionary in channelsResponse) {
                    [channels addObject:[[ChannelTV24 alloc] initWithDictionary:channelDictionary]];
                }

                NSDictionary *category = @{kTV24CategoryIdKey : @"", kTV24CategoryNameKey : @"Main Channels", kTV24CategoryImageKey : @""};
                block([[NSArray arrayWithObject:[[ChannelCategoryTV24 alloc] initWithDictionary:category channels:channels]] copy], nil);
            }
        }
    }];
}

- (void)getImageWithUrl:(NSString *)imageUrl completion:(imageCompletionBlock)block {

    [[NetworkRequestLauncher new] launchUrl:imageUrl completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil,error);
        } else {
            block([UIImage imageWithData:data scale:1.0f], nil);
        }
    }];
}
@end
