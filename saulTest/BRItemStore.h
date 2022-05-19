//
//  BRItemStore.h
//  saulTest
//
//  Created by 朱黎明 on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class BRItem;

@interface BRItemStore : NSObject
@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedStore;
- (BRItem *) createItem:(int) index;

- (void) removeItem:(BRItem *)item;

-(void) moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex;

-(void)updateItem:(BRItem *) item;

@end

NS_ASSUME_NONNULL_END
