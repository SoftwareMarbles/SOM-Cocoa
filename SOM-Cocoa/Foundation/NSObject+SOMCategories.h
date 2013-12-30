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
//  NSObject+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 11/21/13.
//

#include <Foundation/Foundation.h>

@interface NSObject (SOMCategories)

//  Throws NSInternalInconsistencyException for "abstract" methods. It should be invoked from methods of
//  base classes that *have* to be overriden in the inheriting classes.
//  Usage: [self abstractMethodInvoked:_cmd];
- (void)abstractMethodInvoked:(SEL)method;

//  Throws NSInternalInconsistencyException for unimplemented methods. It should be invoked from methods
//  that have a body but haven't yet been implemented.
//  Usage: [self unimplementedMethodInvoked:_cmd];
- (void)unimplementedMethodInvoked:(SEL)method;

@end
