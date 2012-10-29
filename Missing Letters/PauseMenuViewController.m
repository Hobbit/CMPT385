//
//  PauseMenuViewController.m
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import "PauseMenuViewController.h"
#import "PauseMenuProtocol.h"

@interface PauseMenuViewController ()

@end

@implementation PauseMenuViewController


//Handles dismissing the pause menu
- (IBAction)returnToGame:(id)sender {
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
