//
//  PauseMenuProtocol.h
//  Word Scramble
//
//  Created by Chris on 2012-10-25.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PauseMenuProtocol : NSObject

@end

@protocol PauseMenuProtocol <NSObject>

@optional
-(void) goToResume;
@end