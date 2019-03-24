#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    double length = sqrt (length);
    int row = floor(length);
    int column = ceil(length);
    if (row * column < length){
        row = row + 1;
    }
    NSMutableArray<NSString*> *rowContainer = [[NSMutableArray alloc] initWithCapacity:row];
    for (int i = 0; i < length; i++){
//        if ([rowContainer containsString: length])
        //NSRange range = NSMakeRange(i, row);
    }
        return @"";
}

@end
