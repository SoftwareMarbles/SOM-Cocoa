//
//  Copyright 2014 Software Marbles SpA
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
//  NSDate+SOMCategoriesTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 1/20/14.
//

#import <XCTest/XCTest.h>

#import "NSDate+SOMCategories.h"

@interface NSDate_SOMCategoriesTests : XCTestCase

@end

@implementation NSDate_SOMCategoriesTests

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

- (void)testDateWithZeroSeconds
{
    NSDate *testDate = [NSDate dateWithTimeIntervalSinceReferenceDate:411919781.972299];
    
    NSDate *dateZeroSeconds = [testDate som_dateWithZeroSeconds];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:dateZeroSeconds];
    XCTAssertEqual(0, components.second);
    NSTimeInterval seconds = [dateZeroSeconds timeIntervalSinceReferenceDate];
    XCTAssertEqualWithAccuracy(seconds, floor(seconds), 0.001);
}

- (void)testDateWithNoTime
{
    NSDate *testDate = [NSDate dateWithTimeIntervalSinceReferenceDate:411919781.972299];
    
    NSDate *dateWithNoTime = [testDate som_dateWithNoTime];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:dateWithNoTime];
    XCTAssertEqual(0, components.second);
    XCTAssertEqual(0, components.hour);
    XCTAssertNotEqual(0, components.day);
    XCTAssertNotEqual(0, components.month);
    XCTAssertNotEqual(0, components.year);
    
    NSTimeInterval seconds = [dateWithNoTime timeIntervalSinceReferenceDate];
    XCTAssertEqualWithAccuracy(seconds, floor(seconds), 0.001);
}

- (void)testTimeWithNoDate
{
    NSDate *testDate = [NSDate dateWithTimeIntervalSinceReferenceDate:411919781.972299];

    NSDate *timeWithNoDate = [testDate som_timeWithNoDate];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:timeWithNoDate];
    XCTAssertNotEqual(0, components.second);
    XCTAssertNotEqual(0, components.hour);
    //  The best we can do with NSDate is to have January 1st of the year 1.
    XCTAssertEqual(1, components.day);
    XCTAssertEqual(1, components.month);
    XCTAssertEqual(1, components.year);
}

@end
