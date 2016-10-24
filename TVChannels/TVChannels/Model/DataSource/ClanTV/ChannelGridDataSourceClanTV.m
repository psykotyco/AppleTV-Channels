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
static NSString *const CHANNELS_SERVICES_PAGE_PARAM_KEY = @"page";
static NSInteger const CHANNELS_SERVICES_PAGE_PARAM_VALUE = 1;
static NSString *const CHANNELS_SERVICES_PATH = @"/apple/api.php";
static NSString *const IMAGES_SERVICES_PATH = @"/server/images";
static NSString *const SERVER_BASE_URL = @"http://clantv.net";
static NSString *const RESPONSE_DICTIONARY_KEY = @"DailyMotion";

@implementation ChannelGridDataSourceClanTV

#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

- (NSString *)getChannelWebServiceUrl  {
    
    return [NSString stringWithFormat:@"%@%@", SERVER_BASE_URL, CHANNELS_SERVICES_PATH];
}

- (void)getChannelListWithCategoryId:(NSInteger)categoryId completion:(void (^)(NSArray <id<ChannelProtocol>> *result, NSError *error))block {
    
    NSString *url = [self getChannelWebServiceUrl];
    NSDictionary *params = @{CHANNELS_SERVICES_CATEGORY_CHANNELS_KEY:[NSNumber numberWithInteger:categoryId],
                             CHANNELS_SERVICES_PAGE_PARAM_KEY:@(CHANNELS_SERVICES_PAGE_PARAM_VALUE)};
    
    [[NetworkRequestLauncher new] launchUrl:url headers:nil queryParams:params completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
        } else {
            id channelsResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *result = nil;
            if ([[channelsResponse class] isSubclassOfClass:[NSDictionary class]]) {
                result = [NSMutableArray new];
                for (NSDictionary *channel in channelsResponse[RESPONSE_DICTIONARY_KEY]) {
                    [result addObject:[[ChannelClanTV alloc] initWithDictionary:channel]];
                }
            }
            block(result, error);
        }
    }];
}

- (NSString *)getImageUrlForImageWithName:(NSString *)imageName {
    
    return [NSString stringWithFormat:@"%@%@/%@", SERVER_BASE_URL, IMAGES_SERVICES_PATH, imageName];
}

- (NSArray *)orderCategoriesById:(NSArray *)categories {
    
    return [categories sortedArrayUsingComparator:^NSComparisonResult(id<ChannelCategoryProtocol> cat1, id<ChannelCategoryProtocol> cat2) {
        NSInteger cat1Id = [[cat1 getCategoryId] integerValue];
        NSInteger cat2Id = [[cat2 getCategoryId] integerValue];
        
        if (cat1Id < cat2Id) {
            return NSOrderedAscending;
        } else if (cat1Id > cat2Id) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
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
                NSArray *categoriesResponse = jsonResponse[RESPONSE_DICTIONARY_KEY];
                __block NSMutableArray *categories = [NSMutableArray new];
                for (NSDictionary *category in categoriesResponse) {
                    NSInteger categoryId = [category[kClanTVCategoryIdKey] integerValue];
                    [self getChannelListWithCategoryId:categoryId completion:^(NSArray *result, NSError *error) {
                        if (!error) {
                            ChannelCategoryClanTV *channelCategory = [[ChannelCategoryClanTV alloc] initWithDictionary:category channels:result];
                            [categories addObject:channelCategory];
                        }
                        
                        if ([[categoriesResponse lastObject] isEqual:category]) {
                            block([[self orderCategoriesById:categories] copy], nil);
                        }
                    }];
                }
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
