//
//  ChannelGridDataSourceMockError.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ChannelGridDataSourceMockError.h"

@implementation ChannelGridDataSourceMockError

#pragma mark - ---- LIFECYCLE

#pragma mark - ---- PRIVATE

#pragma mark - ---- PUBLIC

- (void)getCategoryListWithCompletion:(categoryListCompletionBlock)block {
    
    NSError *error = [[NSError alloc] init];
    block(nil, error);
}

- (void)getImageWithName:(NSString *)imageName completion:(imageCompletionBlock)block {
    
    NSError *error = [[NSError alloc] init];
    block(nil, error);
}

@end
