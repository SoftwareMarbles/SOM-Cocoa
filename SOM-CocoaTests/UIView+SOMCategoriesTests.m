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
//  Created by Ivan Erceg on 12/26/13.
//

#import <XCTest/XCTest.h>

#import "UIView+SOMCategories.h"

@interface UIView_SOMCategoriesTests : XCTestCase

@end

@implementation UIView_SOMCategoriesTests

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

- (void)testRemoveSubviews
{
    UIView *topView = [UIView new];
    XCTAssert([topView som_removeSubviews].count == 0);
    
    UIView *subView1 = [UIView new];
    [topView addSubview:subView1];
    UIView *subView2 = [UIView new];
    [topView addSubview:subView2];
    
    //  Remove the subviews.
    NSArray *removedSubviews = [topView som_removeSubviews];
    
    //  Repeated calls should return 0 subviews.
    XCTAssert([topView som_removeSubviews].count == 0);
    
    XCTAssert(removedSubviews.count == 2);
    XCTAssertEqual(removedSubviews[0], subView1);
    XCTAssertEqual(removedSubviews[1], subView2);
}

- (void)testHidePeerViews
{
    UIView *topView = [UIView new];
    UIView *subView1 = [UIView new];
    [topView addSubview:subView1];
    XCTAssert(!subView1.hidden);
    UIView *subView2 = [UIView new];
    [topView addSubview:subView2];
    XCTAssert(!subView2.hidden);
    
    //  Hide the peer views.
    NSArray *hiddenPeerViews = [subView1 som_hidePeerViews];
    XCTAssert(hiddenPeerViews.count == 1);
    XCTAssertEqual(hiddenPeerViews[0], subView2);
    XCTAssert(!subView1.hidden);
    XCTAssert(subView2.hidden);
}

@end
