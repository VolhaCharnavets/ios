#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
        int diagonal1 = 0, diagonal2 = 0;
        int n = array.count;
    for (int i=0; i<n; i++) {
       id object = array[i];
        if ([object isKindOfClass:[NSString class]]) {
        NSArray<NSString *> *items = [(NSString *)object componentsSeparatedByString:@" "];
        diagonal1 = diagonal1 + items[i].intValue;
        diagonal2 = diagonal2 + items[n-i-1].intValue;
        }
    }
    return @(abs(diagonal1-diagonal2));
}

@end
