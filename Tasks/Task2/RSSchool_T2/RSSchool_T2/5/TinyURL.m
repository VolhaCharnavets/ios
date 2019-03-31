#import "TinyURL.h"

NSString *kSimbols = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
NSString *base = @"ba.se/";

@implementation TinyURL {
    NSMutableDictionary *storage;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        storage = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)dealloc
{
    [storage release];
    [super dealloc];
}

-(NSURL *)encode:(NSURL *)originalURL {
    
    NSUInteger hash = originalURL.absoluteString.hash;
    NSMutableString *encodedString = [[NSMutableString alloc] initWithString:base];
    NSUInteger div = kSimbols.length;
    
    while (hash >0) {
        NSString *sumb = [kSimbols substringWithRange:NSMakeRange(hash % div, 1)];
        [encodedString appendString:sumb];
        hash /= div;
    }
    storage [encodedString] = originalURL;
    
    NSURL *resultUrl = [NSURL URLWithString:encodedString];
    [encodedString release];
    
    return resultUrl;
    
}
-(NSURL *)decode:(NSURL *)shortenedURL {
    
    return storage [shortenedURL.absoluteString];
}


@end
