//
//  RoutingManagerProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelProtocol.h"

@protocol RoutingManagerProtocol <NSObject>

- (void)showErrorWithMessage:(NSString *)message;
- (void)showPlayerWithChannel:(id<ChannelProtocol>)channel;

@end
