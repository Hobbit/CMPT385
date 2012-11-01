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

#import "GameViewController.h"
#import "LevelCompleteViewController.h"


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

//UI Label to display their number of guesses
@synthesize WS_TotalGuessLabel;

//Array to store the words randomly selected for the current game from the current word list
NSArray *WS_currentGameList;

//Array to hold the UI objects so that we can access them iteratively
NSMutableArray *WS_scrambledWordLabelArray;
NSMutableArray *WS_plainWordLabelArray;
NSMutableArray *WS_checkmarkArray;

//Intergers to keep track of the number of guesses total and the number current correct guesses
int WS_correctGuessCount = 0;
int WS_totalGuessCount = 0;

//Initializes the arrays of UI objects and inserts the UI Objects
-(void)initUIArrays
{
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
        for (int i = 0; i < WS_currentGameList.count; i++)
        {
            //check the the input againt the word list for the current game
            if ([WS_TextEntry.text.uppercaseString isEqualToString:[[WS_currentGameList objectAtIndex:i] uppercaseString]])
            {
                //If the words match:
                //Check the plainword label from ????? to the correct word
                [[WS_plainWordLabelArray objectAtIndex:i] setText:[WS_currentGameList objectAtIndex:i]];
                //Display the green checkmark
                [[WS_checkmarkArray objectAtIndex:i] setHidden:NO];
                //Increase the correct guess counter
                WS_correctGuessCount++;
                if (WS_correctGuessCount >= 6)
                {
                    //if the number of correct guesses is equal to or greater than 6, go to level complete screen
                    [self performSegueWithIdentifier:@"levelComplete" sender:self];
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

//This function takes the a word and randomly scrambles it
- (NSMutableString *)WS_ScrambleWord:(NSString *)localCurrentWord
{
    NSMutableString *localRandomizedWord = [NSMutableString stringWithString:localCurrentWord];
    
    NSString *buffer;
    //performs randomizing on each letter in the word
    for (NSInteger i = localRandomizedWord.length - 1, j; i >= 0; i--)
    {
        j = arc4random() % (i + 1);
        
        buffer = [localRandomizedWord substringWithRange:NSMakeRange(i, 1)];
        [localRandomizedWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[localRandomizedWord substringWithRange:NSMakeRange(j, 1)]];
        [localRandomizedWord replaceCharactersInRange:NSMakeRange(j, 1) withString:buffer];
    }
    return localRandomizedWord;
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
- (NSMutableArray *)WS_GetWordList:(NSArray *)inputWordList
{
    //Array to tack the indexes that have already been selected to avoid duplicates
    NSMutableArray *indexSelected = [[NSMutableArray alloc] init];
    //Array to locally generate the list of words before exporting from the function
    NSMutableArray *localExportList = [[NSMutableArray alloc] init];
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
            [localExportList addObject:[inputWordList objectAtIndex:randIndex]];
            i++;
        }
    }
    //return generated list for the current game
    return localExportList;
}

//Generates the game by loading up the labels with words selected for the game by blanking them out then modifying the label which displays them
-(void)WS_generateGame:(NSArray *)inputWordList
{
    for (NSUInteger i = 0; i < [WS_currentGameList count]; i++)
    {
        [[WS_scrambledWordLabelArray objectAtIndex:i] setText:[self WS_ScrambleWord:[inputWordList objectAtIndex:i]]];
    }
}

//Runs when the view is loaded
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initializes the arrays
    [self initUIArrays];
    //zero's out score from previous games
    WS_correctGuessCount = 0;
    WS_totalGuessCount = 0;
    //gets wordlist for the game
    WS_currentGameList = [self WS_GetWordList:[self WS_LoadWordlist]];
    //generates the game
    [self WS_generateGame:WS_currentGameList];
    //displays the keyboard
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
