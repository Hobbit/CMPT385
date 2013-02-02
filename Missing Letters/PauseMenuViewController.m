//
//  PauseMenuViewController.m
//  Missing Letters
//
//  Created by Team Red Panda on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Credit: http://www.sturdybird.com/blog/2012/03/21/how-to-add-a-simple-pause-menu-in-xcode-4-3-ios-5-1-using-a-modal-segue/

#import "PauseMenuViewController.h"
#import "PauseMenuProtocol.h"

@interface PauseMenuViewController ()

@end

@implementation PauseMenuViewController


//Handles dismissing the pause menu
- (IBAction)returnToGame:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate goToResume];
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
