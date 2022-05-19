//
//  BRImageStore.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/19.
//

#import "BRImageStore.h"
#import <UIkit/UIKit.h>

@interface BRImageStore()

@property (nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation BRImageStore

+(instancetype) sharedStore
{
    static BRImageStore *sharedStore;
    
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) initPrivate
{
    self = [super init];
    if(self) {
        _dict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dict[key] = image;
}

-(UIImage *)imageForKey:(NSString *)key
{
    return self.dict[key];
}


-(void)deleteImageForKey:(NSString *)key
{
    if(!key) {
        return;
    }
    [self.dict removeObjectForKey:key];
}

@end
