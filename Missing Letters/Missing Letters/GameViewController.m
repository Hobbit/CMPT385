//
//  GameViewController.m
//  Missing Letters
//
//  Created by Chris on 2012-10-14.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import "GameViewController.h"
#import "LevelCompleteViewController.h"

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

@synthesize Checkmark1;
@synthesize Checkmark2;
@synthesize Checkmark3;
@synthesize Checkmark4;
@synthesize Checkmark5;
@synthesize Checkmark6;

@synthesize WSTextEntry;
@synthesize TotalGuessLabel;

NSArray *currentGameList;
NSMutableArray *missingWordLabelArray;
NSMutableArray *plainWordLabelArray;
NSMutableArray *checkmarkArray;
int correct = 0;

-(void)initUIArrays {
    missingWordLabelArray = [[NSMutableArray alloc] init];
    [missingWordLabelArray insertObject:MissingWordLabel1 atIndex:0];
    [missingWordLabelArray insertObject:MissingWordLabel2 atIndex:1];
    [missingWordLabelArray insertObject:MissingWordLabel3 atIndex:2];
    [missingWordLabelArray insertObject:MissingWordLabel4 atIndex:3];
    [missingWordLabelArray insertObject:MissingWordLabel5 atIndex:4];
    [missingWordLabelArray insertObject:MissingWordLabel6 atIndex:5];
    
    plainWordLabelArray = [[NSMutableArray alloc] init];
    [plainWordLabelArray insertObject:PlainWordLabel1 atIndex:0];
    [plainWordLabelArray insertObject:PlainWordLabel2 atIndex:1];
    [plainWordLabelArray insertObject:PlainWordLabel3 atIndex:2];
    [plainWordLabelArray insertObject:PlainWordLabel4 atIndex:3];
    [plainWordLabelArray insertObject:PlainWordLabel5 atIndex:4];
    [plainWordLabelArray insertObject:PlainWordLabel6 atIndex:5];
    
    checkmarkArray = [[NSMutableArray alloc] init];
    [checkmarkArray insertObject:Checkmark1 atIndex:0];
    [checkmarkArray insertObject:Checkmark2 atIndex:1];
    [checkmarkArray insertObject:Checkmark3 atIndex:2];
    [checkmarkArray insertObject:Checkmark4 atIndex:3];
    [checkmarkArray insertObject:Checkmark5 atIndex:4];
    [checkmarkArray insertObject:Checkmark6 atIndex:5];
    
}


- (IBAction)PauseMenu:(id)sender {
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
    [self setWSTextEntry:nil];
    [self setCheckmark1:nil];
    [self setCheckmark2:nil];
    [self setCheckmark3:nil];
    [self setCheckmark4:nil];
    [self setCheckmark4:nil];
    [self setCheckmark6:nil];
    [super viewDidUnload];
}
@end
