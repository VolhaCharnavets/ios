#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    int sum = 0;
    for (id object in array) {
        if([object respondsToSelector:@selector(intValue)]) {
            sum = sum + [object intValue];
        }
    }
    return @(sum);
}

@end
