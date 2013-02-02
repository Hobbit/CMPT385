//
//  PauseMenuViewController.h
//  Word Scramble
//
//  Created by Team Red Panda on 2012-09-22.
//  Copyright (c) 2012 Team Read Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Credit: http://www.sturdybird.com/blog/2012/03/21/how-to-add-a-simple-pause-menu-in-xcode-4-3-ios-5-1-using-a-modal-segue/

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@protocol PauseMenuProtocol;

@interface PauseMenuViewController : UIViewController

//Adds delegate to this view
@property (nonatomic, strong) id <PauseMenuProtocol> delegate;

@end
