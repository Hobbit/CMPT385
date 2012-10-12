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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (NSMutableString *)WSScrambleWord:(NSString *)localCurrentWord;
- (NSString *)WSGetWord:(NSArray *)localWordlist;
- (NSArray *)WSLoadWordlist;



@end

