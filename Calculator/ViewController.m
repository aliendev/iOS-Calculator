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
    calculatorScreen.enabled = FALSE;
    calculatorScreen.text = @"0";
    calculatorPower.on = TRUE;
    numberOne = 0;
    numberTwo = 0;
    stillTypeing = FALSE;
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
    NSString *number = sender.titleLabel.text;
    NSLog(@"%@", number);
    // Prevent leading zeros
    if ([@"0" isEqual:number] && [@"0" isEqual:calculatorScreen.text])
    // if the 0 number is pressed and the display only reads 0
    {
        // do nothing and continue not typing
        stillTypeing = FALSE;
    }
    // if the number on the screen is 0
    else if (stillTypeing == FALSE)
    {
        // replace screentext with pressed number
        calculatorScreen.text = number;
        stillTypeing = TRUE;
    }
    else
    {
        // display or append the number on the calculator screen
        calculatorScreen.text = [calculatorScreen.text stringByAppendingString:number];
        stillTypeing = TRUE;
    }
}


// Functions such as clear, addition, and equals
-(IBAction)functionPressed:(UIButton *)sender
{
    // Get the function displayed on the button
    NSString *function = sender.titleLabel.text;
    NSLog(@"%@", function);
    
    // if + was pressed, get value of screen and add it to the variable first number
    if ([function isEqualToString:@"+"])
    {

        numberTwo = [calculatorScreen.text intValue];
        numberOne = (numberOne + numberTwo);
        NSString *theAnswerString = [[NSString alloc] initWithFormat:@"%d", numberOne];
        calculatorScreen.text = [[NSString alloc] initWithString:theAnswerString];
        stillTypeing = FALSE;

    }
    else if ([function isEqualToString:@"="])
    {
        // if = was pressed add first number to second number and display answer to screen
        numberTwo = [calculatorScreen.text intValue];
        numberOne = (numberOne + numberTwo);
        NSString *theAnswerString = [[NSString alloc] initWithFormat:@"%d", numberOne];
        calculatorScreen.text = [[NSString alloc] initWithString:theAnswerString];
        [self clearCalculator];
    }
    else if ([function isEqualToString:@"Clear"])
    {
        [self clearCalculator];
        NSString *theAnswerString = [[NSString alloc] initWithFormat:@"%d", numberOne];
        calculatorScreen.text = [[NSString alloc] initWithString:theAnswerString];
    }
    
}


// power switch has been either turned on or off
-(IBAction)powerSwitched:(id)sender
{
    // Get the value being switched to (on/off)
    UISwitch *powerSwitch = (UISwitch*)sender;
    if (powerSwitch != nil)
    {
        if (powerSwitch.on == FALSE)
        {
            // when turning power off, disable all buttons except for power and make screen tint gray
            NSLog(@"Powering off");
            calculatorScreen.text = @"Powering Off";
            for (UIButton *allButtons in self.view.subviews)
            {
                allButtons.enabled = FALSE;
            }
            calculatorScreen.text = @"Powered Off";
            self.view.backgroundColor = [UIColor darkGrayColor];
            powerSwitch.enabled = TRUE;
        }
        else if (powerSwitch.on == TRUE)
        {
            // when turning power on, enable all buttons and clear first number, second number and display 0 to screen
            NSLog(@"Powering on");            
            calculatorScreen.text = @"Powering On";
            for (UIButton *allButtons in self.view.subviews)
            {
                allButtons.enabled = TRUE;
            }
            [self clearCalculator];
            self.view.backgroundColor = [UIColor lightGrayColor];
            calculatorScreen.text = @"0";
        }
    }

}

-(IBAction)colorSwitcher:(UISegmentedControl *)sender
{
    UISegmentedControl *colorChanger = (UISegmentedControl*)sender;
    if (colorChanger != nil)
    {
        int colorSelectorIndex = colorChanger.selectedSegmentIndex;
        NSLog(@"%d", colorSelectorIndex);
        if(colorSelectorIndex == 0)
        {
            self.view.backgroundColor = [UIColor whiteColor];
        }
        else if (colorSelectorIndex == 1)
        {
            self.view.backgroundColor = [UIColor blueColor];
        }
        else if (colorSelectorIndex == 2)
        {
            self.view.backgroundColor = [UIColor greenColor];
        };
    }
}

-(void)clearCalculator
{
    numberOne = 0;
    numberTwo = 0;
    stillTypeing = FALSE;
}

@end
