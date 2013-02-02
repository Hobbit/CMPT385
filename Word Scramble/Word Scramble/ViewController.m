//
//  ViewController.m
//  Word Scramble
//
//  Created by Team Red Panda on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import "ViewController.h"
#import "GameIO.h"

@interface ViewController ()

@end

@implementation ViewController
//Label for the version number
@synthesize versionLabel;
BOOL isFirstLoad = YES;

//This method makes it so that you cannot play without a username and password
//An alert box will pop up prompting you to go to settings and enter your username and password
- (IBAction)WS_playButton:(id)sender
{
    //if username and password exist, then seque to game
    if ((![[[NSUserDefaults standardUserDefaults] stringForKey:@"username"]isEqualToString:@""]) && (![[[NSUserDefaults standardUserDefaults] stringForKey:@"password"]isEqualToString:@""])){
        [self performSegueWithIdentifier:@"WS_playGame" sender:self];
    }
    //otherwise display alert
    else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"You must input your username and password to get your wordlists! Please go to the settings screen to login." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gets the current version and build of the app and displays on main menu
    versionLabel.text = [NSString stringWithFormat:@"Version %@ (Build %@)", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]];
    //if username and password exist, continue with update procedure 
    if ((![[[NSUserDefaults standardUserDefaults] stringForKey:@"username"]isEqualToString:@""]) && (![[[NSUserDefaults standardUserDefaults] stringForKey:@"password"]isEqualToString:@""]))
    {
        //if this is the initial startup of the app, update the wordlist
        if (isFirstLoad)
        {
            [GameIO getCurrentJSONListFrom:[[NSUserDefaults standardUserDefaults] stringForKey:@"updateBaseURL"] forUser:[[[NSUserDefaults standardUserDefaults] stringForKey:@"username"] lowercaseString] remoteFilename:@"wordlist.json"];
            isFirstLoad = NO;
        }
    }
    //otherwise display alert
    else
    {
        //If no username and password, prompt to go to settings to enter before playing
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"You must input your username and password to get your wordlists! Please go to the settings screen to login." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
