//
//  ChannelGridCellPresenterProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelCategoryProtocol.h"

@protocol ChannelGridCellPresenterProtocol <UICollectionViewDataSource>

- (void)setChannelCategoriesToShow:(NSArray<id<ChannelCategoryProtocol>> *)channelCategories;

@end
