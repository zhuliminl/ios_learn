//
//  BRItem.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/13.
//

#import "BRItem.h"
#import <MBFaker/MBFaker.h>

@implementation BRItem

+ (id) randomItem:(int)index
{
    NSArray *nameList = @[@"saul", @"jemo", @"qingle", @"tang"];

    NSString *randomName = [MBFakerName name];
    NSString *randomName2 = [MBFakerName name];
    
    if(index == 2) {
        randomName = @"saul";
    }
    
    BRItem *newItem = [[self alloc] initWithItemName:randomName userAge:2 userNickname:[NSString stringWithFormat:@"nickname_%@", randomName2]];
    return newItem;
}

-(id ) initWithItemName:(NSString *)name
                userAge:(int )age
           userNickname:(NSString *)nickname
{
    self = [super init];
    if(self) {
        self.itemName = name;
        self.userAge = age;
        self.nickname = nickname;
        self.dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        self.itemId = [uuid UUIDString];
    }
    return self;
}

-(id)init
{
    return [self initWithItemName:@"小石头" userAge:12 userNickname:@"saul"];
}


@end
