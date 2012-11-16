//
//  ViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "ViewController.h"
#import "GameIO.h"

//following lines for importing JSON file
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 
#define LatestsynPhonywordsURL [NSURL URLWithString: @"http://synphony.herokuapp.com/api/simplified/simple_english/words?focus=b&known=b,a,t,r,s"]

@interface ViewController ()

@end

@implementation ViewController
//Label for the version number
@synthesize versionLabel;

bool isFirstLoad = YES;
NSMutableArray *firstWordName;
NSMutableArray *spellingPattern;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gets the current version and build of the app and displays on main menu
    versionLabel.text = [NSString stringWithFormat:@"Version %@ (Build %@)", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]];
    if (isFirstLoad)
    {
        [GameIO getCurrentJSONListFrom:@"http://thehhd.com/CMPT385/accounts/" forUser:@"test_user" remoteFilename:@"wordlist.json"];
        isFirstLoad = NO;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
