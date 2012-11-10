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

@synthesize ML_importCorrectGuessCount;
@synthesize ML_importTotalGuessCount;
@synthesize ML_starImageView;
@synthesize ML_letterGradeView;



//Nothing to go here yet, place holder for future versions

- (void)viewDidLoad
{
    [super viewDidLoad];
    switch ((int)([ML_importCorrectGuessCount floatValue]/([ML_importTotalGuessCount floatValue]+1)*110))
    {
        case 88 ... 1000:
            ML_letterGradeView.text = @"A";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5star" ofType:@"png"]];
            break;
        case 75 ... 87:
            ML_letterGradeView.text = @"B";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4star" ofType:@"png"]];
            break;
        case 63 ... 74:
            ML_letterGradeView.text = @"C";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3star" ofType:@"png"]];
            break;
        case 50 ... 62:
            ML_letterGradeView.text = @"D";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2star" ofType:@"png"]];
            break;
        case 26 ... 49:
            ML_letterGradeView.text = @"F";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1star" ofType:@"png"]];
            break;
        case -1000 ... 25:
            ML_letterGradeView.text = @"F";
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nostar" ofType:@"png"]];
            break;
            
        default:
            ML_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"null" ofType:@"png"]];
            break;
    }    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setML_starImageView:nil];
    [self setML_letterGradeView:nil];
    [super viewDidUnload];
}
@end
