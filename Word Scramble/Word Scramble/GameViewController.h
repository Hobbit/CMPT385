//
//  GameViewController.h
//  Word Scramble
//
//  Created by Team Red Panda on 2012-09-08.
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
@property (weak, nonatomic) IBOutlet UITextField *WS_TextEntry;
@property (strong, nonatomic) IBOutlet UIView *WS_keyboardViewEN;

//UI Labels for the scrambled words in the game
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel6;

//UI Labels for the completed word after the user got it correct
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel6;

//UI Image for the green checkmarks that appear when you get the word correct
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark1;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark2;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark3;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark4;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark5;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark6;

//UI Label that displays the number of guesses
@property (weak, nonatomic) IBOutlet UILabel *WS_TotalGuessLabel;

//Declare the methods
- (void)initUIArrays;
- (NSString *)WS_ScrambleWord:(NSMutableArray *)inputCurrentSpelling atComplexity:(int)complexityLevel;
- (void) WS_loadGameData;
- (void)WS_buildCurrentGameDataFrom:(NSMutableArray *)inputWordList :(NSMutableArray *)inputSpellingList to:(NSMutableArray *)outputCurrentWords :(NSMutableArray *)outputCurrentSpellings;
- (void)WS_generateGame:(NSMutableArray *)inputWordList ;

- (IBAction)WS_keyPressed:(UIButton *)sender;
- (IBAction)WS_clearInput:(id)sender;


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end

