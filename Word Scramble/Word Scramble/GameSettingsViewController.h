//
//  GameSettingsViewController.h
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-10-29.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <UIKit/UIKit.h>

@interface GameSettingsViewController : UIViewController

//Place Holer
@property (weak, nonatomic) IBOutlet UITextField *WS_username;
@property (weak, nonatomic) IBOutlet UITextField *WS_password;
@property (weak, nonatomic) IBOutlet UISwitch *autoUpdateToggle;

@end
