//
//  Copyright 2013 Software Marbles SpA
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//
//  NSObject+SOMCategoriesTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//

#import <XCTest/XCTest.h>

#import "NSObject+SOMCategories.h"

@interface NSObject_SOMCategoriesTests : XCTestCase

@end

@implementation NSObject_SOMCategoriesTests

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
    XCTAssertThrowsSpecificNamed([self abstractMethodInvoked:_cmd], NSException, NSInternalInconsistencyException);
    XCTAssertThrowsSpecificNamed([self unimplementedMethodInvoked:_cmd], NSException, NSInternalInconsistencyException);
}

@end
