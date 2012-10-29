//
//  GameViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-08.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import "GameViewController.h"
#import "LevelCompleteViewController.h"


@interface GameViewController ()

@end

@implementation GameViewController

@synthesize WS_ScrambledWordLabel1;
@synthesize WS_ScrambledWordLabel2;
@synthesize WS_ScrambledWordLabel3;
@synthesize WS_ScrambledWordLabel4;
@synthesize WS_ScrambledWordLabel5;
@synthesize WS_ScrambledWordLabel6;

@synthesize WS_PlainWordLabel1;
@synthesize WS_PlainWordLabel2;
@synthesize WS_PlainWordLabel3;
@synthesize WS_PlainWordLabel4;
@synthesize WS_PlainWordLabel5;
@synthesize WS_PlainWordLabel6;

@synthesize WS_Checkmark1;
@synthesize WS_Checkmark2;
@synthesize WS_Checkmark3;
@synthesize WS_Checkmark4;
@synthesize WS_Checkmark5;
@synthesize WS_Checkmark6;

@synthesize WS_TextEntry;
@synthesize WS_TotalGuessLabel;

//NSString *word;
NSArray *WS_currentGameList;
NSMutableArray *WS_scrambledWordLabelArray;
NSMutableArray *WS_plainWordLabelArray;
NSMutableArray *WS_checkmarkArray;
int correctGuessCount = 0;
int totalGuessCount = 0;


-(void)initUIArrays {
    WS_scrambledWordLabelArray = [[NSMutableArray alloc] init];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel1 atIndex:0];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel2 atIndex:1];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel3 atIndex:2];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel4 atIndex:3];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel5 atIndex:4];
    [WS_scrambledWordLabelArray insertObject:WS_ScrambledWordLabel6 atIndex:5];
    
    WS_plainWordLabelArray = [[NSMutableArray alloc] init];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel1 atIndex:0];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel2 atIndex:1];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel3 atIndex:2];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel4 atIndex:3];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel5 atIndex:4];
    [WS_plainWordLabelArray insertObject:WS_PlainWordLabel6 atIndex:5];
    
    WS_checkmarkArray = [[NSMutableArray alloc] init];
    [WS_checkmarkArray insertObject:WS_Checkmark1 atIndex:0];
    [WS_checkmarkArray insertObject:WS_Checkmark2 atIndex:1];
    [WS_checkmarkArray insertObject:WS_Checkmark3 atIndex:2];
    [WS_checkmarkArray insertObject:WS_Checkmark4 atIndex:3];
    [WS_checkmarkArray insertObject:WS_Checkmark5 atIndex:4];
    [WS_checkmarkArray insertObject:WS_Checkmark6 atIndex:5];
}

- (IBAction)PauseMenu:(id)sender {
}

- (IBAction)WS_Submit:(id)sender {
    if ([WS_TextEntry.text isEqualToString: @""]){
    }
    else{
        for (int i = 0; i < WS_currentGameList.count; i++) {
            if ([WS_TextEntry.text.uppercaseString isEqualToString:[[WS_currentGameList objectAtIndex:i] uppercaseString]]){
                [[WS_plainWordLabelArray objectAtIndex:i] setText:[WS_currentGameList objectAtIndex:i]];
                [[WS_checkmarkArray objectAtIndex:i] setHidden:NO];
                correctGuessCount++;
                if (correctGuessCount >= 6) {
                    [self performSegueWithIdentifier:@"levelComplete" sender:self];
                }
            }
        }
        totalGuessCount++;
    }
    WS_TextEntry.text = @"";
    WS_TotalGuessLabel.text = [NSString stringWithFormat:@"%d",totalGuessCount];
}


- (NSMutableString *)ScrambleWord:(NSString *)localCurrentWord {
    NSMutableString *localRandomizedWord = [NSMutableString stringWithString:localCurrentWord];
    
    NSString *buffer;
    for (NSInteger i = localRandomizedWord.length - 1, j; i >= 0; i--)
    {
        j = arc4random() % (i + 1);
        
        buffer = [localRandomizedWord substringWithRange:NSMakeRange(i, 1)];
        [localRandomizedWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[localRandomizedWord substringWithRange:NSMakeRange(j, 1)]];
        [localRandomizedWord replaceCharactersInRange:NSMakeRange(j, 1) withString:buffer];
    }
    return localRandomizedWord;
}

- (NSArray *)LoadWordlist{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSArray *localWords = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return localWords;
}

- (NSMutableArray *)GetWordList:(NSArray *)inputWordList{
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

-(void)generateGame:(NSArray *)inputWordList {
    for (NSUInteger i = 0; i < [WS_currentGameList count]; i++) {
        [[WS_scrambledWordLabelArray objectAtIndex:i] setText:[self ScrambleWord:[inputWordList objectAtIndex:i]]];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initUIArrays];
    correctGuessCount = 0;
    WS_currentGameList = [self GetWordList:[self LoadWordlist]];
    [self generateGame:WS_currentGameList];
    
    [WS_TextEntry becomeFirstResponder];
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
