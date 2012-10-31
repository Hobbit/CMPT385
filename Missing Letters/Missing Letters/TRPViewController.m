//
//  TRPViewController.m
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "TRPViewController.h"

@interface TRPViewController ()

@end

@implementation TRPViewController

//This method will open up safari and direct the user to the repository for this game
- (IBAction)viewGitHub:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.github.com/Hobbit/CMPT385/tree/master/Missing%20Letters/"];
    
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
