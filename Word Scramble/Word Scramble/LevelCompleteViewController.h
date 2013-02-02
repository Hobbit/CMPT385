//
//  LevelCompleteViewController.h
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

#import <UIKit/UIKit.h>

@interface LevelCompleteViewController : UIViewController


@property (strong,nonatomic)NSString *WS_importTotalGuessCount;
@property (strong,nonatomic)NSString *WS_importCorrectGuessCount;

@property (weak, nonatomic) IBOutlet UIImageView *WS_starImageView;
@property (weak, nonatomic) IBOutlet UILabel *WS_letterGradeView;
@property (weak, nonatomic) IBOutlet UILabel *WS_averageGrade;

@end
