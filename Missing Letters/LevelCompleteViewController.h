//
//  LevelCompleteViewController.h
//  Missing Letters
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

//Place Holder
@property (strong,nonatomic)NSString *ML_importTotalGuessCount;
@property (strong,nonatomic)NSString *ML_importCorrectGuessCount;

@property (weak, nonatomic) IBOutlet UIImageView *ML_starImageView;
@property (weak, nonatomic) IBOutlet UILabel *ML_letterGradeView;

@property (weak, nonatomic) IBOutlet UILabel *ML_averageGrade;
- (NSString *)calculateLetterGrade:(int)score;
- (UIImage *)calculateStars:(int)score;

@end
