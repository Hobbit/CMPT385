//
//  PauseMenuProtocol.h
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PauseMenuProtocol : NSObject

@end

//Adds new protocol for the pause menu
@protocol PauseMenuProtocol <NSObject>

@optional
-(void) goToResume;
@end