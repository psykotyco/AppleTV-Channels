//
//  NetworkRequestLauncher.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkRequestResultBlock)(NSData *data, NSURLResponse *response, NSError *error);

@interface NetworkRequestLauncher : NSObject

@property (nonatomic, readonly) NSURLRequest *urlRequest;

- (void)launchUrl:(NSString *)url
       completion:(NetworkRequestResultBlock)block;

- (void)launchUrl:(NSString *)url
          headers:(NSDictionary *)headers
       completion:(NetworkRequestResultBlock)block;

- (void)launchUrl:(NSString *)url
          headers:(NSDictionary *)headers
      queryParams:(NSDictionary *)queryParams
       completion:(NetworkRequestResultBlock)block;

- (void)launchUrl:(NSString *)url
          headers:(NSDictionary *)headers
      queryParams:(NSDictionary *)queryParams
       bodyParams:(NSData *)bodyParams
       completion:(NetworkRequestResultBlock)block;

- (void)launchUrlRequest:(NSURLRequest *)urlRequest
              completion:(NetworkRequestResultBlock)block;

@end
