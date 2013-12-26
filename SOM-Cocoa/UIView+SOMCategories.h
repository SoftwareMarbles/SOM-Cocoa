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
//  UIView+SOMCategories.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (SOMCategories)

//  Removes all the subviews of the view and returns the array with all of them.
- (NSArray*)som_removeSubviews;

//  Hides all the peer views of the given view and returns an array of the ones that were previously not hidden.
- (NSArray*)som_hidePeerViews;

@end
