//
//  ChannelGridCellPresenter.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridCellPresenter.h"
#import "ChannelProtocol.h"

static NSString *const GRID_CHANNEL_CELL_REUSE_IDENTIFIER = @"ChannelCell";

@interface ChannelGridCellPresenter ()

@property (nonatomic, copy) NSArray<id<ChannelCategoryProtocol>> *channelCategories;
@property (nonatomic, strong) id<ChannelGridDataSourceProtocol>dataSource;

@end

@implementation ChannelGridCellPresenter

#pragma mark - ---- LIFECYCLE

- (instancetype)initWithDataSource:(id<ChannelGridDataSourceProtocol>)newDataSource {
    
    self = [super init];
    if (self) {
        _dataSource = newDataSource;
    }
    
    return self;
}

#pragma mark - ---- PRIVATE

#pragma mark - ---- ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.channelCategories.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [[[self.channelCategories objectAtIndex:section] getCategoryChannels] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GRID_CHANNEL_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    UIImageView *programImage = [cell viewWithTag:10];
    UIImageView *channelImage = [cell viewWithTag:11];
    UILabel *currentProgram = [cell viewWithTag:12];
    UILabel *nextProgram = [cell viewWithTag:13];


    NSArray *categoryChannels = [[self.channelCategories objectAtIndex:indexPath.section] getCategoryChannels];
    id<ChannelProtocol> channel = categoryChannels[indexPath.row];
    [programImage setImage:[UIImage imageNamed:@"channel_placeholder"]];
    
    if ([self.dataSource respondsToSelector:@selector(getImageWithName:completion:)]) {
        [self.dataSource getImageWithName:[channel getThumbnailName] completion:^(UIImage *result, NSError *error) {
            if (result && !error) {
                [programImage setImage:result];
            }
        }];
    } else if ([self.dataSource respondsToSelector:@selector(getImageWithUrl:completion:)]) {
        [self.dataSource getImageWithUrl:[channel getThumbnailName] completion:^(UIImage *result, NSError *error) {
            if (result && !error) {
                [programImage setImage:result];
            }
        }];
    }
    
    return cell;
}

#pragma mark - ---- PUBLIC

- (void)setChannelCategoriesToShow:(NSArray<id<ChannelCategoryProtocol>> *)newChannelCategories {

    self.channelCategories = newChannelCategories;
}

- (id<ChannelGridDataSourceProtocol>)getDataSource {
    
    return  _dataSource;
}

@end
