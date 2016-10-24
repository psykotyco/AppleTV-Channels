//
//  ChannelGridDataSourceClanTVTest.m
//  TVChannels
//
//  Created by Ricardo Suarez on 22/10/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChannelGridDataSourceClanTV.h"

@interface ChannelGridDataSourceClanTVTest : XCTestCase

@end

@implementation ChannelGridDataSourceClanTVTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClanTVDataSourceImplementsProtocolMethods {
    
    XCTAssertTrue([ChannelGridDataSourceClanTV instancesRespondToSelector:@selector(getCategoryListWithCompletion:)]);
    XCTAssertTrue([ChannelGridDataSourceClanTV instancesRespondToSelector:@selector(getImageWithName:completion:)]);
}

@end
