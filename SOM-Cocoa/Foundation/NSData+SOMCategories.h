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
//  NSData+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 11/29/13.
//

#include <Foundation/Foundation.h>

@interface NSData (SOMCategories)

//  Extends NSData with conversion to hexadecimal string.
//  As seen here: http://stackoverflow.com/questions/1305225/best-way-to-serialize-a-nsdata-into-an-hexadeximal-string/9084784#9084784
- (NSString *)som_asHexadecimalString;

@end
