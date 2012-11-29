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


// Anything that doesn't fit in a specific IBAction
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



// Numbers of the calculator pressed
-(IBAction)numberPressed:(UIButton *)sender
{
    // Get the number placed on the button
    NSString *number = sender.titleLable.text;

    // Prevent leading zeros
    if ([@"0" isEqual:number] && [@"0" isEqual:calculatorScreen.text])
    // if the 0 number is pressed and the display only reads 0
    {
        // do nothing
        return nil;
    }

    // display or append the number on the calculator screen
    calculatorScreen.text = [calculatorScreen.text stringByAppendingString:number];

    // remove original trailing 0
    // code this
}


// Functions such as clear, addition, and equals
-(IBAction)functionPressed:(UIButton *)sender
{
    // Get the function displayed on the button
    NSString *function = sender.titleLabel.text;

    // make first number variable

    // if + was pressed, get value of screen and add it to the variable first number
    // if = was pressed add first number to second number and display answer to screen

    // possible function addition if time insists
    // if + was pressed, display first number in screen until second number is being typed.
}


// power switch has been either turned on or off
-(IBAction)powerSwitched:(UISwitch *)sender
{
    // Get the value being switched to (on/off)
    NSString *power = sender.titleLabel.text;

    // when turning power off, disable all buttons except for power and make screen tint gray

    // when turning power on, enable all buttons and clear first number, second number and display 0 to screen
}


@end
