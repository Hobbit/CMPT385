//
//  PauseMenuProtocol.h
//  Word Scramble
//
//  Created by Team Red Panda on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Credit: http://www.sturdybird.com/blog/2012/03/21/how-to-add-a-simple-pause-menu-in-xcode-4-3-ios-5-1-using-a-modal-segue/

#import <Foundation/Foundation.h>

@interface PauseMenuProtocol : NSObject

@end

//Adds protocol for the pause menu
@protocol PauseMenuProtocol <NSObject>

@optional
-(void) goToResume;

@end