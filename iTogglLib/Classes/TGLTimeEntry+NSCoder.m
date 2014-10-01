//
//  TGLTimeEntry+NSCoder.m
//  iTogglLib
//
//  Created by Christoph Krautz on 22/08/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry+NSCoder.h"

@implementation TGLTimeEntry (NSCoder)

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.identifier] forKey:@"identifier"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.pid] forKey:@"pid"];
    [encoder encodeObject:self.description forKey:@"description"];
    [encoder encodeObject:self.start forKey:@"start"];
    [encoder encodeObject:self.stop forKey:@"stop"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSNumber *identifier = [decoder decodeObjectForKey:@"identifier"];
    NSString *description = [decoder decodeObjectForKey:@"description"];
    NSDate *start = [decoder decodeObjectForKey:@"start"];
    NSDate *stop = [decoder decodeObjectForKey:@"stop"];
    NSNumber *pid = [decoder decodeObjectForKey:@"pid"];
    
    return [self initWithIdentifier:[identifier integerValue] andDescription:description andStart:start andStop:stop andPid:[pid integerValue]];
}

@end
