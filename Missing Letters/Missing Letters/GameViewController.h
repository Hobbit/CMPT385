//
//  GameViewController.h
//  Missing Letters
//
//  Created by Team Red Panda on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@interface GameViewController : UIViewController <PauseMenuProtocol, UIAlertViewDelegate>


//Text entry for use to input their guess
@property (weak, nonatomic) IBOutlet UITextField *ML_TextEntry;
@property (strong, nonatomic) IBOutlet UIView *ML_keyboardViewEN;

//UI Labels for the words with the missing letters in the game
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *ML_MissingWordLabel6;

//UI Labels for the completed word after the user got it correct
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *ML_PlainWordLabel6;

//UI Image for the green checkmarks that appear when you get the word correct
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark1;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark2;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark3;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark4;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark5;
@property (weak, nonatomic) IBOutlet UIImageView *ML_Checkmark6;

//UI Label that displays the number of guesses
@property (weak, nonatomic) IBOutlet UILabel *ML_TotalGuessLabel;

//Declare the methods
- (void)initUIArrays;
- (NSString *)ML_BlankOutWord:(NSMutableArray *)inputCurrentSpelling withNumberOfBlanks:(int)blanks;
- (void) ML_loadGameData;
- (void)ML_buildCurrentGameDataFrom:(NSMutableArray *)inputWordList :(NSMutableArray *)inputSpellingList to:(NSMutableArray *)outputCurrentWords :(NSMutableArray *)outputCurrentSpellings;
- (void)ML_generateGame:(NSArray *)ML_inputWordList ;

- (IBAction)ML_keyPressed:(UIButton *)sender;
- (IBAction)ML_clearInput:(id)sender;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;



@end
