//
//  PageModel.m
//  StatisticDemo
//
//  Created by  GaoGao on 2020/2/14.
//  Copyright © 2020年  GaoGao. All rights reserved.
//

#import "PageModel.h"
#import <objc/runtime.h>
@implementation PageModel
- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *names = [[self class] getPropertyNames];
    for (NSString *name in names) {
        id value = [self valueForKey:name];
        [aCoder encodeObject:value forKey:name];
    }
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        NSArray *names = [[self class] getPropertyNames];
        for (NSString *name in names) {
            id value = [aDecoder decodeObjectForKey:name];
            [self setValue:value forKey:name];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    id obj = [[[self class] alloc] init];
    NSArray *names = [[self class] getPropertyNames];
    for (NSString *name in names) {
        id value = [self valueForKey:name];
        [obj setValue:value forKey:name];
    }
    return obj;
}

+ (NSArray *)getPropertyNames {
    // Property count
    unsigned int count;
    // Get property list
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    // Get names
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        // objc_property_t
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        if (name.length) {
            [array addObject:name];
        }
    }
    free(properties);
    return array;
}

@end
