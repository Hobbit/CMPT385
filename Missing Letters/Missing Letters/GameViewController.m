//
//  GameViewController.m
//  Missing Letters
//
//  Created by Team Red Panda on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import "GameViewController.h"
#import "LevelCompleteViewController.h"
#import "GameIO.h"

@interface GameViewController ()

@end

@implementation GameViewController

//declares the following variables and synthesizes them from the UI so that we can modiy them witing the class
//Labels for the word missing the letter
@synthesize ML_MissingWordLabel1;
@synthesize ML_MissingWordLabel2;
@synthesize ML_MissingWordLabel3;
@synthesize ML_MissingWordLabel4;
@synthesize ML_MissingWordLabel5;
@synthesize ML_MissingWordLabel6;

//Labels for the word to display after guessed correctly
@synthesize ML_PlainWordLabel1;
@synthesize ML_PlainWordLabel2;
@synthesize ML_PlainWordLabel3;
@synthesize ML_PlainWordLabel4;
@synthesize ML_PlainWordLabel5;
@synthesize ML_PlainWordLabel6;

//Images objects for the green checkmarks
@synthesize ML_Checkmark1;
@synthesize ML_Checkmark2;
@synthesize ML_Checkmark3;
@synthesize ML_Checkmark4;
@synthesize ML_Checkmark5;
@synthesize ML_Checkmark6;

//Text box for user to input guesses
@synthesize ML_TextEntry;
@synthesize ML_keyboardViewEN;

//UI Label to display their number of guesses
@synthesize ML_TotalGuessLabel;

NSMutableArray *ML_wordsArray;
NSMutableArray *ML_spellingPatternArray;

//Array to store the words randomly selected for the current game from the current word list
NSMutableArray *ML_currentGameWordList;
NSMutableArray *ML_currentGameSpellingList;

//Array to hold the UI objects so that we can access them iteratively
NSMutableArray *ML_missingWordLabelArray;
NSMutableArray *ML_plainWordLabelArray;
NSMutableArray *ML_checkmarkArray;

//Intergers to keep track of the number of guesses total and the number current correct guesses
int ML_totalGuessCount = 0;
int ML_correctGuessCount = 0;

//Initializes the arrays of UI objects and inserts the UI Objects
- (void)initUIArrays
{
    ML_currentGameSpellingList = [[NSMutableArray alloc] init];
    ML_currentGameWordList = [[NSMutableArray alloc] init];
    ML_wordsArray = [[NSMutableArray alloc] init];
    ML_spellingPatternArray = [[NSMutableArray alloc] init];
    
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

//Open Pause Menu
//See PauseMenuProtcol or PauseMenuViewController for credits
- (IBAction)ML_PauseMenu:(id)sender
{
    //This is intentionally left empty
    //Action done by the delegate
    //To open the pause menu
}

//This method handles when a key on the keyboard is pressed
- (IBAction)ML_keyPressed:(UIButton *)sender
{
    //Get the value of the key
    NSString *keyValue = sender.currentTitle;
    //Append that to the string currently in the textbox
    ML_TextEntry.text = [ML_TextEntry.text stringByAppendingString:keyValue];
    
}

//This method handles the clearing of the input with the red x button
- (IBAction)ML_clearInput:(id)sender
{

    //Set textbox to empty
    //ML_TextEntry.text = [NSString stringWithFormat:@""];
    if([ML_TextEntry.text length] > 0){
        ML_TextEntry.text = [ML_TextEntry.text stringByReplacingCharactersInRange:NSMakeRange([ML_TextEntry.text length]-1, 1) withString:@""];
    }
}

//Action when user presses the green checkmark submit button
- (IBAction)ML_Submit:(id)sender
{
    //Checks if the input is empty
    if ([ML_TextEntry.text isEqualToString: @""])
    {
        //If input is empty, do nothing
    }
    else
    {
        //If the input is not empty
        for (int i = 0; i < ML_currentGameWordList.count; i++)
        {
            //check the the input againt the word list for the current game
            if ([ML_TextEntry.text.uppercaseString isEqualToString:[[ML_currentGameWordList objectAtIndex:i] uppercaseString]])
            {
                //If the words match:
                //Check the plainword label from ????? to the correct word
                [[ML_plainWordLabelArray objectAtIndex:i] setText:[ML_currentGameWordList objectAtIndex:i]];
                //Display the green checkmark
                [[ML_checkmarkArray objectAtIndex:i] setHidden:NO];
                //Increase the correct guess counter
                ML_correctGuessCount++;
                if (ML_correctGuessCount >= 6)
                {
                    //if the number of correct guesses is equal to or greater than 6, go to level complete screen
                    [self performSegueWithIdentifier:@"ML_levelComplete" sender:self];

                }
            }
        }
        //Increase Total guess counter
        ML_totalGuessCount++;
    }
    //Blank out the text box
    ML_TextEntry.text = @"";
    //Update the total guess counter label
    ML_TotalGuessLabel.text = [NSString stringWithFormat:@"%d",ML_totalGuessCount];
}

//This method attaches the total guess and corrent guess values to the segue so they can
//be used in the level complete view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ML_levelComplete"]) {
        LevelCompleteViewController *destViewController = segue.destinationViewController;
        destViewController.ML_importTotalGuessCount = [NSString stringWithFormat:@"%d",ML_totalGuessCount];
        destViewController.ML_importCorrectGuessCount = [NSString stringWithFormat:@"%d",ML_correctGuessCount];

    }
}

//This function takes the a word and randomly blanks out one of the letters
- (NSString *)ML_BlankOutWord:(NSMutableArray *)inputCurrentSpelling withNumberOfBlanks:(int)blanks
{
    NSMutableArray *localCurrentSpelling = [inputCurrentSpelling mutableCopy];
    //NSMutableString *localBlankedWord = [NSMutableString stringWithString:localCurrentWord];
    //Replaces a random char with an underscore to act as a "blank"
    [localCurrentSpelling replaceObjectAtIndex:(random()%[inputCurrentSpelling count]) withObject:@"_"];
    //[localBlankedWord replaceCharactersInRange:NSMakeRange((random()%[localBlankedWord length]), 1) withString:@"_"];
    return [localCurrentSpelling componentsJoinedByString:@""];
}

//Loads the data that will be used in the game
- (void) ML_loadGameData
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    [GameIO gameDataFromJSON:filepath outputWordsTo:ML_wordsArray outputSpellingsTo:ML_spellingPatternArray];
}

//Takes the array that contains the words from the word list file and choses 6 and creates a wordlist for the specific game instance
- (void)ML_buildCurrentGameDataFrom:(NSMutableArray *)inputWordList :(NSMutableArray *)inputSpellingList to:(NSMutableArray *)outputCurrentWords :(NSMutableArray *)outputCurrentSpellings
{
    //Array to tack the indexes that have already been selected to avoid duplicates
    NSMutableArray *indexSelected = [[NSMutableArray alloc] init];
    int i = 0;
    
    while (i < 6)
    {
        //choose random index value
        int randIndex = arc4random() %([inputWordList count]);
        bool duplicate = NO;
        
        //runs through the list of currently selected indexes and compairs to the current index and if there is a match the boolean "duplicate" is set to YES and that index is not used and a new random index is selected
        for (int n = 0; n < [indexSelected count]; n++) {
            if ([[indexSelected objectAtIndex:n] intValue ]== randIndex)
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
- (void)ML_generateGame:(NSMutableArray *)inputWordList
{
    for (NSUInteger i = 0; i < [ML_currentGameWordList count]; i++)
    {
        NSString *localWord = [self ML_BlankOutWord:[inputWordList objectAtIndex:i] withNumberOfBlanks:1];
        [[ML_missingWordLabelArray objectAtIndex:i] setText:localWord];
    }
}

//Runs when the view is loaded
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initializes the arrays
	[self initUIArrays];
    [self ML_loadGameData];
    //zero's out score from previous games
    ML_correctGuessCount = 0;
    ML_totalGuessCount = 0;
    //gets wordlist for the game
    [self ML_buildCurrentGameDataFrom:ML_wordsArray :ML_spellingPatternArray to:ML_currentGameWordList :ML_currentGameSpellingList];
    //generates the game
    [self ML_generateGame:ML_currentGameSpellingList];
    //displays the keyboard

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setML_TextEntry:nil];
    [super viewDidUnload];
}
@end
