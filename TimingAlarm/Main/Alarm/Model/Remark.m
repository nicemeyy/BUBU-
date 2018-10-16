//
//  Remark.m
//  TimingAlarm
//
//  Created by 董志盟 on 2018/10/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "Remark.h"




@implementation Remark

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.title forKey:TITLE];
    [aCoder encodeBool:self.isNotification forKey:ISNOTIFICATION];
    [aCoder encodeObject:self.date forKey:DATE];
    [aCoder encodeObject:self.detail forKey:DETAIL];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:TITLE];
        self.isNotification = [aDecoder decodeBoolForKey:ISNOTIFICATION];
        self.date = [aDecoder decodeObjectForKey:DATE];
        self.detail = [aDecoder decodeObjectForKey:DETAIL];
        
    }
    
    return self;
}


@end
