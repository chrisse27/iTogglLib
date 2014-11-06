//
//  TGLTimeEntry+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 25/06/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry+Json.h"
#import "TGLTogglClient.h"

static NSString * const TGLJsonKeyTimeEntry = @"time_entry";
static NSString * const TGLJsonKeyTimeEntryIdentifier = @"id";
static NSString * const TGLJsonKeyTimeEntryProjectId = @"pid";
static NSString * const TGLJsonKeyTimeEntryDescription = @"description";
static NSString * const TGLJsonKeyTimeEntryStart = @"start";
static NSString * const TGLJsonKeyTimeEntryStop = @"stop";
static NSString * const TGLJsonKeyTimeEntryCreatedWith = @"created_with";

@implementation TGLTimeEntry (Json)

+ (TGLTimeEntry *)timeEntryFromDictionary:(NSDictionary *)dictionary
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    
    entry.identifier = [[dictionary objectForKey:TGLJsonKeyTimeEntryIdentifier] integerValue];
    entry.entryDescription = [dictionary objectForKey:TGLJsonKeyTimeEntryDescription];
    entry.start = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:TGLJsonKeyTimeEntryStart]];
    entry.stop = [[TGLTogglClient formatter] dateFromString:[dictionary objectForKey:TGLJsonKeyTimeEntryStop]];
    entry.pid = [[dictionary objectForKey:TGLJsonKeyTimeEntryProjectId] integerValue];

    return entry;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    
    [dict setValue:self.entryDescription forKey:TGLJsonKeyTimeEntryDescription];
    [dict setValue:[NSNumber numberWithInteger:self.pid] forKey:TGLJsonKeyTimeEntryProjectId];
    if (self.start) {
        [dict setValue:[[TGLTogglClient formatter] stringFromDate:self.start] forKey:TGLJsonKeyTimeEntryStart];
    }
    if (self.stop) {
        [dict setValue:[[TGLTogglClient formatter] stringFromDate:self.stop] forKey:TGLJsonKeyTimeEntryStop];
    }

    return [NSDictionary dictionaryWithObject:dict forKey:TGLJsonKeyTimeEntry];
}

@end
