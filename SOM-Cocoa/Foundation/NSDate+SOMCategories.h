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
//  NSString+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 1/20/14.
//  Copyright (c) 2014 Software Marbles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SOMCategories)

//  Returns a new NSDate with no seconds component.
- (NSDate*) som_dateWithZeroSeconds;
//  Returns a new NSDate with no only date component.
- (NSDate*) som_dateWithNoTime;
//  Returns a new NSDate with the time but no date component. This will actually return the time for 0001-01-01 date.
- (NSDate*) som_timeWithNoDate;

@end
