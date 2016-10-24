//
//  ChannelGridCellPresenterMock.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridCellPresenterMock.h"

@implementation ChannelGridCellPresenterMock
#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}


- (void)setChannelCategoriesToShow:(NSArray<id<ChannelCategoryProtocol>> *)channelCategories {
}

@end
