//
//  ChannelGridPresenter.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelGridPresenterProtocol.h"
#import "RoutingManagerProtocol.h"

@interface ChannelGridPresenter : NSObject <ChannelGridPresenterProtocol>

- (instancetype)initWithView:(id<ChannelGridViewControllerProtocol>)view dataSource:(id<ChannelGridDataSourceProtocol>)channelDataSource andRoutingManager:(id<RoutingManagerProtocol>)routingManager;

- (id<ChannelGridViewControllerProtocol>)getView;
- (id<ChannelGridDataSourceProtocol>)getDataSource;
- (id<RoutingManagerProtocol>)getRoutingManager;

@end
