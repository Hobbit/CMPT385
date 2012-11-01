//
//  GameIO.h
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-10-06.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <Foundation/Foundation.h>

@interface GameIO : NSObject

+ (void) getCurrentList:(NSString *)base :(NSString *)user :(NSString *)file;

@end
