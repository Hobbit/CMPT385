//
//  GameViewController.h
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ML_TextEntry;

@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel6;

@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel6;

@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark1;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark2;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark3;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark4;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark5;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark6;


@property (weak, nonatomic) IBOutlet UILabel *ML_TotalGuessLabel;


@end
