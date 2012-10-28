//
//  GameIO.m
//  Word Scramble
//
//  Created by Chris on 2012-10-06.
//  Copyright (c) 2012 HHD. All rights reserved.
//

#import "GameIO.h"

@implementation GameIO



    // Determile cache file path 
- (void)DownloadWordList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];

    // Download and write to file
    NSURL *url = [NSURL URLWithString:@"http://thehhd.com/CMPT385/accounts/test_user/wordlist.txt"];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:filePath atomically:YES];

}

@end
