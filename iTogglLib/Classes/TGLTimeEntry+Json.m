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
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    
    entry.identifier = [[dictionary objectForKey:@"id"] integerValue];
    entry.entryDescription = [dictionary objectForKey:@"description"];
    entry.start = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:@"start"]];
    entry.stop = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:@"stop"]];
    entry.pid = [[dictionary objectForKey:@"pid"] integerValue];

    return entry;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setValue:self.entryDescription forKey:@"description"];
    [dict setValue:[NSNumber numberWithInteger:self.pid] forKey:@"pid"];
    if (self.start) {
        [dict setValue:[[TGLTogglClient formatter] stringFromDate:self.start] forKey:@"start"];
    }
    if (self.stop) {
        [dict setValue:[[TGLTogglClient formatter] stringFromDate:self.stop] forKey:@"stop"];
    }

    return [NSDictionary dictionaryWithObject:dict forKey:@"time_entry"];
}

@end
