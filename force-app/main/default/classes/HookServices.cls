@RestResource(urlMapping='/hooks')

global class HookServices
{
	@httpPOST
    global static String handleHook()
    {
		EventBus.publish(new Hook_Called__e(Body__c = RestContext.request.requestBody.toString()));
		return 'OK';
    }
}