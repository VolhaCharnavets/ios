#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    NSMutableDictionary *myWordsFromNotePaper = [[NSMutableDictionary alloc] init];
    NSArray *noteArray = [[note lowercaseString] componentsSeparatedByString:@" "];
    for (NSString *word in noteArray) {
        if (myWordsFromNotePaper[word] == nil) {
            myWordsFromNotePaper[word] = @(1);
        }
        else {
            NSNumber* count = myWordsFromNotePaper[word];
            myWordsFromNotePaper[word] = @(count.intValue + 1);
        }
    }
    NSArray *checkMagazine = [[magazine lowercaseString] componentsSeparatedByString:@" "];
     for (NSString *word in checkMagazine) {
         if (myWordsFromNotePaper[word] != nil) {
             NSNumber* count = myWordsFromNotePaper[word];
             if (count.intValue >1) {
                 myWordsFromNotePaper[word] = @(count.intValue - 1);
             }
             else {
                 myWordsFromNotePaper[word] = nil;
             }
         }
     }
    return myWordsFromNotePaper.count == 0;
}
@end
