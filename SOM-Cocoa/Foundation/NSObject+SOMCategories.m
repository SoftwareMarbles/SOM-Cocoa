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
//  NSObject+SOMCategories.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 11/21/13.
//

#import "NSObject+SOMCategories.m"

@implementation NSObject (SOMCategories)

- (void)abstractMethodInvoked:(SEL)method {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"The method %@ must be overriden in a subclass", NSStringFromSelector(method)]
                                 userInfo:nil];
}

- (void)unimplementedMethodInvoked:(SEL)method {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"The method %@ is not implemented", NSStringFromSelector(method)]
                                 userInfo:nil];
}

@end
