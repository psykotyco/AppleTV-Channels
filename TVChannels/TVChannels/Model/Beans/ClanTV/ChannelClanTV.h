//
//  ChannelClanTV.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelProtocol.h"

@interface ChannelClanTV : NSObject <ChannelProtocol>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
