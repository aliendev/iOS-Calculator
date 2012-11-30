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
    // disable the ability to select and type in the calculatorScreen
    calculatorScreen.enabled = FALSE;
    // set the screen to 0
    calculatorScreen.text = @"0";
    // default upon open is powered on
    calculatorPower.on = TRUE;

    // global numbers for calcultor memory is 0's
    numberOne = 0;
    numberTwo = 0;
    
    // user hasn't started typing yet
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
    // get information about the button pressed
    UIButton *button = (UIButton*)sender;
    
    // if the button is in fact there
    if(button != nil)
    {
        
        // if the button's tag is 42 (the info button)
        if (button.tag == 42)
        {
            // setup the infoScreen view
            infoViewController *infoScreen = [[infoViewController alloc] initWithNibName:@"infoViewController" bundle:nil];
            if (infoScreen != nil)
            {
                // present the infoScreenView to screen
                [self presentViewController:infoScreen animated:TRUE completion:nil];
            }
        }
        else
        {
            // if nothing above, log the button tag so i can make a function for it
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
        // print answer to calculator screen
        calculatorScreen.text = [self addNumbers:numberOne two:[calculatorScreen.text intValue]];
        stillTypeing = FALSE;

    }
    else if ([function isEqualToString:@"="])
    {
        // print answer to calculator screen
        calculatorScreen.text = [self addNumbers:numberOne two:[calculatorScreen.text intValue]];
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


-(NSString*)addNumbers:(NSInteger)one two:(NSInteger)two
{
    // set global variables
    numberTwo = two;
    numberOne = (numberOne + numberTwo);

    // convert answer to a string and return it
    NSString *answerString = [[NSString alloc] initWithFormat:@"%d", numberOne];
    return answerString;
}

// clear the calculators memory and reset typing
-(void)clearCalculator
{
    numberOne = 0;
    numberTwo = 0;
    stillTypeing = FALSE;
}

@end
