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
//  CVPixelBufferSomUtilities.h
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 12/29/13.
//

#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>

//  The naming schema for all SOM's CVPixelBuffer utility functions follows the already existing
//  naming schema of CVPixelBuffer prefix. It adds "Som" continuation to avoid clashes with other
//  utilities or future extensions to CoreVideo.

/*!
 @function   CVPixelBufferSomCreateSimple
 @abstract   Call to create a single PixelBuffer for a given size and pixelFormatType.
 @discussion Creates a single PixelBuffer for a given size and pixelFormatType. It allocates the necessary memory based on the pixel dimensions and pixelFormatType. The created buffer has an empty IOSurface attribute.
 @param      width   Width of the PixelBuffer in pixels.
 @param      height  Height of the PixelBuffer in pixels.
 @param	pixelFormatType		Pixel format indentified by its respective OSType.
 @param      pixelBufferOut          The new pixel buffer will be returned here
 @result	returns kCVReturnSuccess on success.
 */
CVReturn CVPixelBufferSomCreateSimple(size_t width,
                                      size_t height,
                                      OSType pixelFormatType,
                                      CVPixelBufferRef *pixelBufferOut);

/*!
 @function   CVPixelBufferSomRotate90
 @abstract   Call to rotate the given PixelBuffer into a new pixel buffer using vImageRotate90_* family of functions.
 @discussion Creates a single PixelBuffer with rotated contents of the given PixelBuffer. It allocates the necessary memory based on the pixel dimensions, pixelFormatType and rotation factor. The created buffer has an empty IOSurface attribute.
 @param      pixelBuffer Target PixelBuffer.
 @param      rotationConstant   Rotation constants corresponding to vImageRotate90 family of functions (0 - rotate 0 degrees (copy content), 1 - rotate 90 degrees, 2 - rotate 180 degrees, 3 - rotate 270 degrees)
 @param      pixelBufferOut          The new pixel buffer will be returned here
 @result	returns kCVReturnSuccess on success.
 */
CVReturn CVPixelBufferSomRotate90(CVPixelBufferRef pixelBuffer,
                                  uint8_t rotationConstant,
                                  CVPixelBufferRef *pixelBufferOut);
