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
static NSString *const GRID_CATEGORY_HEADER_REUSE_IDENTIFIER = @"HeaderCell";

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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GRID_CATEGORY_HEADER_REUSE_IDENTIFIER forIndexPath:indexPath];
        UILabel *headerTitle = [reusableView viewWithTag:11];
        UIImageView *headerIcon = [reusableView viewWithTag:10];
        
        id<ChannelCategoryProtocol> category = [self.channelCategories objectAtIndex:indexPath.section];
        [headerTitle setText:[category getCategoryName]];
        [headerIcon setImage:nil];
        
        if ([self.dataSource respondsToSelector:@selector(getImageWithName:completion:)]) {
            [self.dataSource getImageWithName:[category getCategoryImageName] completion:^(UIImage *result, NSError *error) {
                [headerIcon setImage:result];
            }];
        }
    }
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GRID_CHANNEL_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    UIImageView *cellImage = [cell viewWithTag:10];
    UILabel *cellTitle = [cell viewWithTag:11];

    NSArray *categoryChannels = [[self.channelCategories objectAtIndex:indexPath.section] getCategoryChannels];
    id<ChannelProtocol> channel = categoryChannels[indexPath.row];
    [cellImage setImage:[UIImage imageNamed:@"channel_placeholder"]];
    [cellTitle setText:[channel getTitle]];
    
    if ([self.dataSource respondsToSelector:@selector(getImageWithName:completion:)]) {
        [self.dataSource getImageWithName:[channel getThumbnailName] completion:^(UIImage *result, NSError *error) {
            if (result && !error) {
                [cellImage setImage:result];
                [cellTitle setText:NULL];
            }
        }];
    } else if ([self.dataSource respondsToSelector:@selector(getImageWithUrl:completion:)]) {
        [self.dataSource getImageWithUrl:[channel getThumbnailName] completion:^(UIImage *result, NSError *error) {
            if (result && !error) {
                [cellImage setImage:result];
                [cellTitle setText:NULL];
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
