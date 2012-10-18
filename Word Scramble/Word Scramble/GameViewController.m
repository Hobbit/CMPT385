//
//  ViewController.m
//  Word Scramble
//
//  Created by Chris on 2012-09-08.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize WSTextEntry;

@synthesize ScrambledWordLabel1;
@synthesize ScrambledWordLabel2;
@synthesize ScrambledWordLabel3;
@synthesize ScrambledWordLabel4;
@synthesize ScrambledWordLabel5;
@synthesize ScrambledWordLabel6;

@synthesize PlainWordLabel1;
@synthesize PlainWordLabel2;
@synthesize PlainWordLabel3;
@synthesize PlainWordLabel4;
@synthesize PlainWordLabel5;
@synthesize PlainWordLabel6;

@synthesize TotalGuessLabel;

NSString *word;
NSArray *currentGameList;
NSArray *masterWordLits;
NSMutableArray *scrambledWordLabelArray;
NSMutableArray *plainWordLabelArray;
int correctGuessCount = 0;
int totalGuessCount = 0;


-(void)initUIArrays {
    scrambledWordLabelArray = [[NSMutableArray alloc] init];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel1 atIndex:0];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel2 atIndex:1];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel3 atIndex:2];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel4 atIndex:3];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel5 atIndex:4];
    [scrambledWordLabelArray insertObject:ScrambledWordLabel6 atIndex:5];
    
    plainWordLabelArray = [[NSMutableArray alloc] init];
    [plainWordLabelArray insertObject:PlainWordLabel1 atIndex:0];
    [plainWordLabelArray insertObject:PlainWordLabel2 atIndex:1];
    [plainWordLabelArray insertObject:PlainWordLabel3 atIndex:2];
    [plainWordLabelArray insertObject:PlainWordLabel4 atIndex:3];
    [plainWordLabelArray insertObject:PlainWordLabel5 atIndex:4];
    [plainWordLabelArray insertObject:PlainWordLabel6 atIndex:5];
}


- (IBAction)WSSubmit:(id)sender {
    if ([WSTextEntry.text isEqualToString: @""]){
    }
    else{
        for (int i = 0; i < currentGameList.count; i++) {
            if ([WSTextEntry.text.uppercaseString isEqualToString:[[currentGameList objectAtIndex:i] uppercaseString]]){
                [[plainWordLabelArray objectAtIndex:i] setText:[currentGameList objectAtIndex:i]];
                correctGuessCount++;
            }
        }
        totalGuessCount++;
    }
    WSTextEntry.text = @"";
    TotalGuessLabel.text = [NSString stringWithFormat:@"%d",totalGuessCount];
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
    for (NSUInteger i = 0; i < [currentGameList count]; i++) {
        [[scrambledWordLabelArray objectAtIndex:i] setText:[self ScrambleWord:[inputWordList objectAtIndex:i]]];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initUIArrays];
    currentGameList = [self GetWordList:[self LoadWordlist]];
    [self generateGame:currentGameList];
    
    [WSTextEntry becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setWSTextEntry:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
