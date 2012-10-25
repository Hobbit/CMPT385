//
//  TRPViewController.m
//  Word Scramble
//
//  Created by Chris on 2012-09-22.
//  Copyright (c) 2012 Team Red Panda. All rights reserved.
//

#import "TRPViewController.h"

@interface TRPViewController ()

@end

@implementation TRPViewController

- (IBAction)viewGitHub:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.github.com/Hobbit/CMPT385/tree/master/Word%20Scramble/"];
    
    if (![[UIApplication sharedApplication] openURL:url])
        
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
