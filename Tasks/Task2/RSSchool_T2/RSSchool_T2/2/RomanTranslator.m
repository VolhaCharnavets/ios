#import "RomanTranslator.h"

@implementation RomanTranslator {
    NSMutableString *result;
}

- (void)dealloc
{
    [result release];
    
    [super dealloc];
}

-(NSString *)romanFromArabic:(NSString *)arabicString {
    
    NSDictionary *romanRules = @{ @(1000): @"M",
                                  @(900): @"CM",
                                  @(500): @"D",
                                  @(400): @"CD",
                                  @(100): @"C",
                                  @(90): @"XC",
                                  @(50): @"L",
                                  @(40): @"XL",
                                  @(10): @"X",
                                  @(9): @"IX",
                                  @(5): @"V",
                                  @(4): @"IV",
                                  @(1): @"I",
                                  };
    
    NSString *digits = [[romanRules allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSNumber *  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        return obj1.integerValue < obj2.integerValue;
    }];
    
    int value = [arabicString intValue];
    result = [[NSMutableString alloc] init];
    
    for (NSNumber *digit in digits) {
        value = [self digitToString:digit.intValue value:value romain:romanRules[digit]];
    }
    
    return result;
}

- (int)digitToString:(int)digit value:(int)value romain:(NSString *)romain {
    while (value / digit > 0) {
        [result appendString:romain];
        value -= digit;
    }
    return value;
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    
    NSDictionary *arabicRules = @{ @"M": @(1000),
                                   @"D": @(500),
                                   @"C": @(100),
                                   @"L": @(50),
                                   @"X": @(10),
                                   @"V": @(5),
                                   @"I": @(1),
                                   };
    
    NSDictionary *arabicIntermRules = @{ @"CM": @(900),
                                         @"CD": @(400),
                                         @"XC": @(90),
                                         @"XL": @(40),
                                         @"IX": @(9),
                                         @"IV": @(4),
                                         };
    
    int value = 0;
    
    NSMutableString *workString = [[NSMutableString alloc] initWithString:romanString];
    while (workString.length > 0) {
        if (workString.length >= 2) {
            NSString *roman = [workString substringToIndex:2];
            if (arabicIntermRules[roman] != nil) {
                value += [arabicIntermRules[roman] intValue];
                [workString deleteCharactersInRange:NSMakeRange(0, 2)];
                continue;
            }
        }
        NSString *roman = [workString substringToIndex:1];
        if (arabicRules[roman] != nil) {
            value += [arabicRules[roman] intValue];
            [workString deleteCharactersInRange:NSMakeRange(0, 1)];
            continue;
        }
        return @"Invalid roman";
    }
    
    return [NSString stringWithFormat:@"%d", value];
}

@end
