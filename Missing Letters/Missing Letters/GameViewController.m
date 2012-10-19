//
//  GameViewController.m
//  Missing Letters
//
//  Created by Chris on 2012-10-14.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

@synthesize MissingWordLabel1;
@synthesize MissingWordLabel2;
@synthesize MissingWordLabel3;
@synthesize MissingWordLabel4;
@synthesize MissingWordLabel5;
@synthesize MissingWordLabel6;

@synthesize PlainWordLabel1;
@synthesize PlainWordLabel2;
@synthesize PlainWordLabel3;
@synthesize PlainWordLabel4;
@synthesize PlainWordLabel5;
@synthesize PlainWordLabel6;

@synthesize WSTextEntry;
@synthesize TotalGuessLabel;

NSArray *currentGameList;
NSMutableArray *missingWordLabelArray;
NSMutableArray *plainWordLabelArray;
int correct

-(void)initUIArrays {
    
}

- (IBAction)WSSubmit:(id)sender {
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMissingWordLabel1:nil];
    [self setMissingWordLabel2:nil];
    [self setMissingWordLabel3:nil];
    [self setMissingWordLabel4:nil];
    [self setMissingWordLabel5:nil];
    [self setMissingWordLabel6:nil];
    [self setPlainWordLabel1:nil];
    [self setPlainWordLabel2:nil];
    [self setPlainWordLabel3:nil];
    [self setPlainWordLabel4:nil];
    [self setPlainWordLabel5:nil];
    [self setPlainWordLabel6:nil];
    [self setWSTextEntry:nil];
    [self setTotalGuessLabel:nil];
    [super viewDidUnload];
}
@end
