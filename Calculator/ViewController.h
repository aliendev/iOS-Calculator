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
}


-(IBAction)onClick:(id)sender;
@end
