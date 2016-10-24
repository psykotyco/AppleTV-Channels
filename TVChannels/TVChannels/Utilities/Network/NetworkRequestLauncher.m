//
//  NetworkRequestLauncher.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "NetworkRequestLauncher.h"
#import "NetworkRequestLauncher+UrlCompose.h"

static NSString *const kHttpMethodPost = @"POST";
static NSString *const kHttpMethodGet = @"GET";

@interface NetworkRequestLauncher ()

@property (nonnull, copy) NSMutableURLRequest *request;

@end

@implementation NetworkRequestLauncher

#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (void)launchUrl:(NSString *)url completion:(NetworkRequestResultBlock)block {
    
    [self launchUrl:url headers:nil completion:block];
}

- (void)launchUrl:(NSString *)url headers:(NSDictionary *)headers completion:(NetworkRequestResultBlock)block {

    [self launchUrl:url headers:headers queryParams:nil completion:block];
}

- (void)launchUrl:(NSString *)url headers:(NSDictionary *)headers queryParams:(NSDictionary *)queryParams completion:(NetworkRequestResultBlock)block {
    
    [self launchUrl:url headers:headers queryParams:queryParams bodyParams:nil completion:block];
}

- (void)launchUrl:(NSString *)url headers:(NSDictionary *)headers queryParams:(NSDictionary *)queryParams bodyParams:(NSData *)bodyParams completion:(NetworkRequestResultBlock)block {
    
    NSString *composedUrl = [self generateComposedUrlFromUrl:url withQueryParams:queryParams];
    self.request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:composedUrl]];
    for (NSString *header in headers.allKeys) {
        [self.request setValue:headers[header] forHTTPHeaderField:header];
    }
    
    if (bodyParams.length > 0) {
        [self.request setHTTPMethod:kHttpMethodPost];
        [self.request setHTTPBody:bodyParams];
    } else {
        [self.request setHTTPMethod:kHttpMethodGet];
    }
    
    [self launchUrlRequest:self.request completion:block];
}

- (void)launchUrlRequest:(NSURLRequest *)urlRequest completion:(NetworkRequestResultBlock)block {
    
    self.request = [urlRequest mutableCopy];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(data, response, error);
        });
    }] resume];
}

@end
