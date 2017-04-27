//
//  ChannelCategoryProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChannelCategoryProtocol <NSObject>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary channels:(NSArray *)channels;

- (NSString *)getCategoryId;
- (NSString *)getCategoryName;
- (NSString *)getCategoryImageName;
- (NSArray *)getCategoryChannels;

@end
