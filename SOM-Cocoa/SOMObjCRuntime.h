//
//  SOMObjCRuntime.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 7/17/14.
//  Copyright (c) 2014 Software Marbles. All rights reserved.
//

#include <objc/runtime.h>

#define objc_dynamic_cast(class, object) \
    ([object isKindOfClass:(Class)objc_getClass(#class)] ? (class *)object : nil)
