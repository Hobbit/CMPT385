//
//  PauseMenuViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import "PauseMenuViewController.h"
#import "PauseMenuProtocol.h"

@interface PauseMenuViewController ()

@end

@implementation PauseMenuViewController



- (IBAction)returnToGame:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate goToResume];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
