//
//  LevelCompleteViewController.h
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-25.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <UIKit/UIKit.h>

@interface LevelCompleteViewController : UIViewController

//Place Holder
@property (strong,nonatomic)NSString *ML_importTotalGuessCount;
@property (strong,nonatomic)NSString *ML_importCorrectGuessCount;

@property (weak, nonatomic) IBOutlet UIImageView *ML_starImageView;
@property (weak, nonatomic) IBOutlet UILabel *ML_letterGradeView;


@end
