//
//  GameViewController.h
//  Missing Letters
//
//  Created by Chris on 2012-10-14.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *WSTextEntry;

@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *MissingWordLabel6;

@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel1;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel2;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel3;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel4;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel5;
@property (weak, nonatomic) IBOutlet UILabel *PlainWordLabel6;

@property (weak, nonatomic) IBOutlet UILabel *TotalGuessLabel;


@end
