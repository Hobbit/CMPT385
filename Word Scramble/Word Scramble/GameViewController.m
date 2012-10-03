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
@synthesize WSScrambledWord;
@synthesize WSTextEntry;
@synthesize WSCorrectCount;
@synthesize WSIncorrectCount;
@synthesize WSResult;

NSString *word;
NSArray *words;
int correctCount = 0;
int incorrectCount = 0;




- (IBAction)WSSubmit:(id)sender {
    [WSTextEntry resignFirstResponder];
    
    if ([WSTextEntry.text isEqualToString: @""]){
        
    }
    else{
        if ([WSTextEntry.text.uppercaseString isEqualToString:word.uppercaseString]){
            WSResult.text = @"CORRECT!";
            correctCount++;
            NSString *CorValue = [[NSString alloc]initWithFormat:@"%d",correctCount];
            WSCorrectCount.text = CorValue;
            [self WSResetBoard];
        }
        else{
            WSResult.text = @"Sorry, Please Try Again";
            incorrectCount++;
            NSString *InCorValue = [[NSString alloc]initWithFormat:@"%d",incorrectCount];
            WSIncorrectCount.text = InCorValue;
        }
    }
}

- (IBAction)WSNextWord:(id)sender {
    [self WSResetBoard];
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

- (void)WSResetBoard{
    word = [self WSGetWord:words];
    WSScrambledWord.text = [self WSScrambleWord:word];
    WSTextEntry.text = @"";
    WSResult.text = @"";
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
    words = [self WSLoadWordlist];
    word = [self WSGetWord:words];
    WSScrambledWord.text = [self WSScrambleWord:word];
	// Do any additional setup after loading the view, typically from a nib.
    WSTextEntry.clearsOnBeginEditing = YES;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidUnload
{
    [self setWSScrambledWord:nil];
    [self setWSTextEntry:nil];
    [self setWSCorrectCount:nil];
    [self setWSIncorrectCount:nil];
    [self setWSResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
