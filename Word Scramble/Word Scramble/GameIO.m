//
//  GameIO.m
//  Word Scramble
//
//  Created by Team Red Panda on 2012-10-06.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//
//  Developed using iOS Documantation:
//  http://developer.apple.com/library/ios/navigation/

#import "GameIO.h"

@implementation GameIO

//This method pulls a wordlist in text file format from a specified user
+ (void) getCurrentTextListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename
{
    //Assign the filepath to write data into
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    //Create the url to the file to be downloaded
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", baseURL, username, filename]];
    //Grab the data from that url
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    //Write that data to a file
    [urlData writeToFile:filePath atomically:YES];
}

//This method pulls a wordlist in json format for a specified user
+ (void) getCurrentJSONListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename
{
    //Assign the filepath to write data into
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    //Create the url to the file to be downloaded
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", baseURL, username, filename]];
    //Grab the data from that url
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    //Write that data to a file
    [urlData writeToFile:filePath atomically:YES];
}

// This method will take a wordlist in json format and parse it to the words an spellings output arrays
// Based on code from deanWombourne
// http://stackoverflow.com/questions/3165290/how-to-parsing-json-object-in-iphone-sdk-xcode-using-json-framework
+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray
{
    NSError *error;
    //Load up data from the json file
    NSData* JSONData = [NSData dataWithContentsOfFile:filePath];
    //Build a dictionary with that data
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    //Split up each word object into an array
    NSArray* latestWordlist = [JSONDictionary objectForKey:@"words"];
    
    //for each item in the array of word objects
    for (int i = 0; i < latestWordlist.count; i++)
    {
        //create a new dictionary
        NSDictionary *wordDictionary = [latestWordlist objectAtIndex:i];
        //Get the "name" key from the dictionary which is a string and add to output array
        [outputWordsArray addObject:[wordDictionary objectForKey:@"name"]];
        //Get the "spelling_patterns" key from the dictionary which is an array and add too output array
        [outputSpellingsArray addObject:[wordDictionary objectForKey:@"spelling_patterns"]];
    }
}

//This method will access the user statistics history file and get the value located in the DocumentDirectory
//The user stats are saved here to prevent resetting the history on new builds or when user updates the app
//Used ideas from the user "Stack"
//http://stackoverflow.com/questions/5619719/write-a-file-on-ios
+ (int)getUserAverageScoreForUser:(NSString *)username
{
    //Get path to the documents directory
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Add the file name to make the full file path. The user score file is named with the username
    //prefixed with "MLUser_" so avoid stats being accessed by other apps using similar scheme
    NSString *filePath = [NSString stringWithFormat:@"%@/WSUser_%@.txt",documentsDirectory,username];
    //Read the user score from the file
    NSString *userScore = [[NSString alloc] initWithContentsOfFile:filePath usedEncoding:nil error:nil];
    //If the value returned is nil, then this must be the first time the user has played so user history
    //does not exist
    if(userScore == nil)
    {
        //create new user history file with value of -1 to show this is new file
        [self setUserAverageScore:-1 forUser:username];
        return -1;
    }
    
    return [userScore intValue];
}

//This method writes the user stats history to the file
//Used ideas from the user "Stack"
//http://stackoverflow.com/questions/5619719/write-a-file-on-ios
+ (void) setUserAverageScore:(int)score forUser:(NSString *)username
{
    //Get path to the documents directory
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Add the file name to make the full file path. The user score file is named with the username
    //prefixed with "MLUser_" so avoid stats being accessed by other apps using similar scheme
    NSString *filePath = [NSString stringWithFormat:@"%@/WSUser_%@.txt",documentsDirectory,username];
    //Create data to write
    NSString *userScore = [NSString stringWithFormat:@"%i",score];
    //save the user stats file
    [userScore writeToFile:filePath atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
}

//This method updates the user stats history using the score of the latest game
+ (void)updateUserAverageScore:(int)score forUser:(NSString *)username
{
    int localScore = 0;
    //Get user stats
    localScore = [self getUserAverageScoreForUser:username];
    //If is greater than -1, then must be existing user
    if(localScore > -1)
    {
        //Calculate new average
        localScore = (localScore + score) / 2;
    }
    else
    {
        //If is first game then the average score is equal to the score of the first game
        localScore = score;
    }
    //Save updated Score
    [self setUserAverageScore:localScore forUser:username];
}
@end