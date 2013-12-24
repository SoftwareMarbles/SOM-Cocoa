//
//  NSString+SOMExtensionsTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/24/13.
//  Copyright (c) 2013 Software Marbles. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+SOMExtensions.h"

@interface NSString_SOMExtensionsTests : XCTestCase

@end

@implementation NSString_SOMExtensionsTests

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
    XCTAssert([NSString new].isEmpty);
    
    XCTAssert(!(@"NOT EMPTY".isEmpty));
}

@end
