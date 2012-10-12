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

NSString *word;
NSArray *words;
int correctCount = 0;
int incorrectCount = 0;




- (IBAction)WSSubmit:(id)sender {
    
    if ([WSTextEntry.text isEqualToString: @""]){
        
    }
    else{
        if ([WSTextEntry.text.uppercaseString isEqualToString:word.uppercaseString]){
        }else{
        }
    }
}


- (NSMutableString *)WSScrambleWord:(NSString *)localCurrentWord {
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


- (NSArray *)WSLoadWordlist{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSArray *localWords = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return localWords;
}

- (NSString *)WSGetWord:(NSArray *)localWordlist{
    return [localWordlist objectAtIndex:(arc4random() %([localWordlist count]))];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [WSTextEntry becomeFirstResponder];
    words = [self WSLoadWordlist];
    word = [self WSGetWord:words];
	// Do any additional setup after loading the view, typically from a nib.
    WSTextEntry.clearsOnBeginEditing = YES;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
