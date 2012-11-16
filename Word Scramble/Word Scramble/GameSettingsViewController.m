//
//  GameSettingsViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-10-29.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "GameSettingsViewController.h"
#import "GameIO.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController
@synthesize WS_password;
@synthesize WS_username;

- (IBAction)WS_doneButton:(id)sender
{
    NSUserDefaults *userPreferences = [NSUserDefaults standardUserDefaults];
    if (![WS_username.text isEqualToString:[userPreferences stringForKey:@"username"]])
    {
        [userPreferences setObject:WS_username.text forKey:@"username"];
    }
    if (![WS_password.text isEqualToString:[userPreferences stringForKey:@"password"]])
    {
        [userPreferences setObject:WS_password.text forKey:@"password"];
    }

    [self performSegueWithIdentifier:@"WS_SettingsDone" sender:self];
}

- (IBAction)manualUpdate:(id)sender
{
    
    [GameIO getCurrentTextListFrom:@"http://thehhd.com/CMPT385/accounts/" forUser:@"test_user" remoteFilename:@"/wordlist.txt"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    WS_username.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    WS_password.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
