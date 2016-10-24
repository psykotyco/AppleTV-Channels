//
//  ChannelGridPresenterTest.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChannelGridPresenter.h"
#import "ChannelGridViewControllerMock.h"
#import "ChannelGridDataSourceMockOk.h"
#import "ChannelGridDataSourceMockError.h"
#import "RoutingManagerMock.h"

@interface ChannelGridPresenterTest : XCTestCase

@end

@implementation ChannelGridPresenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPresenterInitPropertiesNil {

    ChannelGridPresenter *presenter = [[ChannelGridPresenter alloc] initWithView:nil dataSource:nil andRoutingManager:nil];
    
    XCTAssertNil([presenter getView], "View property in the presenter has to be nil");
    XCTAssertNil([presenter getDataSource], "DataSource property in the presenter has to be nil");
    XCTAssertNil([presenter getRoutingManager], "RoutingManager property in the presenter has to be nil");
}

- (void)testPresenterInitPropertiesNotNil {
    
    ChannelGridViewControllerMock *viewControllerMock = [ChannelGridViewControllerMock new];
    ChannelGridDataSourceMockOk *dataSourceMock = [ChannelGridDataSourceMockOk new];
    RoutingManagerMock *routingMock = [RoutingManagerMock new];
    ChannelGridPresenter *presenter = [[ChannelGridPresenter alloc] initWithView:viewControllerMock dataSource:dataSourceMock andRoutingManager:routingMock];
    
    XCTAssertNotNil([presenter getView], "View property in the presenter has not to be nil");
    XCTAssertNotNil([presenter getDataSource], "DataSource property in the presenter has not to be nil");
    XCTAssertNotNil([presenter getRoutingManager], "RoutingManager property in the presenter has not to be nil");
}

- (void)testPresenterImplementsProtocolMethods {

    XCTAssertTrue([ChannelGridPresenter instancesRespondToSelector:@selector(refreshData)]);
    XCTAssertTrue([ChannelGridPresenter instancesRespondToSelector:@selector(channelDidSelectedAtIndexPath:)]);
}

@end
