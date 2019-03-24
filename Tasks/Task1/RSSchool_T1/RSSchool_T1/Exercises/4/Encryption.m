#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    double lengthSqrt = sqrt(string.length);
    int rows = ceil(lengthSqrt);
    int columns = floor(lengthSqrt);
    if (rows * columns < string.length){
        columns += 1;
    }
    NSMutableArray *encriptedStrings = [[NSMutableArray alloc] init];

    for (int row = 0; row < rows; row++) {
        NSMutableString *encriptedString = [[NSMutableString alloc] initWithCapacity:columns];
        for (int column = 0; column < columns; column++) {
            int pos = rows * column + row;
            if (pos < string.length) {
                NSRange range = NSMakeRange(pos, 1);
                NSString *letter = [string substringWithRange:range];
                [encriptedString appendString:letter];
            }
        }
        [encriptedStrings addObject:encriptedString];
        [encriptedString release];
    }
    
    NSString* result = [encriptedStrings componentsJoinedByString:@" "];
    [encriptedStrings release];

    return result;
}

@end
