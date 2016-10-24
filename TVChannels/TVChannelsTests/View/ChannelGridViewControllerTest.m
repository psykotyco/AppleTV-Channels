//
//  ChannelGridViewControllerTest.m
//  TVChannels
//
//  Created by Ricardo Suarez on 23/02/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChannelGridViewController.h"
#import "ChannelGridPresenterMock.h"
#import "ChannelGridCellPresenterMock.h"

@interface ChannelGridViewControllerTest : XCTestCase

@end

@implementation ChannelGridViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewPropertiesNotNil {
    
    ChannelGridPresenterMock *presenter = [ChannelGridPresenterMock new];
    ChannelGridCellPresenterMock *cellPresenter = [ChannelGridCellPresenterMock new];
    ChannelGridViewController *viewController = [ChannelGridViewController new];
    [viewController setPresenter:presenter];
    [viewController setCellPresenter:cellPresenter];
    
    XCTAssertNotNil([viewController presenter], "Presenter property in the view has not to be nil");
    XCTAssertNotNil([viewController cellPresenter], "Cell presenter property in the view has not to be nil");
}

- (void)testViewImplementsProtocolMethods {

    XCTAssertTrue([ChannelGridViewController instancesRespondToSelector:@selector(showChannelCategories:)]);
    XCTAssertTrue([ChannelGridViewController instancesRespondToSelector:@selector(showLoading)]);
    XCTAssertTrue([ChannelGridViewController instancesRespondToSelector:@selector(hideLoading)]);
}

@end
