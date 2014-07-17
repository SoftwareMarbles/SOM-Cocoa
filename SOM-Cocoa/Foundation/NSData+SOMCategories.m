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
//  NSData+SOMCategories.m
//  SOM-Cocoa
//
//  Created by Ivan Erceg on 11/29/13.
//

#import "NSData+SOMCategories.h"

static unichar numberToHexChar(unsigned char number) {
    return number < 10 ? '0' + number : 'a' + (number - 10);
}

@implementation NSData (SOMCategories)

- (NSString *)som_asHexadecimalString {
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    if (!dataBuffer) {
        return [NSString string];
    }
    
    const NSUInteger dataLength  = [self length];
    const NSUInteger HEX_CHARS_PER_BYTE = 2;
    const NSUInteger stringLength = HEX_CHARS_PER_BYTE * dataLength;
    unichar *hexCharBuffer = (unichar*)malloc(stringLength * sizeof(unichar));
    
    @try {
        for(NSUInteger i = 0; i < dataLength; ++i) {
            size_t stringIndex = HEX_CHARS_PER_BYTE * i;
            hexCharBuffer[stringIndex] = numberToHexChar(dataBuffer[i] / 16);
            hexCharBuffer[stringIndex + 1] = numberToHexChar(dataBuffer[i] % 16);
        }
        
        //  Create the string from the char buffer. The string object will become the owner of the buffer.
        NSString *hexString = [[NSString alloc] initWithCharactersNoCopy:hexCharBuffer
                                                                  length:stringLength
                                                            freeWhenDone:YES];
        //  The string will release the buffer - we must not release it in @finally.
        hexCharBuffer = NULL;
        
        return hexString;
    }
    @finally {
        //  Free the char buffer in case of an exception.
        free(hexCharBuffer);
    }
}

@end
