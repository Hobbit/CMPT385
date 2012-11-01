//
//  GameIO.m
//  Missing Letters
//
//  Created by Chris Hobbs on 2012-10-14.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import "GameIO.h"

@implementation GameIO

+ (void) getCurrentList:(NSString *)base :(NSString *)user :(NSString *)file
{
    //Set file path to write file to
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    // Download and write to file
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", base, user, file]];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:filePath atomically:YES];
    
}

@end
