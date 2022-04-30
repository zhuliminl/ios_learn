//
//  BNLogger.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/29.
//

#import "BNLogger.h"

@implementation BNLogger
- (NSString *) lastTimeString
{
    static NSDateFormatter *dateFormater = nil;
    if(!dateFormater) {
        dateFormater = [[NSDateFormatter alloc] init];
        [dateFormater setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormater setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormater");
    }
    return [dateFormater stringFromDate:self.lastTime];
}

- (void ) updateLastTime:(NSTimer *) t
{
    NSDate *now = [NSDate date];
    self.lastTime = now;
    
//    [self setLastTime:now];
    NSLog(@"JUST set time to %@", self.lastTimeString);
    NSLog(@"JUST set ----------------> to %@", [self lastTimeString]);
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:_incommingData encoding:NSUTF8StringEncoding];
    _incommingData = nil;
    
    NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];

    
    NSLog(@"result length %lu", string.length);
    NSLog(@"result length %@", string);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"EEEEEEEEEEEee >>>>>>>>>>>> %@", [error localizedDescription]);
    _incommingData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!_incommingData) {
        _incommingData = [[NSMutableData alloc] init];
    }
    [_incommingData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
}


- (void) zoomChange:(NSNotification *)note
{
    NSLog(@"地理位置改变了！");
}

@end
