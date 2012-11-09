//
//  ViewController.m
//  Word Scramble
//
//  Created by Chris Hobbs on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "ViewController.h"
#import "GameIO.h"

//following lines for importing JSON file
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 
#define LatestsynPhonywordsURL [NSURL URLWithString: @"http://synphony.herokuapp.com/api/simplified/simple_english/words?focus=b&known=b,a,t,r,s"]

@interface ViewController ()

@end

@implementation ViewController
//Label for the version number
@synthesize versionLabel;

bool isFirstLoad = YES;
NSMutableArray *firstWordName;
NSMutableArray *spellingpattern;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gets the current version and build of the app and displays on main menu
    versionLabel.text = [NSString stringWithFormat:@"Version %@ (Build %@)", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]];
    if (isFirstLoad)
    {
        
        //importing JSON file
        dispatch_async(kBgQueue, ^{ NSData* data = [NSData dataWithContentsOfURL:LatestsynPhonywordsURL];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        });
        
        
        //[GameIO getCurrentList:@"http://thehhd.com/CMPT385/accounts/" :@"test_user" :@"/wordlist.txt"];
        isFirstLoad = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchedData:(NSData *)responseData
{ //parse the JSON data
    firstWordName =[[NSMutableArray alloc]init];
    spellingpattern = [[NSMutableArray alloc]init];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions error:&error];
    
    NSArray* latestWordlist = [json objectForKey:@"words"];
    
    //NSLog(@"words: %@", latestWordlist);
    int i;
    for (i = 0; i<(latestWordlist.count); i++)
    {
    
        NSDictionary *wordname = [latestWordlist objectAtIndex:i];
        [firstWordName addObject:[wordname objectForKey:@"name"]];
        //NSLog(@"first words name: %@", firstWordName);
    
    }
    //NSLog(@"Names: %@", firstWordName);
    
    
    int j;
    for (j = 0; j<(latestWordlist.count); j++)
    {
        NSDictionary *wordname = [latestWordlist objectAtIndex:j];
        [spellingpattern addObject:[wordname objectForKey:@"spelling_patterns"]];
        //NSLog(@"spell patterns: %@", spellingpattern);
    }
    NSLog(@"spell patterns: %@", spellingpattern);

}

@end
