//
//  GameSettingsViewController.m
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

#import "GameSettingsViewController.h"
#import "GameIO.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController
@synthesize WS_password;
@synthesize WS_username;
@synthesize WS_UpdateURLBox;
@synthesize WS_autoUpdateToggle;
NSUserDefaults *userPreferences;

//Actions for pressing the done button on the settings screen
- (IBAction)WS_doneButton:(id)sender
{
    //If the username value has changed, update the settings bundle
    if (![WS_username.text isEqualToString:[userPreferences stringForKey:@"username"]])
    {
        [userPreferences setObject:WS_username.text forKey:@"username"];
    }
    //If the password value has changed, update the settings bundle
    if (![WS_password.text isEqualToString:[userPreferences stringForKey:@"password"]])
    {
        [userPreferences setObject:WS_password.text forKey:@"password"];
    }
    [GameIO getCurrentJSONListFrom:[[NSUserDefaults standardUserDefaults] stringForKey:@"updateBaseURL"] forUser:[[[NSUserDefaults standardUserDefaults] stringForKey:@"username"] lowercaseString] remoteFilename:@"wordlist.json"];
    
    //Perform segue back to main menu
    [self performSegueWithIdentifier:@"WS_SettingsDone" sender:self];
}

//Handles the manual update button so users can force the app to pull the latest list
- (IBAction)manualUpdate:(id)sender
{
    [GameIO getCurrentJSONListFrom:[[NSUserDefaults standardUserDefaults] stringForKey:@"updateBaseURL"] forUser:[[[NSUserDefaults standardUserDefaults] stringForKey:@"username"] lowercaseString] remoteFilename:@"wordlist.json"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Populate the fields with exisitng data
    userPreferences = [NSUserDefaults standardUserDefaults];
    WS_username.text = [userPreferences stringForKey:@"username"];
    WS_password.text = [userPreferences stringForKey:@"password"];
    WS_UpdateURLBox.text = [userPreferences stringForKey:@"updateBaseURL"];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
