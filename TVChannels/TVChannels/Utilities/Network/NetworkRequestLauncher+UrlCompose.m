//
//  NetworkRequestLauncher+UrlCompose.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "NetworkRequestLauncher+UrlCompose.h"

@implementation NetworkRequestLauncher (UrlCompose)

#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (NSString *) generateParamsFromDictionary:(NSDictionary *) params {
    
    NSMutableString *composedParams = [NSMutableString new];
    
    for (NSString *key in params.allKeys) {
        if (composedParams.length > 0) {
            [composedParams appendString:@"&"];
        }
        
        [composedParams appendFormat:@"%@=%@", key, params[key]];
    }
    
    return composedParams;
}

- (NSString *) generateComposedUrlFromUrl:(NSString *) url withQueryParams:(NSDictionary *) params {
    
    NSMutableString *result = [NSMutableString stringWithString:url];
    
    if (params.allKeys.count == 0) {
        return result;
    }
    
    NSString *queryParams = [self generateParamsFromDictionary:params];
    NSString *characterToAppend = @"?";
    
    if ([result rangeOfString:@"?"].location != NSNotFound) {
        characterToAppend = @"&";
        
    }
    
    [result appendFormat:@"%@%@", characterToAppend, queryParams];
    
    return result;
}

@end
