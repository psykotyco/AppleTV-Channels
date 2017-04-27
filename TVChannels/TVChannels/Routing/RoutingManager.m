//
//  RoutingManager.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "RoutingManager.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "ChannelGridCellPresenter.h"
#import "ChannelGridPresenter.h"
#import "ChannelGridViewController.h"
#import "ChannelGridDataSourceClanTV.h"
#import "ChannelGridDataSourceTV24.h"

static NSString *const kMainStoryboardName = @"Main";

@implementation RoutingManager

#pragma mark - ---- LIFECYCLE

- (void)viewDidLoad {
    
    [super viewDidLoad];
//  Uncomment next line to enable ClanTV. You will need to comment the startWithTV24 call
//    [self startWithClanTV];
    [self startWithTV24];
}

#pragma mark - ---- PRIVATE

- (void)startWithClanTV {
    
    ChannelGridViewController *channelGridViewController = [[UIStoryboard storyboardWithName:kMainStoryboardName bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ChannelGridViewController class])];
    ChannelGridDataSourceClanTV *channelGridDataSource = [ChannelGridDataSourceClanTV new];
    ChannelGridCellPresenter *channelGridCellPresenter = [[ChannelGridCellPresenter alloc] initWithDataSource:channelGridDataSource];
    ChannelGridPresenter *channelGridPresenter = [[ChannelGridPresenter alloc] initWithView:channelGridViewController dataSource:channelGridDataSource andRoutingManager:self];
    [channelGridViewController setPresenter:channelGridPresenter];
    [channelGridViewController setCellPresenter:channelGridCellPresenter];
    self.viewControllers = @[channelGridViewController];
}

- (void)startWithTV24 {

    ChannelGridViewController *channelGridViewController = [[UIStoryboard storyboardWithName:kMainStoryboardName bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ChannelGridViewController class])];
    ChannelGridDataSourceTV24 *channelGridDataSource = [ChannelGridDataSourceTV24 new];
    ChannelGridCellPresenter *channelGridCellPresenter = [[ChannelGridCellPresenter alloc] initWithDataSource:channelGridDataSource];
    ChannelGridPresenter *channelGridPresenter = [[ChannelGridPresenter alloc] initWithView:channelGridViewController dataSource:channelGridDataSource andRoutingManager:self];
    [channelGridViewController setPresenter:channelGridPresenter];
    [channelGridViewController setCellPresenter:channelGridCellPresenter];
    self.viewControllers = @[channelGridViewController];
}

#pragma mark - ---- PUBLIC

- (void)showErrorWithMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error:Title", nil) message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Error:Action:Title", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showPlayerWithChannel:(id<ChannelProtocol>)channel {
    
    NSURL *urlToLoad = [NSURL URLWithString:[channel getUrl]];
    if (urlToLoad) {
        AVURLAsset *asset = [AVURLAsset assetWithURL:urlToLoad];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
        AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
        AVPlayerViewController *playerViewController = [AVPlayerViewController new];
        playerViewController.player = player;
        [self presentViewController:playerViewController animated:YES completion:^{
            [playerViewController.player play];
        }];
    } else {
        [self showErrorWithMessage:NSLocalizedString(@"Error:Player:Message", nil)];
    }
}

@end
