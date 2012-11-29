//
//  ViewController.m
//  Calculator
//
//  Created by Michael Youngblood on 11/28/12.
//  Copyright (c) 2012 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "infoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    calculatorScreen.text = @"0";
    calculatorPower.on = TRUE;
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
    UIButton *button = (UIButton*)sender;
    if(button != nil)
    {
        if (button.tag == 42)
        {
            infoViewController *infoScreen = [[infoViewController alloc] initWithNibName:@"infoViewController" bundle:nil];
            if (infoScreen != nil)
            {
                [self presentViewController:infoScreen animated:TRUE completion:nil];
            }
        }
        else
        {
            NSLog(@"%d", button.tag);
        }
    }

}

@end
