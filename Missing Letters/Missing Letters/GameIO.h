//
//  GameIO.h
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

#import <Foundation/Foundation.h>

@interface GameIO : NSObject

+ (void) getCurrentTextListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename;
+ (void) getCurrentJSONListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename;
+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray;
+ (int) getUserAverageScoreForUser:(NSString *)username;
+ (void)updateUserAverageScore:(int)score forUser:(NSString *)username;
+ (void) setUserAverageScore:(int)score forUser:(NSString *)username;

@end
