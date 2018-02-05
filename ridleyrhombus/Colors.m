//
//  Colors.m
//  ridleyrhombus
//
//  Created by Hassan Ahmed Khan on 2/5/18.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

#import "Colors.h"
#import <Cocoa/Cocoa.h>

@implementation Colors

+ (NSArray *)colors {
    // Create empty mutable array to store colors
    NSMutableArray *colors = [NSMutableArray array];
    // Create path for colors file
    NSString *path = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"txt"];
    NSError *error;
    // Read contents of the file
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    // Check for error, if no error process the contents
    if (error == nil) {
        // Seperate strings by newline characters
        NSArray *colorStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        // Loop through each color string
        for (NSString *color in colorStrings) {
            // trim extra spaces
            NSString *trimmedColor = [color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            // Break trimmed string into RGB color components separated by white space character
            NSArray *rgb = [trimmedColor componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            if (rgb.count == 3) {
                CGFloat red = ((NSString*)rgb[0]).floatValue/256.0;
                CGFloat green = ((NSString*)rgb[1]).floatValue/256.0;
                CGFloat blue = ((NSString*)rgb[2]).floatValue/256.0;
                
                [colors addObject:[NSColor colorWithRed:red green:green blue:blue alpha:1.0]];
            }
        }
    }
    
    return colors;
}

@end
