//
//  BRItemStore.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/13.
//

#import "BRItemStore.h"
#import "BRItem.h"


@interface BRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BRItemStore


+ (instancetype) sharedStore
{
    static BRItemStore *sharedStore;
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) initPrivate
{
    self = [super init];
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)allItems
{
    return [self.privateItems copy];
}

- (BRItem *) createItem:(int) index
{
    BRItem *newItem = [BRItem randomItem: index];
    [self.privateItems addObject:newItem];
    
    return newItem;
}

-(void)updateItem:(BRItem *) item
{
    // find item
    // replace item
    
    NSString *name = @"xiaoshitou";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K MATCHES[c] %@", @"itemName", item.itemName];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemName beginswith[c] 's'"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemName == %@", item.itemName];
    NSArray *filteredArray = [self.privateItems filteredArrayUsingPredicate:predicate];
    
    
}

- (void) removeItem:(BRItem *)item
{
    [self.privateItems removeObjectIdenticalTo: item];
}

-(void) moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex
{
    if(fromIndex == toIndex) {
        return;
    }
    
    BRItem *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
    
}

@end
