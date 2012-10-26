//
//  PauseMenuViewController.h
//  Word Scramble
//
//  Created by Chris on 2012-09-22.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@protocol PauseMenuProtocol;

@interface PauseMenuViewController : UIViewController

@property (nonatomic, strong) id <PauseMenuProtocol> delegate;

@end
