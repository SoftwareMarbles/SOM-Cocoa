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
//  UIColor+SOMCategoriesTests.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//

#import <XCTest/XCTest.h>

#import "UIColor+SOMCategories.h"

@interface UIColor_SOMCategoriesTests : XCTestCase

@end

//  The accuracy for RGBA components should be one half of 1 in 256.
static const CGFloat RGBA_COMPONENTS_ACCURACY = 0.5f * 1.00f / 256.0f;

@implementation UIColor_SOMCategoriesTests

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

- (void)testColorWithRGBA
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;

    //  Test a color with all different components.
    UIColor *testColor = [UIColor som_colorWithRGBA:0xfffddd80];
    [testColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 1.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.9921f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.8667f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.502f, RGBA_COMPONENTS_ACCURACY);

    //  Test white transparent color.
    testColor = [UIColor som_colorWithRGBA:0x00000000];
    [testColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.0f, RGBA_COMPONENTS_ACCURACY);

    //  Test black opaque color.
    testColor = [UIColor som_colorWithRGBA:0xffffffff];
    [testColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 1.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, RGBA_COMPONENTS_ACCURACY);
}

- (void)testTransparentBlack
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    
    [[UIColor som_transparentBlack] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, RGBA_COMPONENTS_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.0f, RGBA_COMPONENTS_ACCURACY);
}

@end
