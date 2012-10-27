//
//  ViewController.h
//  Word Scramble
//
//  Created by Chris on 2012-09-08.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@interface GameViewController : UIViewController <PauseMenuProtocol, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *WS_TextEntry;

@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *WS_ScrambledWordLabel6;

@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *WS_PlainWordLabel6;

@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark1;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark2;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark3;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark4;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark5;
@property (weak, nonatomic) IBOutlet UIImageView *WS_Checkmark6;


@property (weak, nonatomic) IBOutlet UILabel *WS_TotalGuessLabel;

- (NSMutableString *)ScrambleWord:(NSString *)localCurrentWord;
- (NSMutableArray *)GetWordList:(NSArray *)inputWordList;
- (NSArray *)LoadWordlist;
- (void)generateGame:(NSArray *)inputWordList ;


@end

