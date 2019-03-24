#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

- (NSInteger)findStartUsortedIndex:(NSArray*)array {
    NSInteger leftUnsorted = NSNotFound;
    for (NSInteger i = 0; i < array.count - 1; i++) {
        if ([array[i] integerValue] > [array[i + 1] integerValue]) {
            leftUnsorted = i;
            break;
        }
    }
    return leftUnsorted;
}
- (NSInteger)findLastUsortedIndex:(NSArray*)array {
    NSInteger rightUnsorted = NSNotFound;
    for (NSInteger i = array.count - 1; i > 0; i--) {
        if ([array[i] integerValue] < [array[i - 1] integerValue]) {
            rightUnsorted = i;
            break;
        }
    }
    return rightUnsorted;
}

- (NSArray*)reversedArray:(NSArray*)array inRange:(NSRange)range {
    NSArray* firstSubArray = [array subarrayWithRange:NSMakeRange(0, range.location)];
    NSArray* reversedSubArray = [[[array subarrayWithRange:range] reverseObjectEnumerator] allObjects];
    
    NSArray* lastSubArray = [array subarrayWithRange:NSMakeRange(range.location + range.length, array.count - range.location - range.length )];
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:firstSubArray];
    [result addObjectsFromArray:reversedSubArray];
    [result addObjectsFromArray:lastSubArray];
    return result;
}

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    NSArray<NSString *> *array = [string componentsSeparatedByString:@" "];
    ResultObject *value = [[ResultObject new] autorelease];
    
    NSInteger startIndex = [self findStartUsortedIndex:array];
    NSInteger lastIndex = [self findLastUsortedIndex:array];
    
    if (startIndex == NSNotFound || lastIndex == NSNotFound || lastIndex <= startIndex) {
        value.status = NO;
        value.detail = @"";
        
        return value;
    }
    
    NSMutableArray *swappedArray = [[NSMutableArray alloc] initWithArray:array];
    [swappedArray exchangeObjectAtIndex:startIndex withObjectAtIndex:lastIndex];
    
    NSArray* sorted = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return obj1.integerValue > obj2.integerValue;
    }];
    if ([sorted isEqualToArray:swappedArray]) {
        value.status = YES;
        value.detail = [NSString stringWithFormat:@"swap %d %d", startIndex + 1, lastIndex + 1];
        [swappedArray release];
        return value;
    }
    [swappedArray release];
    
    NSArray *reversedArray = [self reversedArray:array inRange:NSMakeRange(startIndex, lastIndex - startIndex + 1)];
    if ([sorted isEqualToArray:reversedArray]) {
        value.status = YES;
        value.detail = [NSString stringWithFormat:@"reverse %d %d", startIndex + 1, lastIndex + 1];
        return value;
    }
    
    return value;
}

@end
