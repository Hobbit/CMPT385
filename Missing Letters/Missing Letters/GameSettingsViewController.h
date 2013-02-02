//
//  SettingsViewController.h
//  Missing Letters
//
//  Created by Team Red Panda on 2012-10-26.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import <UIKit/UIKit.h>

@interface GameSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ML_username;
@property (weak, nonatomic) IBOutlet UITextField *ML_password;
@property (weak, nonatomic) IBOutlet UITextField *ML_UpdateURLBox;
@property (weak, nonatomic) IBOutlet UISwitch *ML_autoUpdateToggle;


@end
