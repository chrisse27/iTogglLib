//
//  TGLTimeEntry+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 25/06/14.
//  Copyright 2014 Christoph Krautz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
    
    [dict setValue:@"iTogglLib" forKey:@"created_with"];
    
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
