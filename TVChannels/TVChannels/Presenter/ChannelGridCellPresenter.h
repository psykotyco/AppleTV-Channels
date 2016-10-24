//
//  ChannelGridCellPresenter.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelGridCellPresenterProtocol.h"
#import "ChannelGridDataSourceProtocol.h"

@interface ChannelGridCellPresenter : NSObject <ChannelGridCellPresenterProtocol>

- (instancetype)initWithDataSource:(id<ChannelGridDataSourceProtocol>)dataSource;

- (id<ChannelGridDataSourceProtocol>)getDataSource;

@end
