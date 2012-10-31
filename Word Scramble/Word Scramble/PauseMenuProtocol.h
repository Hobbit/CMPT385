//
//  PauseMenuProtocol.h
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <Foundation/Foundation.h>

@interface PauseMenuProtocol : NSObject

@end

//Adds protocol for the pause menu
@protocol PauseMenuProtocol <NSObject>

@optional
-(void) goToResume;
@end