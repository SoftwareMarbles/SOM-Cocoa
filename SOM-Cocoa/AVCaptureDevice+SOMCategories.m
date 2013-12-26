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
//  AVCaptureDevice+SOMCategories.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/26/13.
//

#import "AVCaptureDevice+SOMCategories.h"

@implementation AVCaptureDevice (SOMCategories)

+ (AVCaptureDevice *)som_findVideoDeviceWithPosition:(AVCaptureDevicePosition)position {
    for (AVCaptureDevice *device in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if ([device position] == position) {
            return device;
        }
    }
    
    return nil;
}

+ (AVCaptureDevice *)som_findFirstAudioDevice {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio];
    if ([devices count] > 0) {
        return [devices objectAtIndex:0];
    }
    
    return nil;
}
@end
