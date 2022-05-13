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

- (BRItem *) createItem
{
    BRItem *newItem = [BRItem randomItem];
    [self.privateItems addObject:newItem];
    
    return newItem;
}
@end
