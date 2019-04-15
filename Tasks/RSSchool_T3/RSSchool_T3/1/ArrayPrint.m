#import "ArrayPrint.h"


@interface NSString (RSSchool_Extension_Name)
- (NSString *)print;
@end

@implementation NSString (RSSchool_Extension_Name)

- (NSString *)print {
   return [NSString stringWithFormat: @"\"%@\"", self];
}

@end

@interface NSNull (RSSchool_Extension_Name)
- (NSString *)print;
@end

@implementation NSNull (RSSchool_Extension_Name)

- (NSString *)print {
    return @"null";
}

@end

@interface NSNumber (RSSchool_Extension_Name)
- (NSString *)print;
@end

@implementation NSNumber (RSSchool_Extension_Name)

- (NSString *)print {
    return self.description;
}
@end

@interface NSObject (RSSchool_Extension_Name)
- (NSString *)print;
@end

@implementation NSObject (RSSchool_Extension_Name)
- (NSString *)print {
    return @"unsupported";
}
@end

@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print {
    NSMutableArray *prints = [[[NSMutableArray alloc] init] autorelease];
    for (id object in self) {
        [prints addObject:[object print]];
    }
    
    return [NSString stringWithFormat:@"[%@]", [prints componentsJoinedByString:@","]];
}
@end
