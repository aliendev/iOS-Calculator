//
//  ViewController.h
//  Calculator
//
//  Created by Michael Youngblood on 11/28/12.
//  Copyright (c) 2012 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UISwitch *calculatorPower;
    IBOutlet UITextField *calculatorScreen;
    IBOutlet UIButton *infoScreenButton;

    int buttonIndex;
    int numberOne;
    int numberTwo;
    bool stillTypeing;
}

// Anything that doesn't fit in a specific IBAction
-(IBAction)onClick:(id)sender;

// Numbers of the calculator pressed
-(IBAction)numberPressed:(UIButton *)sender;

// Functions such as clear, addition, and equals
-(IBAction)functionPressed:(UIButton *)sender;

// power switch has been either turned on or off
-(IBAction)powerSwitched:(UISwitch *)sender;

// background color switcher
-(IBAction)colorSwitcher:(UISegmentedControl *)sender;

// Clear Vars
-(void)clearCalculator;

@end
