//
//  ObjCRuntimeTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 7/17/14.
//  Copyright (c) 2014 Software Marbles. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SOMObjCRuntime.h"

@interface ObjCRuntimeTests : XCTestCase

@end

@implementation ObjCRuntimeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCast
{
    XCTAssertNil(objc_dynamic_cast(NSString, @1));
    XCTAssertNotNil(objc_dynamic_cast(NSString, @""));
}

@end
