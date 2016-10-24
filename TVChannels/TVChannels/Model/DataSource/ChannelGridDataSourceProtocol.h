//
//  ChannelGridDataSourceProtocol.h
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelCategoryProtocol.h"

typedef void (^categoryListCompletionBlock)(NSArray <id<ChannelCategoryProtocol>> *result, NSError *error);
typedef void (^imageCompletionBlock)(UIImage *result, NSError *error);

@protocol ChannelGridDataSourceProtocol <NSObject>

- (void)getCategoryListWithCompletion:(categoryListCompletionBlock)block;
- (void)getImageWithName:(NSString *)imageName completion:(imageCompletionBlock)block;

@end
