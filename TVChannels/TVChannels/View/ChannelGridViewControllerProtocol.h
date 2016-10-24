//
//  ChannelGridViewControllerProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelCategoryProtocol.h"

@protocol ChannelGridViewControllerProtocol <NSObject>

- (void)showChannelCategories:(NSArray<id<ChannelCategoryProtocol>> *)channelCategories;
- (void)showLoading;
- (void)hideLoading;

@end
