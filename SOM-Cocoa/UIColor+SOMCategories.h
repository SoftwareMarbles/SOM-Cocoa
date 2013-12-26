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
//  UIColor+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 11/22/13.
//

#include <UIKit/UIKit.h>

@interface UIColor (SOMCategories)

+ (UIColor *)som_colorWithRGBA:(NSUInteger)color;

+ (UIColor *)som_transparentBlack;

@end
