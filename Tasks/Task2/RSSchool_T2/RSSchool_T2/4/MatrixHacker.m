#import "MatrixHacker.h"

@interface MatrixHacker ()
@property (nonatomic, copy) id<Character>(^injectedBlock)(NSString*);

@end

@implementation MatrixHacker

- (void)dealloc
{
    [_injectedBlock release];
    [super dealloc];
}


- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *name in names) {
        id<Character> character = self.injectedBlock(name);
    }
    return result;
}


-(void)injectCode:(id<Character> (^)(NSString *))theBlock {
    self.injectedBlock = theBlock;
    
}
@end
