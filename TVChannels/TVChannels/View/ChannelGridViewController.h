//
//  ChannelGridViewController.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelGridViewControllerProtocol.h"
#import "ChannelGridPresenterProtocol.h"
#import "ChannelGridCellPresenterProtocol.h"

@interface ChannelGridViewController : UIViewController <ChannelGridViewControllerProtocol>

@property (nonatomic, strong) id<ChannelGridPresenterProtocol> presenter;
@property (nonatomic, strong) id<ChannelGridCellPresenterProtocol> cellPresenter;

@end
