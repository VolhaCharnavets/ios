#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
        int d1 = 0, d2 = 0;
//    for (id object in array){
//        NSArray *items = [object componentsSeparatedByString:@" "];
//        NSLog(@"%@",items);
//    }
    int n = array.count;
    for (int i=0; i<n; i++) {
       id object = array[i];
        if ([object isKindOfClass:[NSString class]]) {
            NSArray<NSString *> *items = [(NSString *)object componentsSeparatedByString:@" "];
        d1 = d1 + items[i].intValue;
        d2 = d2 + items[n-i-1].intValue;
        }
        
    }

    return @(abs(d1-d2));
}

@end
