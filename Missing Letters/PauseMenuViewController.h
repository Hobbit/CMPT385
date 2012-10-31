//
//  PauseMenuViewController.h
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@protocol PauseMenuProtocol;

@interface PauseMenuViewController : UIViewController

//Adds delegate to this view
@property (nonatomic, strong) id <PauseMenuProtocol> delegate;

@end
