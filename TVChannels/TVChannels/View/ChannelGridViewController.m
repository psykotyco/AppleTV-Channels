//
//  ChannelGridViewController.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridViewController.h"

static NSString *const GRID_CHANNEL_CELL_REUSE_IDENTIFIER = @"ChannelCell";
static NSString *const GRID_CATEGORY_HEADER_REUSE_IDENTIFIER = @"HeaderCell";

@interface ChannelGridViewController () <UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *loadingView;
@property (nonatomic, weak) IBOutlet UICollectionView *channelGrid;

@end

@implementation ChannelGridViewController

#pragma mark - ---- LIFECYCLE

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.channelGrid setDataSource:self.cellPresenter];
    if ([self.presenter respondsToSelector:@selector(refreshData)]) {
        [self.presenter refreshData];
    }
}

#pragma mark - ---- PRIVATE

#pragma mark - ---- ---- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if ([self.presenter respondsToSelector:@selector(channelDidSelectedAtIndexPath:)]) {
        [self.presenter channelDidSelectedAtIndexPath:indexPath];
    }
}

#pragma mark - ---- PUBLIC

- (void)showChannelCategories:(NSArray<id<ChannelCategoryProtocol>> *)channelCategories {
    
    if ([self.cellPresenter respondsToSelector:@selector(setChannelCategoriesToShow:)]) {
        [self.cellPresenter setChannelCategoriesToShow:channelCategories];
    }
    
    [self.channelGrid reloadData];
}

- (void)showLoading {
    
    [self.loadingView setHidden:NO];
}

- (void)hideLoading {

    [self.loadingView setHidden:YES];
}

@end
