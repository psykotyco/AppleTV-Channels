//
//  ChannelProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChannelProtocol <NSObject>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

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
- (NSString *)getChannelLogo;

- (NSString *)getChannelCurrentProgramTitle;
- (NSString *)getChannelCurrentProgramDescription;
- (NSString *)getChannelCurrentProgramTime;

- (NSString *)getChannelNextProgramTitle;
- (NSString *)getChannelNextProgramTime;



@end
