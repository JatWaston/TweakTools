#line 1 "/Volumes/Nirvana/Work/Private/Github/TweakTools/JWNotifyWatcher/JWNotifyWatcher/JWNotifyWatcher.xm"




#include <substrate.h>

#include <notify.h>
#import <CoreFoundation/CoreFoundation.h>


extern "C" uint32_t notify_post(const char *name);
MSHook(uint32_t, notify_post, const char *name)
{
    NSLog(@"JWNotifyWatcher:notify_post->%s",name);
    uint32_t result = _notify_post(name);
    return result;
}


extern "C" void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFStringRef name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately);

MSHook(void,CFNotificationCenterPostNotification,CFNotificationCenterRef center, CFStringRef name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
    NSLog(@"JWNotifyWatcher:CFNotificationCenterPostNotification->center=%@ name=%@ userInfo=%@ deliverImmediately=%d",center,name,(NSDictionary *)userInfo,deliverImmediately);
    _CFNotificationCenterPostNotification(center,name,object,userInfo,deliverImmediately);
}


#include <logos/logos.h>
#include <substrate.h>
@class CPDistributedMessagingCenter; @class NSNotificationCenter; 
static void (*_logos_orig$_ungrouped$NSNotificationCenter$postNotification$)(NSNotificationCenter*, SEL, NSNotification *); static void _logos_method$_ungrouped$NSNotificationCenter$postNotification$(NSNotificationCenter*, SEL, NSNotification *); static void (*_logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$)(NSNotificationCenter*, SEL, NSString *, id); static void _logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$(NSNotificationCenter*, SEL, NSString *, id); static void (*_logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$)(NSNotificationCenter*, SEL, NSString *, id, NSDictionary *); static void _logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$(NSNotificationCenter*, SEL, NSString *, id, NSDictionary *); static BOOL (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$)(CPDistributedMessagingCenter*, SEL, id, id, id, id, BOOL, id *, BOOL, id *); static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$(CPDistributedMessagingCenter*, SEL, id, id, id, id, BOOL, id *, BOOL, id *); static BOOL (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$)(CPDistributedMessagingCenter*, SEL, id, id, id *, id *, id, SEL, void *, BOOL); static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$(CPDistributedMessagingCenter*, SEL, id, id, id *, id *, id, SEL, void *, BOOL); static BOOL (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$)(CPDistributedMessagingCenter*, SEL, id, id, id *, id *, id, SEL, void *); static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$(CPDistributedMessagingCenter*, SEL, id, id, id *, id *, id, SEL, void *); static void (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$)(CPDistributedMessagingCenter*, SEL, id, id, id, SEL, void *); static void _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$(CPDistributedMessagingCenter*, SEL, id, id, id, SEL, void *); static id (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$)(CPDistributedMessagingCenter*, SEL, id, id, id *); static id _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$(CPDistributedMessagingCenter*, SEL, id, id, id *); static id (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$)(CPDistributedMessagingCenter*, SEL, id, id); static id _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$(CPDistributedMessagingCenter*, SEL, id, id); static BOOL (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$)(CPDistributedMessagingCenter*, SEL, id, id); static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$(CPDistributedMessagingCenter*, SEL, id, id); static BOOL (*_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$)(CPDistributedMessagingCenter*, SEL, id, id); static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$(CPDistributedMessagingCenter*, SEL, id, id); 

#line 29 "/Volumes/Nirvana/Work/Private/Github/TweakTools/JWNotifyWatcher/JWNotifyWatcher/JWNotifyWatcher.xm"


static void _logos_method$_ungrouped$NSNotificationCenter$postNotification$(NSNotificationCenter* self, SEL _cmd, NSNotification * notification) {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotification:%@",notification);
    _logos_orig$_ungrouped$NSNotificationCenter$postNotification$(self, _cmd, notification);
}

static void _logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$(NSNotificationCenter* self, SEL _cmd, NSString * aName, id anObject) {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotificationName:%@ object:%@",aName,anObject);
    _logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$(self, _cmd, aName, anObject);
}

static void _logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$(NSNotificationCenter* self, SEL _cmd, NSString * aName, id anObject, NSDictionary * aUserInfo) {
    NSLog(@"JWNotifyWatcher:NSNotificationCenter:->postNotificationName:%@ object:%@ userInfo:%@",aName,anObject,aUserInfo);
    _logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$(self, _cmd, aName, anObject, aUserInfo);
}






static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2, id arg3, id arg4, BOOL arg5, id * arg6, BOOL arg7, id * arg8) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ oolKey:%@",arg1,arg2,arg3);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2, id * arg3, id * arg4, id arg5, SEL arg6, void * arg7, BOOL arg8) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ receiveReply:na",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2, id * arg3, id * arg4, id arg5, SEL arg6, void * arg7) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->_sendMessage:%@ userInfoData:%@ receiveReply:na error:na",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}

static void _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2, id arg3, SEL arg4, void * arg5) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
}

static id _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2, id * arg3) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@ error:na",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$(self, _cmd, arg1, arg2, arg3);
}

static id _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageAndReceiveReplyName:%@ userInfo:%@",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$(self, _cmd, arg1, arg2);
}

static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendNonBlockingMessageName:%@ userInfo:%@",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$(self, _cmd, arg1, arg2);
}

static BOOL _logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$(CPDistributedMessagingCenter* self, SEL _cmd, id arg1, id arg2) {
    NSLog(@"JWNotifyWatcher:CPDistributedMessagingCenter:->sendMessageName:%@ userInfo:%@",arg1,arg2);
    return _logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$(self, _cmd, arg1, arg2);
}




static __attribute__((constructor)) void _logosLocalCtor_6fceaa28() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    {Class _logos_class$_ungrouped$NSNotificationCenter = objc_getClass("NSNotificationCenter"); MSHookMessageEx(_logos_class$_ungrouped$NSNotificationCenter, @selector(postNotification:), (IMP)&_logos_method$_ungrouped$NSNotificationCenter$postNotification$, (IMP*)&_logos_orig$_ungrouped$NSNotificationCenter$postNotification$);MSHookMessageEx(_logos_class$_ungrouped$NSNotificationCenter, @selector(postNotificationName:object:), (IMP)&_logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$, (IMP*)&_logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$);MSHookMessageEx(_logos_class$_ungrouped$NSNotificationCenter, @selector(postNotificationName:object:userInfo:), (IMP)&_logos_method$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$, (IMP*)&_logos_orig$_ungrouped$NSNotificationCenter$postNotificationName$object$userInfo$);Class _logos_class$_ungrouped$CPDistributedMessagingCenter = objc_getClass("CPDistributedMessagingCenter"); MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(_sendMessage:userInfoData:oolKey:oolData:makeServer:receiveReply:nonBlocking:error:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfoData$oolKey$oolData$makeServer$receiveReply$nonBlocking$error$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:nonBlocking:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$nonBlocking$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$_sendMessage$userInfo$receiveReply$error$toTarget$selector$context$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(sendMessageAndReceiveReplyName:userInfo:toTarget:selector:context:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$toTarget$selector$context$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(sendMessageAndReceiveReplyName:userInfo:error:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$error$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(sendMessageAndReceiveReplyName:userInfo:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageAndReceiveReplyName$userInfo$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(sendNonBlockingMessageName:userInfo:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendNonBlockingMessageName$userInfo$);MSHookMessageEx(_logos_class$_ungrouped$CPDistributedMessagingCenter, @selector(sendMessageName:userInfo:), (IMP)&_logos_method$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$, (IMP*)&_logos_orig$_ungrouped$CPDistributedMessagingCenter$sendMessageName$userInfo$);}
    MSHookFunction(notify_post, MSHake(notify_post));
    MSHookFunction(CFNotificationCenterPostNotification, MSHake(CFNotificationCenterPostNotification));
    [pool drain];
}


