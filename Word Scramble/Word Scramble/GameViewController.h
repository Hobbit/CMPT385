//
//  ViewController.h
//  Word Scramble
//
//  Created by Chris on 2012-09-08.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *WSScrambledWord;
@property (weak, nonatomic) IBOutlet UITextField *WSTextEntry;
@property (weak, nonatomic) IBOutlet UILabel *WSCorrectCount;
@property (weak, nonatomic) IBOutlet UILabel *WSIncorrectCount;
@property (weak, nonatomic) IBOutlet UILabel *WSResult;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (NSMutableString *)WSScrambleWord:(NSString *)localCurrentWord;
- (NSString *)WSGetWord:(NSArray *)localWordlist;
- (NSArray *)WSLoadWordlist;
- (void)WSResetBoard;


@end

