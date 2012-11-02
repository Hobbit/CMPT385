//
//  ViewController.m
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "ViewController.h"
#import "GameIO.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize versionLabel;
bool isFirstLoad = YES;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Gets the current version and build of the app and displays on main menu
    versionLabel.text = [NSString stringWithFormat:@"Version %@ (Build %@)", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]];
    if (isFirstLoad)
    {
        [GameIO getCurrentList:@"http://thehhd.com/CMPT385/accounts/" :@"test_user" :@"/wordlist.txt"];
        isFirstLoad = NO;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
