//
//  GameSettingsViewController.h
//  Word Scramble
//
//  Created by Team Red Panda on 2012-10-29.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import <UIKit/UIKit.h>

@interface GameSettingsViewController : UIViewController

//Place Holer
@property (weak, nonatomic) IBOutlet UITextField *WS_username;
@property (weak, nonatomic) IBOutlet UITextField *WS_password;
@property (weak, nonatomic) IBOutlet UISwitch *WS_autoUpdateToggle;
@property (weak, nonatomic) IBOutlet UITextField *WS_UpdateURLBox;

@end
