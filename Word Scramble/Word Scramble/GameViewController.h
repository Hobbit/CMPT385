//
//  ViewController.h
//  Word Scramble
//
//  Created by Chris on 2012-09-08.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *WSTextEntry;

@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *ScrambledWordLabel6;

@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel6;


- (NSMutableString *)WSScrambleWord:(NSString *)localCurrentWord;
- (NSString *)WSGetWord:(NSArray *)localWordlist;
- (NSArray *)WSLoadWordlist;



@end

