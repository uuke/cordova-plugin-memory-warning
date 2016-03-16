#import "CDVMemoryWarning.h"
#import <Cordova/CDVPluginResult.h>

@implementation CDVMemoryWarning 

-(void) pluginInitialize{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMemoryWarning) name:@"UIApplicationDidReceiveMemoryWarning" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMemoryWarning) name:@"UIApplicationDidReceiveMemoryWarning" object:nil];

}

 - (void)onMemoryWarning
{
   // override to remove caches, etc
    NSLog(@"onMemoryWarning");
    NSString * javascriptString = @"cleanMemoryCache();";
   [self.webView stringByEvaluatingJavaScriptFromString:javascriptString];
}


@end
