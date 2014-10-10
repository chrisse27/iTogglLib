//
//  TGLProject+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProject+Json.h"

#import "TGLTogglClient.h"

@implementation TGLProject (Json)

+ (TGLProject *)projectFromDictionary:(NSDictionary *)dictionary
{
    TGLProject *project = [[TGLProject alloc] init];
    
    project.identifier = [[dictionary objectForKey:@"id"] integerValue];
    project.name = [dictionary objectForKey:@"name"];
    project.color = [[dictionary objectForKey:@"color"] integerValue];
    
    return project;
}

- (NSDictionary *)dictionary
{
    return nil;
}

@end
