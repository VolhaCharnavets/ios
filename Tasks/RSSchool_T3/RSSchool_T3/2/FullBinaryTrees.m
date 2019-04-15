#import "FullBinaryTrees.h"
// good luck

@interface Node : NSObject

@property (nonatomic, strong, readonly) Node *left;
@property (nonatomic, strong, readonly) Node *right;
@property (nonatomic, assign, readonly) BOOL isNull;

@end

@implementation Node

- (instancetype)initWithNodes:(Node *)left right:(Node *)right
{
    self = [super init];
    if (self) {
        _left = left;
        _right = right;
    }
    return self;
}

- (void)dealloc
{
    [_left release];
    _left = nil;
    [_right release];
    _right = nil;
    
    [super dealloc];
}

-(BOOL)isNull {
    return _right == nil || _left == nil;
}

//- (void)setNodesLeft:(Node *)left right:(Node *)right {
//    [left retain];
//    [right retain];
//    [_left release];
//    [_right release];
//    _left = left;
//    _right = right;
//}

@end

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
    
    NSArray<Node *> *trees = [self createTreesFrom:1 to:count];
    
    NSMutableArray *result = [NSMutableArray array];
    for (Node *firstNode in trees) {
        [result addObject:[self printTree:firstNode]];
    }
    
    NSLog(@"###### res %@", [result componentsJoinedByString:@","]);
    
    return [result componentsJoinedByString:@","];
}

-(NSArray *)printTree:(Node *)firstNode {
    if (firstNode.isNull) {
        return @[@"null", @"null"];
    }
    NSArray *left = [self printTree:firstNode.left];
    NSArray *right = [self printTree:firstNode.right];
    return [@[@"0"] arrayByAddingObjectsFromArray:[left arrayByAddingObjectsFromArray:right]];
}

- (NSArray<Node *> *)createTreesFrom:(NSInteger)start to:(NSInteger)end  {
    
    if (start > end) {
        return @[[Node new]];
    }
    
    NSMutableArray<Node *> *array = [NSMutableArray new];
    
    for (NSInteger i = start; i <= end; i++)
    {
        NSArray<Node *> *leftSubtree  = [self createTreesFrom:start to:i - 1];
        NSArray<Node *> *rightSubtree = [self createTreesFrom:i + 1 to:end];
        
        for (NSInteger j = 0; j < leftSubtree.count; j++) {
            Node *left = leftSubtree[j];
            for (NSInteger k = 0; k < rightSubtree.count; k++) {
                
                NSLog(@"###### k %@", @(k));
                Node *right = rightSubtree[k];
                Node *node = [[Node alloc] initWithNodes:left right:right];
                [array addObject:node];
                [node release];
            }
        }
        
    }
    return array;
}

@end
