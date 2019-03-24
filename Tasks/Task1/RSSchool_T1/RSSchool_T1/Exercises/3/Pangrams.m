#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    
    NSString* alphabet = @"abcdefghijklmnopqrstuvwxyz";
    NSString *lowercase = [string lowercaseString];
    for (int i=0; i<alphabet.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *letter = [alphabet substringWithRange:range];
        if ([lowercase containsString:letter] == NO) {
            return NO;
        }
    }
    return YES;
}

@end
