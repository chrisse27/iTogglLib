//
//  TGLTimeEntry+NSCoder.m
//  iTogglLib
//
//  Created by Christoph Krautz on 22/08/14.
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

#import "TGLTimeEntry+NSCoder.h"

static NSString * const NSCoderKeyTimeEntryIdentifier = @"identifier";
static NSString * const NSCoderKeyTimeEntryProjectId = @"pid";
static NSString * const NSCoderKeyTimeEntryDescription = @"description";
static NSString * const NSCoderKeyTimeEntryStart = @"start";
static NSString * const NSCoderKeyTimeEntryStop = @"stop";

@implementation TGLTimeEntry (NSCoder)

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.identifier] forKey:NSCoderKeyTimeEntryIdentifier];
    [encoder encodeObject:self.entryDescription forKey:NSCoderKeyTimeEntryDescription];
    [encoder encodeObject:[NSNumber numberWithInteger:self.pid] forKey:NSCoderKeyTimeEntryProjectId];
    [encoder encodeObject:self.start forKey:NSCoderKeyTimeEntryStart];
    [encoder encodeObject:self.stop forKey:NSCoderKeyTimeEntryStop];
}

- (id)initWithCoder:(NSCoder *)decoder {
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    
    entry.identifier = [[decoder decodeObjectForKey:NSCoderKeyTimeEntryIdentifier] integerValue];
    entry.entryDescription = [decoder decodeObjectForKey:NSCoderKeyTimeEntryDescription];
    entry.pid = [[decoder decodeObjectForKey:NSCoderKeyTimeEntryProjectId] integerValue];
    entry.start = [decoder decodeObjectForKey:NSCoderKeyTimeEntryStart];
    entry.stop = [decoder decodeObjectForKey:NSCoderKeyTimeEntryStop];
    
    return entry;
}

@end
