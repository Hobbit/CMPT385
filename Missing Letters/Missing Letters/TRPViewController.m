//
//  TRPViewController.m
//  Missing Letters
//
//  Created by Team Red Panda on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import "TRPViewController.h"

@interface TRPViewController ()

@end

@implementation TRPViewController

//This method will open up safari and direct the user to the repository for this game
- (IBAction)ML_viewBitBucket:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"https://bitbucket.org/chrishobbs/cmpt385/src"];
    
    if (![[UIApplication sharedApplication] openURL:url])
        
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
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
