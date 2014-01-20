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
//  NSDate+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 1/20/14.
//  Copyright (c) 2014 Software Marbles. All rights reserved.
//

#import "NSDate+SOMCategories.h"

@implementation NSDate (SOMCategories)

- (NSDate*) som_dateWithZeroSeconds {
    //  Use the fact that seconds is the basic unit of NSDate.
    const double SECONDS_IN_MINUTE = 60.0f;
    NSTimeInterval totalSeconds = [self timeIntervalSinceReferenceDate];
    NSTimeInterval secondsAndFraction = fmod(totalSeconds, SECONDS_IN_MINUTE);
    
    return [NSDate dateWithTimeIntervalSinceReferenceDate:(totalSeconds - secondsAndFraction)];
}

- (NSDate*) som_dateWithNoTime {
    //  Extract the date components and construct a new NSDate from them.
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    return [calendar dateFromComponents:components];
}

- (NSDate*) som_timeWithNoDate {
    //  Extract the hour and second components.
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitSecond fromDate:self];
    NSDate *timeWithNoFraction = [calendar dateFromComponents:components];
    
    //  Get the fraction of the second.
    NSTimeInterval time = [self timeIntervalSinceReferenceDate];
    NSTimeInterval fraction = time - trunc(time);
    
    return [timeWithNoFraction dateByAddingTimeInterval:fraction];
}

@end
