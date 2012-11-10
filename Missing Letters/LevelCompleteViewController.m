//
//  LevelCompleteViewController.m
//  Missing Letters
//
//  Created by Chris on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "LevelCompleteViewController.h"
#import "GameViewController.h"

@interface LevelCompleteViewController ()

@end

@implementation LevelCompleteViewController

@synthesize ML_levelCompleteGradeLabel;
//ML_totalGuessCount;


//Nothing to go here yet, place holder for future versions

- (void)viewDidLoad
{
    [super viewDidLoad];
    ML_levelCompleteGradeLabel.text;
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setML_levelCompleteGradeLabel:nil];
    [super viewDidUnload];
}
@end
