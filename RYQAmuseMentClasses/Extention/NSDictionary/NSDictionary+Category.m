//
//  NSDictionary+Category.m
//  StarAPP
//
//  Created by 橘子 on 2018/12/20.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (NSString *)descriptionWithLocale:(id)locale{
    
    if (![self count]) {
        return @"";
    }
    NSString *tempStr1 =
    [[self description] stringByReplacingOccurrencesOfString:@"\\u"
                                                  withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    
    [NSPropertyListSerialization propertyListWithData:tempData
                                              options:NSPropertyListImmutable
                                               format:NULL
                                                error:NULL];
    return str;
    
}

@end
