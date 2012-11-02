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


- (IBAction)manualUpdate:(id)sender
{
    [GameIO getCurrentList:@"http://thehhd.com/CMPT385/accounts/" :@"test_user" :@"/wordlist.txt"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
