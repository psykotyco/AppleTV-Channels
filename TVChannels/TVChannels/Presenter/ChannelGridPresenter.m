//
//  ChannelGridPresenter.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridPresenter.h"
#import "ChannelCategoryProtocol.h"

@interface ChannelGridPresenter ()

@property (nonatomic, weak) id<ChannelGridViewControllerProtocol> view;
@property (nonatomic, strong) id<ChannelGridDataSourceProtocol> dataSource;
@property (nonatomic, weak) id<RoutingManagerProtocol> routingManager;

@property (nonatomic, strong) NSArray<id<ChannelCategoryProtocol>> *channelCategories;

@end

@implementation ChannelGridPresenter

#pragma mark - ---- LIFECYCLE

- (instancetype)initWithView:(id<ChannelGridViewControllerProtocol>)newView dataSource:(id<ChannelGridDataSourceProtocol>)newChannelDataSource andRoutingManager:(id<RoutingManagerProtocol>)newRoutingManager {

    self = [super init];
    if (self) {
        _view = newView;
        _dataSource = newChannelDataSource;
        _routingManager = newRoutingManager;
    }
    
    return self;
}

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (void)channelDidSelectedAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.routingManager respondsToSelector:@selector(showPlayerWithChannel:)]) {
        id<ChannelCategoryProtocol> channelCategory = [self.channelCategories objectAtIndex:indexPath.section];
        id<ChannelProtocol> channel = [[channelCategory getCategoryChannels] objectAtIndex:indexPath.row];
        [self.routingManager showPlayerWithChannel:channel];
    }
}

- (void)refreshData {
    
    if ([self.dataSource respondsToSelector:@selector(getCategoryListWithCompletion:)] &&
        [self.view respondsToSelector:@selector(showChannelCategories:)]) {
        
        [self.view respondsToSelector:@selector(showLoading)] ? [self.view showLoading] : nil;
        __weak ChannelGridPresenter *weakSelf = self;
        [self.dataSource getCategoryListWithCompletion:^(NSArray<id<ChannelCategoryProtocol>> *result, NSError *error) {
            
            [weakSelf setChannelCategories:result];
            [self.view respondsToSelector:@selector(hideLoading)] ? [self.view hideLoading] : nil;
            
            if (error) {
                if ([self.routingManager respondsToSelector:@selector(showErrorWithMessage:)]) {
                    [self.routingManager showErrorWithMessage:NSLocalizedString(@"Error:Load:Message", nil)];
                }
            } else {
                [self.view showChannelCategories:result];
            }
            
        }];
    }
}

- (id<ChannelGridViewControllerProtocol>)getView {
    
    return _view;
}

- (id<ChannelGridDataSourceProtocol>)getDataSource {

    return _dataSource;
}

- (id<RoutingManagerProtocol>)getRoutingManager {

    return _routingManager;
}

@end
