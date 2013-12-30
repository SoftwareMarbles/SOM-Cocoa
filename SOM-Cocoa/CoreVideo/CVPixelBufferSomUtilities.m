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
//  CVPixelBufferSomUtilities.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/29/13.
//

#import "CVPixelBufferSomUtilities.h"

#import <Accelerate/Accelerate.h>

CVReturn CVPixelBufferSomCreateSimple(size_t width,
                                      size_t height,
                                      OSType pixelFormatType,
                                      CVPixelBufferRef *pixelBufferOut)
{
    //  In order to correctly construct CIImage objects from cropped pixel buffer we need to have empty IOSurface property
    //  as part of the attributes of the
    CFDictionaryRef emptyIoSurfaceProperty = CFDictionaryCreate(kCFAllocatorDefault,
                                                                NULL,
                                                                NULL,
                                                                0,
                                                                &kCFTypeDictionaryKeyCallBacks,
                                                                &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef attributes = CFDictionaryCreateMutable(kCFAllocatorDefault,
                                                                  1,
                                                                  &kCFTypeDictionaryKeyCallBacks,
                                                                  &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(attributes,
                         kCVPixelBufferIOSurfacePropertiesKey,
                         emptyIoSurfaceProperty);
    
    return CVPixelBufferCreate(kCFAllocatorDefault, width, height, pixelFormatType, attributes, pixelBufferOut);
}

CVReturn CVPixelBufferSomRotate90(CVPixelBufferRef pixelBuffer,
                                  uint8_t rotationConstant,
                                  CVPixelBufferRef *pixelBufferOut)
{
    if(!pixelBufferOut) {
        return kCVReturnInvalidArgument;
    }
    
    //  We will create the output pixel buffer locally and commit to the passed pixel buffer output
    //  only if everything succeeds.
    CVPixelBufferRef localPixelBufferOut = NULL;
    BOOL localPixelBufferBaseAddressLocked = NO;
    BOOL pixelBufferBaseAddressLocked = NO;
    
    //  We have to unlock the pixel buffer base address and release any allocated memory even in the face of exceptions.
    //  See @finally clause for details.
    @try {
        const CVReturn lockBaseAddressError1 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        if(lockBaseAddressError1) {
            return lockBaseAddressError1;
        }
        pixelBufferBaseAddressLocked = YES;
        
        //  Prepare the source buffer.
        void *sourceBuffer = CVPixelBufferGetBaseAddress(pixelBuffer);
        if(!sourceBuffer) {
            return kCVReturnInvalidPixelBufferAttributes;
        }
        size_t inputBytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
        size_t inputWidth = CVPixelBufferGetWidth(pixelBuffer);
        size_t inputHeight = CVPixelBufferGetHeight(pixelBuffer);
        vImage_Buffer sourceBufferData = { sourceBuffer, inputHeight, inputWidth, inputBytesPerRow };

        //  When rotating for 0 (0) or 180 (2) degrees the width and height remain the same as the input buffer.
        //  When rotating for 90 or 270 degrees we have to invert the width and height.
        size_t outputWidth;
        size_t outputHeight;
        if(rotationConstant == 0
           || rotationConstant == 2) {
            outputWidth = inputWidth;
            outputHeight = inputHeight;
        } else {
            outputHeight = inputWidth;
            outputWidth = inputHeight;
        }

        //  Create the output pixel buffer.
        CVReturn createPixelBufferError = CVPixelBufferSomCreateSimple(outputWidth,
                                                                       outputHeight,
                                                                       CVPixelBufferGetPixelFormatType(pixelBuffer),
                                                                       &localPixelBufferOut);
        if(createPixelBufferError) {
            return createPixelBufferError;
        }
        
        //  Prepare the destination buffer.
        const CVReturn lockBaseAddressError2 = CVPixelBufferLockBaseAddress(localPixelBufferOut, 0);
        if(lockBaseAddressError2) {
            return lockBaseAddressError2;
        }
        localPixelBufferBaseAddressLocked = YES;
        void *destinationBuffer = CVPixelBufferGetBaseAddress(localPixelBufferOut);
        if(!destinationBuffer) {
            return kCVReturnAllocationFailed;
        }
        vImage_Buffer destinationBufferData = {
            destinationBuffer,
            outputHeight,
            outputWidth,
            CVPixelBufferGetBytesPerRow(localPixelBufferOut)
        };
        
        //  We use black background for all rotations.
        Pixel_8888 BLACK = { 0, 0, 0, 0 };
        
        //  Finally rotate the image.
        vImage_Error rotateError = vImageRotate90_ARGB8888(&sourceBufferData,
                                                           &destinationBufferData,
                                                           rotationConstant,
                                                           BLACK,
                                                           kvImageNoFlags);
        if(rotateError != kvImageNoError) {
            return kCVReturnError;
        }

        //  Since the rotation succeeded we will return the reference to our local pixel
        //  buffer in the output reference. We retain it once as we will release it in
        //  @finally block.
        *pixelBufferOut = localPixelBufferOut;
        CFRetain(*pixelBufferOut);
        
        return kCVReturnSuccess;
    }
    @finally {
        //  Unlock the pixel buffer address if needed.
        if(pixelBufferBaseAddressLocked) {
            CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        }
        
        //  Unlock the output pixel buffer address and release it, if needed.
        if(localPixelBufferOut) {
            if(localPixelBufferBaseAddressLocked) {
                CVPixelBufferUnlockBaseAddress(localPixelBufferOut, 0);
            }
            
            CFRelease(localPixelBufferOut);
        }
    }
}
