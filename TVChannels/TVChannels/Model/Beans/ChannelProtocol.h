//
//  ChannelProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChannelProtocol <NSObject>

- (NSString *)getChannelId;
- (NSString *)getTitle;
- (NSString *)getUrl;
- (NSString *)getThumbnailName;
- (NSString *)getDuration;
- (NSString *)getChannelDescription;
- (NSString *)getCid;
- (NSString *)getCategoryId;
- (NSString *)getCategoryName;
- (NSString *)getCategoryImageName;

@end
