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
//  UIView+SOMCategories.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//

#import "UIView+SOMCategories.h"

@implementation UIView (SOMCategories)

- (NSArray *)som_removeSubviews {
    //  Make a copy of the array of subviews so that we can safely enumerate on it
    //  while we change the actual view's array.
    NSArray *subviews = [[self subviews] copy];
    
    //  Remove all the subviews from their super view.
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view removeFromSuperview];
    }];
    
    return subviews;
}

- (NSArray*)som_hidePeerViews {
    NSMutableArray *hiddenViews = [NSMutableArray new];
    
    //  Hide all the peer views that are currently visible (not hidden)
    UIView *superView = self.superview;
    [superView.subviews enumerateObjectsUsingBlock:^(UIView *peerView, NSUInteger idx, BOOL *stop) {
        if(peerView
           && peerView != self
           && !peerView.hidden) {
            peerView.hidden = YES;
            [hiddenViews addObject:peerView];
        }
    }];
    
    return hiddenViews;
}

@end
