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

@synthesize ML_MissingWordLabel1;
@synthesize ML_MissingWordLabel2;
@synthesize ML_MissingWordLabel3;
@synthesize ML_MissingWordLabel4;
@synthesize ML_MissingWordLabel5;
@synthesize ML_MissingWordLabel6;

@synthesize ML_PlainWordLabel1;
@synthesize ML_PlainWordLabel2;
@synthesize ML_PlainWordLabel3;
@synthesize ML_PlainWordLabel4;
@synthesize ML_PlainWordLabel5;
@synthesize ML_PlainWordLabel6;

@synthesize ML_Checkmark1;
@synthesize ML_Checkmark2;
@synthesize ML_Checkmark3;
@synthesize ML_Checkmark4;
@synthesize ML_Checkmark5;
@synthesize ML_Checkmark6;

@synthesize ML_TextEntry;
@synthesize ML_TotalGuessLabel;

NSArray *ML_currentGameList;
NSMutableArray *ML_missingWordLabelArray;
NSMutableArray *ML_plainWordLabelArray;
NSMutableArray *ML_checkmarkArray;
int ML_correctGuessCount = 0;
int ML_totalGuessCount = 0;

-(void)initUIArrays {
    ML_missingWordLabelArray = [[NSMutableArray alloc] init];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel1 atIndex:0];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel2 atIndex:1];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel3 atIndex:2];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel4 atIndex:3];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel5 atIndex:4];
    [ML_missingWordLabelArray insertObject:ML_MissingWordLabel6 atIndex:5];
    
    ML_plainWordLabelArray = [[NSMutableArray alloc] init];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel1 atIndex:0];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel2 atIndex:1];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel3 atIndex:2];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel4 atIndex:3];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel5 atIndex:4];
    [ML_plainWordLabelArray insertObject:ML_PlainWordLabel6 atIndex:5];
    
    ML_checkmarkArray = [[NSMutableArray alloc] init];
    [ML_checkmarkArray insertObject:ML_Checkmark1 atIndex:0];
    [ML_checkmarkArray insertObject:ML_Checkmark2 atIndex:1];
    [ML_checkmarkArray insertObject:ML_Checkmark3 atIndex:2];
    [ML_checkmarkArray insertObject:ML_Checkmark4 atIndex:3];
    [ML_checkmarkArray insertObject:ML_Checkmark5 atIndex:4];
    [ML_checkmarkArray insertObject:ML_Checkmark6 atIndex:5];
    
}


- (IBAction)ML_PauseMenu:(id)sender {
}

- (IBAction)ML_Submit:(id)sender {
    if ([ML_TextEntry.text isEqualToString: @""]){
    }
    else{
        for (int i = 0; i < ML_currentGameList.count; i++) {
            if ([ML_TextEntry.text.uppercaseString isEqualToString:[[ML_currentGameList objectAtIndex:i] uppercaseString]]){
                [[ML_plainWordLabelArray objectAtIndex:i] setText:[ML_currentGameList objectAtIndex:i]];
                [[ML_checkmarkArray objectAtIndex:i] setHidden:NO];
                ML_correctGuessCount++;
                if (ML_correctGuessCount >= 6) {
                    [self performSegueWithIdentifier:@"ML_levelComplete" sender:self];
                }
            }
        }
        ML_totalGuessCount++;
    }
    ML_TextEntry.text = @"";
    ML_TotalGuessLabel.text = [NSString stringWithFormat:@"%d",ML_totalGuessCount];
}



- (NSMutableString *)ML_BlankOutWord:(NSString *)localCurrentWord {
    NSMutableString *localBlankedWord = [NSMutableString stringWithString:localCurrentWord];
    
    [localBlankedWord replaceCharactersInRange:NSMakeRange((random()%[localBlankedWord length]), 1) withString:@"_"];
    return localBlankedWord;
}

- (NSArray *)ML_LoadWordlist{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSArray *localWords = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return localWords;
}

- (NSMutableArray *)ML_GetWordList:(NSArray *)inputWordList{
    NSMutableArray *indexSelected = [[NSMutableArray alloc] init];
    NSMutableArray *localExportList = [[NSMutableArray alloc] init];
    int i = 0;
    
    while (i < 6) {
        int randIndex = arc4random() %([inputWordList count]);
        bool duplicate = NO;
        
        for (int n = 0; n < [indexSelected count]; n++) {
            if ([[indexSelected objectAtIndex:n] intValue ]== randIndex) {
                duplicate = YES;
            }
        }
        
        if (duplicate == NO) {
            [indexSelected addObject: [NSNumber numberWithInt:randIndex]];
            [localExportList addObject:[inputWordList objectAtIndex:randIndex]];
            i++;
        }
    }
    return localExportList;
}


-(void)ML_generateGame:(NSArray *)ML_inputWordList {
    for (NSUInteger i = 0; i < [ML_currentGameList count]; i++) {
        [[ML_missingWordLabelArray objectAtIndex:i] setText:[self ML_BlankOutWord:[ML_inputWordList objectAtIndex:i]]];
    }
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
	[self initUIArrays];
    ML_correctGuessCount = 0;
    ML_totalGuessCount = 0;
    ML_currentGameList = [self ML_GetWordList:[self ML_LoadWordlist]];
    [self ML_generateGame:ML_currentGameList];
    
    [ML_TextEntry becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setML_TextEntry:nil];
    [super viewDidUnload];
}
@end
