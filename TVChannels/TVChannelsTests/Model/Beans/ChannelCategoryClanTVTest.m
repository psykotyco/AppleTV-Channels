//
//  ChannelCategoryClanTVTest.m
//  TVChannels
//
//  Created by Ricardo Suarez on 22/10/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChannelCategoryClanTV.h"
#import "ChannelClanTV.h"

@interface ChannelCategoryClanTVTest : XCTestCase

@end

@implementation ChannelCategoryClanTVTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChannelCategoryCheckPropertiesNotNil {
    
    NSDictionary *channelCategoryData = @{@"cid" : @"0",
                                  @"category_name" : @"test",
                                  @"category_image" : @"http://test.com/test"};
    
    NSDictionary *channelData = @{@"id" : @"0",
                                  @"video_title" : @"test",
                                  @"video_url" : @"http://test.com/test",
                                  @"video_thumbnail" : @"test",
                                  @"video_duration" : @"0",
                                  @"video_description" : @"Test",
                                  @"cid" : @"0",
                                  @"cat_id" : @"0",
                                  @"category_name" : @"Test",
                                  @"category_image" : @"Test"};
    
    ChannelClanTV *channel = [[ChannelClanTV alloc] initWithDictionary:channelData];
    ChannelCategoryClanTV *channelCategor = [[ChannelCategoryClanTV alloc] initWithDictionary:channelCategoryData channels:@[channel]];
    
    XCTAssertNotNil([channelCategor getCategoryId], "Property categoryId can't be nil");
    XCTAssertNotNil([channelCategor getCategoryName], "Property categoryName can't be nil");
    XCTAssertNotNil([channelCategor getCategoryImageName], "Property categoryImageName can't be nil");
    XCTAssertNotNil([channelCategor getCategoryChannels], "Property categoryChannels can't be nil");
}

- (void)testChannelCategoryImplementsProtocolMethods {
    
    XCTAssertTrue([ChannelCategoryClanTV instancesRespondToSelector:@selector(getCategoryId)]);
    XCTAssertTrue([ChannelCategoryClanTV instancesRespondToSelector:@selector(getCategoryName)]);
    XCTAssertTrue([ChannelCategoryClanTV instancesRespondToSelector:@selector(getCategoryImageName)]);
    XCTAssertTrue([ChannelCategoryClanTV instancesRespondToSelector:@selector(getCategoryChannels)]);
}

@end
