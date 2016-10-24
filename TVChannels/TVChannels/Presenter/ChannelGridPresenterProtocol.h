//
//  ChannelGridPresenterProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelGridViewControllerProtocol.h"
#import "ChannelGridDataSourceProtocol.h"

@protocol ChannelGridPresenterProtocol <NSObject>

- (void)refreshData;
- (void)channelDidSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end
