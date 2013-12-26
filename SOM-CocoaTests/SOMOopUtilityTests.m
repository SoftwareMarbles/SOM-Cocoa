//
//  SOMOopUtilityTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//  Copyright (c) 2013 Software Marbles. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SOMOopUtility.h"

@interface SOMOopUtilityTests : XCTestCase

@end

@implementation SOMOopUtilityTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertThrowsSpecificNamed([SOMOopUtility abstractMethodInvoked:_cmd], NSException, NSInternalInconsistencyException);
    XCTAssertThrowsSpecificNamed([SOMOopUtility unimplementedMethodInvoked:_cmd], NSException, NSInternalInconsistencyException);
}

@end
