//
//  NetworkRequestLauncher+UrlCompose.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "NetworkRequestLauncher.h"

@interface NetworkRequestLauncher (UrlCompose)

- (NSString *)generateParamsFromDictionary:(NSDictionary *)params;

- (NSString *)generateComposedUrlFromUrl:(NSString *)url
                         withQueryParams:(NSDictionary *)params;

@end
