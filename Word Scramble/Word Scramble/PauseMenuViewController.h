//
//  PauseMenuViewController.h
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Read Panda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@protocol PauseMenuProtocol;

@interface PauseMenuViewController : UIViewController

@property (nonatomic, strong) id <PauseMenuProtocol> delegate;

@end
