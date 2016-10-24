//
//  ChannelClanTVTest.m
//  TVChannels
//
//  Created by Ricardo Suarez on 22/10/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChannelClanTV.h"

@interface ChannelClanTVTest : XCTestCase

@end

@implementation ChannelClanTVTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChannelCheckPropertiesNotNil {
    
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
    
    XCTAssertNotNil([channel getChannelId], "Property channelId can't be nil");
    XCTAssertNotNil([channel getTitle], "Property title can't be nil");
    XCTAssertNotNil([channel getUrl], "Property url can't be nil");
    XCTAssertNotNil([channel getThumbnailName], "Property thumbnailName can't be nil");
    XCTAssertNotNil([channel getDuration], "Property duration can't be nil");
    XCTAssertNotNil([channel getChannelDescription], "Property channelDescription can't be nil");
    XCTAssertNotNil([channel getCid], "Property cid can't be nil");
    XCTAssertNotNil([channel getCategoryId], "Property categoryId can't be nil");
    XCTAssertNotNil([channel getCategoryName], "Property categoryName can't be nil");
    XCTAssertNotNil([channel getCategoryImageName], "Property categoryImageName can't be nil");
}

- (void)testChannelImplementsProtocolMethods {
    
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getChannelId)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getTitle)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getUrl)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getThumbnailName)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getDuration)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getChannelDescription)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getCid)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getCategoryId)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getCategoryName)]);
    XCTAssertTrue([ChannelClanTV instancesRespondToSelector:@selector(getCategoryImageName)]);
}

@end
