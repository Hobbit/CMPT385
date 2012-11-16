//
//  GameViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-08.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "GameIO.h"
#import "GameViewController.h"
#import "LevelCompleteViewController.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 

@interface GameViewController ()

@end

@implementation GameViewController
//declares the following variables and synthesizes them from the UI so that we can modiy them witing the class
//Labels for the scrambled word
@synthesize WS_ScrambledWordLabel1;
@synthesize WS_ScrambledWordLabel2;
@synthesize WS_ScrambledWordLabel3;
@synthesize WS_ScrambledWordLabel4;
@synthesize WS_ScrambledWordLabel5;
@synthesize WS_ScrambledWordLabel6;

//Labels for the word to display after guessed correctly
@synthesize WS_PlainWordLabel1;
@synthesize WS_PlainWordLabel2;
@synthesize WS_PlainWordLabel3;
@synthesize WS_PlainWordLabel4;
@synthesize WS_PlainWordLabel5;
@synthesize WS_PlainWordLabel6;

//Images for the green checkmarks
@synthesize WS_Checkmark1;
@synthesize WS_Checkmark2;
@synthesize WS_Checkmark3;
@synthesize WS_Checkmark4;
@synthesize WS_Checkmark5;
@synthesize WS_Checkmark6;

//Text box for user to input guesses
@synthesize WS_TextEntry;
@synthesize WS_keyboardViewEN;

//UI Label to display their number of guesses
@synthesize WS_TotalGuessLabel;

//Array to store the words randomly selected for the current game from the current word list
NSMutableArray *WS_currentGameWordList;
NSMutableArray *WS_currentGameSpellingList;


//Array to hold the UI objects so that we can access them iteratively
NSMutableArray *WS_scrambledWordLabelArray;
NSMutableArray *WS_plainWordLabelArray;
NSMutableArray *WS_checkmarkArray;
NSMutableArray *WS_wordsArray;
NSMutableArray *WS_spellingPatternArray;

//Intergers to keep track of the number of guesses total and the number current correct guesses
int WS_correctGuessCount = 0;
int WS_totalGuessCount = 0;

//Initializes the arrays of UI objects and inserts the UI Objects
-(void)initUIArrays
{
    WS_currentGameSpellingList = [[NSMutableArray alloc] init];
    WS_currentGameWordList = [[NSMutableArray alloc] init];
    WS_wordsArray = [[NSMutableArray alloc] init];
    WS_spellingPatternArray = [[NSMutableArray alloc] init];
    
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

//Open Pause Menu
- (IBAction)PauseMenu:(id)sender
{
    //This is intentionally left empty
    //Action done by the delegate
    //To open the pause menu
}

- (IBAction)WS_keyPressed:(UIButton *)sender
{
    NSString *character = sender.currentTitle;
    WS_TextEntry.text = [WS_TextEntry.text stringByAppendingString:character];
}

- (IBAction)WS_cancelInput:(id)sender
{
    WS_TextEntry.text = [NSString stringWithFormat:@""];
}




//Action when user presses the submit button
- (IBAction)WS_Submit:(id)sender
{
    //Checks if the input is empty
    if ([WS_TextEntry.text isEqualToString: @""]){
        //If input is empty, do nothing
    }
    else
    {
        //If the input is not empty
        for (int i = 0; i < WS_currentGameWordList.count; i++)
        {
            //check the the input againt the word list for the current game
            if ([WS_TextEntry.text.uppercaseString isEqualToString:[[WS_currentGameWordList objectAtIndex:i] uppercaseString]])
            {
                //If the words match:
                //Check the plainword label from ????? to the correct word
                [[WS_plainWordLabelArray objectAtIndex:i] setText:[WS_currentGameWordList objectAtIndex:i]];
                //Display the green checkmark
                [[WS_checkmarkArray objectAtIndex:i] setHidden:NO];
                //Increase the correct guess counter
                WS_correctGuessCount++;
                if (WS_correctGuessCount >= 6)
                {
                    //if the number of correct guesses is equal to or greater than 6, go to level complete screen
                    [self performSegueWithIdentifier:@"WS_levelComplete" sender:self];
                }
            }
        }
        //Increase Total guess counter
        WS_totalGuessCount++;
    }
    //Blank out the text box
    WS_TextEntry.text = @"";
    //Update the total guess counter label
    WS_TotalGuessLabel.text = [NSString stringWithFormat:@"%d",WS_totalGuessCount];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WS_levelComplete"]) {
        LevelCompleteViewController *destViewController = segue.destinationViewController;
        destViewController.WS_importTotalGuessCount = [NSString stringWithFormat:@"%d",WS_totalGuessCount];
        destViewController.WS_importCorrectGuessCount = [NSString stringWithFormat:@"%d",WS_correctGuessCount];
        
    }
}

//This function takes the a word and randomly scrambles it
- (NSString *)WS_ScrambleWord:(NSMutableArray *)inputCurrentSpelling atComplexity:(int)complexityLevel
{
    NSMutableArray *localCurrentSpelling = [inputCurrentSpelling mutableCopy];
    NSMutableString *localRandomizedWord = [[NSMutableString alloc] init];
    int i = 0;
    //performs randomizing on each letter in the word
    if (localCurrentSpelling.count == 2)
    {
        [localCurrentSpelling exchangeObjectAtIndex:0 withObjectAtIndex:1];
    }
    else
    {
        while(i < complexityLevel)
        {
            int randIndex1 = arc4random() % (localCurrentSpelling.count - 1);
            int randIndex2 = arc4random() % (localCurrentSpelling.count - 1);
            if (randIndex1 != randIndex2)
            {
                [localCurrentSpelling exchangeObjectAtIndex:randIndex1 withObjectAtIndex:randIndex2];
                i++;
            }
        }
    }
    for (int i = 0; i < localCurrentSpelling.count; i++) {
        [localRandomizedWord stringByAppendingString:[NSString stringWithFormat:@"%@",[localCurrentSpelling objectAtIndex:i]]];
        
    }
    return [[localCurrentSpelling valueForKey:@"description"] componentsJoinedByString:@""];
}

- (void) WS_loadGameData
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    [GameIO gameDataFromJSON:filepath outputWordsTo:WS_wordsArray outputSpellingsTo:WS_spellingPatternArray];
}
//Grabs the word list from the device memory and reads it into an array
- (NSArray *)WS_LoadWordlist
{    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSArray *localWords = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return localWords;
}
 

//Takes the array that contains the words from the word list file and choses 6 and creates a wordlist for the specific game instance
- (void)WS_buildCurrentGameDataFrom:(NSMutableArray *)inputWordList :(NSMutableArray *)inputSpellingList to:(NSMutableArray *)outputCurrentWords :(NSMutableArray *)outputCurrentSpellings
{
    //Array to tack the indexes that have already been selected to avoid duplicates
    NSMutableArray *indexSelected = [[NSMutableArray alloc] init];
    //Array to locally generate the list of words before exporting from the function
    //NSMutableArray *localExportList = [[NSMutableArray alloc] init];
    int i = 0;
    
    while (i < 6)
    {
        //choose random index value
        int randIndex = arc4random() %([inputWordList count]);
        bool duplicate = NO;
        
        //runs through the list of currently selected indexes and compairs to the current index and if there is a match the boolean "duplicate" is set to YES and that index is not used and a new random index is selected
        for (int n = 0; n < [indexSelected count]; n++)
        {
            if ([[indexSelected objectAtIndex:n] intValue]== randIndex)
            {
                duplicate = YES;
            }
        }
        
        //If the current is not a duplicate
        if (duplicate == NO)
        {
            //add the current index to the selected index list
            [indexSelected addObject: [NSNumber numberWithInt:randIndex]];
            //add the word at the current index to the local word list to be exported
            [outputCurrentWords addObject:[inputWordList objectAtIndex:randIndex]];
            [outputCurrentSpellings addObject:[inputSpellingList objectAtIndex:randIndex]];
            
            i++;
        }
    }
}

//Generates the game by loading up the labels with words selected for the game by blanking them out then modifying the label which displays them
-(void)WS_generateGame:(NSMutableArray *)inputWordList
{
    for (NSUInteger i = 0; i < [WS_currentGameSpellingList count]; i++)
    {
        NSString *localWord = [self WS_ScrambleWord:[inputWordList objectAtIndex:i] atComplexity:5];
        [[WS_scrambledWordLabelArray objectAtIndex:i] setText: localWord];
    }
}

//Runs when the view is loaded
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initializes the arrays
    [self initUIArrays];
    [self WS_loadGameData];
    //zero's out score from previous games
    WS_correctGuessCount = 0;
    WS_totalGuessCount = 0;
    //gets wordlist for the game
    [self WS_buildCurrentGameDataFrom:WS_wordsArray :WS_spellingPatternArray to:WS_currentGameWordList :WS_currentGameSpellingList];
    //generates the game
   [self WS_generateGame:WS_currentGameSpellingList];

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
