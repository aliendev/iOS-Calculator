//
//  ViewController.m
//  Calculator
//
//  Created by Michael Youngblood on 11/28/12.
//  Copyright (c) 2012 FullSail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    calculatorScreen.text = @"0";
    calculatorPower.on = true;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    
}

@end
