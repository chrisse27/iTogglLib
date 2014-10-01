//
//  TGLTimeEntry+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 25/06/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry+Json.h"
#import "TGLTogglClient.h"

@implementation TGLTimeEntry (Json)

+ (TGLTimeEntry *)timeEntryFromDictionary:(NSDictionary *)dictionary
{
    NSNumber *identifier = [dictionary objectForKey:@"id"];
    NSString *description = [dictionary objectForKey:@"description"];
    NSDate *start = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:@"start"]];
    NSDate *stop = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:@"stop"]];
    NSNumber *pid = [dictionary objectForKey:@"pid"];
    return [[TGLTimeEntry alloc] initWithIdentifier:[identifier integerValue] andDescription:description andStart:start andStop:stop andPid:[pid integerValue]];
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setValue:self.description forKey:@"description"];
    [dict setValue:[NSNumber numberWithInteger:self.pid] forKey:@"pid"];

    return [NSDictionary dictionaryWithObject:dict forKey:@"time_entry"];
}

@end
