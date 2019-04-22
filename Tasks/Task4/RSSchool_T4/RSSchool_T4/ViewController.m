//
//  ViewController.m
//  RSSchool_T4
//
//  Created by Olia on 4/20/19.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIImageView *flagView;
@property (nonatomic, retain) NSDictionary *contryPrefex;
@property (nonatomic, retain) NSDictionary *contryLength;
@end

@implementation ViewController

- (void)dealloc {
    [_textField release];
    [_flagView release];
    [_contryPrefex release];
    [_contryLength release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contryPrefex = @{ @"7": @"RU",
                           @"7": @"KZ",
                           @"373": @"MD",
                           @"374": @"AM",
                           @"375": @"BY",
                           @"380": @"UA",
                           @"992": @"TJ",
                           @"993": @"TM",
                           @"994": @"AZ",
                           @"996": @"KG",
                           @"998": @"UZ",
                           };
    self.contryLength = @{@"RU": @(7),
                          @"KZ": @(7),
                          @"MD": @(8),
                          @"AM": @(8),
                          @"BY": @(9),
                          @"UA": @(9),
                          @"TJ": @(9),
                          @"TM": @(8),
                          @"AZ": @(9),
                          @"KG": @(9),
                          @"UZ": @(9),
                          };
    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.delegate = self;
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.flagView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.flagView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: self.textField];
    [self.view addSubview:self.flagView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGFloat screenWidth = self.view.frame.size.width;
    
    self.flagView.frame = CGRectMake(20,40,60,40);
    self.textField.frame = CGRectMake(100, 40, screenWidth-20-60-40, 40);
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *fullText = [self.textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *number = [self extractNumber:fullText];
    if (number.length > 12) {
        return NO;
    }
    
    NSString *prefex = [self codeForNumber:number];
    [self setFlag:prefex];
    
    self.textField.text = [NSString stringWithFormat:@"+%@", number];
    
    return NO;
}

-(NSString *)extractNumber:(NSString *)text {
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return [[text componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
}

-(NSString *)formatText:(NSString *)text {
    
    
    return text;
}

-(NSString *)codeForNumber:(NSString *)number {
    if (number.length >= 1) {
        NSString *prefex = self.contryPrefex[[number substringToIndex:1]];
        if (prefex != nil) {
            return prefex;
        }
        else if (number.length >= 3) {
            return self.contryPrefex[[number substringToIndex:3]];
        }
    }

    return nil;
}

-(void)setFlag:(NSString *)prefix {
    if (prefix.length > 0) {
        NSString *name = [NSString stringWithFormat:@"flag_%@", prefix];
        self.flagView.image = [UIImage imageNamed:name];
    }
    else {
        self.flagView.image = nil;
    }
}


@end
