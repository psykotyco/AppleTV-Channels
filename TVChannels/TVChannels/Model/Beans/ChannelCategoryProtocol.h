//
//  ChannelCategoryProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChannelCategoryProtocol <NSObject>

- (NSString *)getCategoryId;
- (NSString *)getCategoryName;
- (NSString *)getCategoryImageName;
- (NSArray *)getCategoryChannels;

@end
