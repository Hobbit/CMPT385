//
//  LevelCompleteViewController.m
//  Word Scramble
//
//  Created by Team Red Panda on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import "LevelCompleteViewController.h"
#import "GameViewController.h"
#import "GameIO.h"

@interface LevelCompleteViewController ()

@end

@implementation LevelCompleteViewController
@synthesize WS_importCorrectGuessCount;
@synthesize WS_importTotalGuessCount;
@synthesize WS_starImageView;
@synthesize WS_letterGradeView;
@synthesize WS_averageGrade;

//This method will take the final grade (percentage) and return the appropriate letter grade
- (NSString *)calculateLetterGrade:(int)score
{
    NSString *letterGrade;
    switch (score)
    {
        case 88 ... 1000:
            letterGrade = @"A";
            break;
        case 75 ... 87:
            letterGrade = @"B";
            break;
        case 63 ... 74:
            letterGrade = @"C";
            break;
        case 50 ... 62:
            letterGrade = @"D";
            break;
        case -1000 ... 49:
            letterGrade = @"F";
            break;
        default:
            letterGrade = @"";
            break;
    }
    return letterGrade;
}

//This method will take the fianl grade (percentage) and return the appropriate number of stars
- (UIImage *)calculateStars:(int)score
{
    UIImage *stars;
    switch (score)
    {
        case 88 ... 1000:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5star" ofType:@"png"]];
            break;
        case 75 ... 87:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4star" ofType:@"png"]];
            break;
        case 63 ... 74:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3star" ofType:@"png"]];
            break;
        case 50 ... 62:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2star" ofType:@"png"]];
            break;
        case 26 ... 49:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1star" ofType:@"png"]];
            break;
        case -1000 ... 25:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nostar" ofType:@"png"]];
            break;
        default:
            stars = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"null" ofType:@"png"]];
            break;
    }
    return stars;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Calculate end score percentage
    int ML_endScore = (int)([WS_importCorrectGuessCount floatValue]/([WS_importTotalGuessCount floatValue]+1)*100);
    //Update the user's statistics history
    [GameIO updateUserAverageScore:ML_endScore forUser:[[NSUserDefaults standardUserDefaults]stringForKey:@"username"]];
    
    //Display letter grade for this level
    WS_letterGradeView.text = [self calculateLetterGrade:ML_endScore];
    //Display star rating for this level
    WS_starImageView.image = [self calculateStars:ML_endScore];
    //Display user's average grade for all levels
    WS_averageGrade.text = [self calculateLetterGrade:[GameIO getUserAverageScoreForUser:[[NSUserDefaults standardUserDefaults] stringForKey:@"username"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
