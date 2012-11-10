//
//  LevelCompleteViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-10-25.
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
@synthesize WS_importCorrectGuessCount;
@synthesize WS_importTotalGuessCount;
@synthesize WS_starImageView;
@synthesize WS_letterGradeView;

//Nothing to go here yet, place holder for futrue versions

- (void)viewDidLoad
{
    [super viewDidLoad];
	switch ((int)([WS_importCorrectGuessCount floatValue]/([WS_importTotalGuessCount floatValue]+1)*110))
    {
        case 88 ... 1000:
            WS_letterGradeView.text = @"A";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5star" ofType:@"png"]];
            break;
        case 75 ... 87:
            WS_letterGradeView.text = @"B";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4star" ofType:@"png"]];
            break;
        case 63 ... 74:
            WS_letterGradeView.text = @"C";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3star" ofType:@"png"]];
            break;
        case 50 ... 62:
            WS_letterGradeView.text = @"D";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2star" ofType:@"png"]];
            break;
        case 26 ... 49:
            WS_letterGradeView.text = @"F";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1star" ofType:@"png"]];
            break;
        case -1000 ... 25:
            WS_letterGradeView.text = @"F";
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nostar" ofType:@"png"]];
            break;
            
        default:
            WS_starImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"null" ofType:@"png"]];
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
