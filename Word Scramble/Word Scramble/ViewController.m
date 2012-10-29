//
//  ViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
//Label for the version number
@synthesize versionLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Gets the current version and build of the app and displays on main menu
    versionLabel.text = [NSString stringWithFormat:@"Version %@ (Build %@)", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]];
    //Set file path to write file to
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    // Download and write to file
    NSURL *url = [NSURL URLWithString:@"http://thehhd.com/CMPT385/accounts/test_user/wordlist.txt"];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:filePath atomically:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
