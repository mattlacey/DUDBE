public class RepositoryServices
{
    public static void handleEvents(List<Hook_Called__e> events)
    {
        // Don't do this ;)
        Hook_Called__e hook = events[0];
        GithubWebhook gwh = (GithubWebhook)JSON.deserialize(hook.Body__c, GithubWebhook.class);
        
        if(gwh.Comment != null)
        {
            CommentServices.insertComment(gwh);
        }
	}

	public static Repository__c getByExternalId(String extId)
    {
		List<Repository__c> repos = [select Id, Name, External_Id__c from Repository__c
                                     where External_Id__c = : extId];
        return repos.size() > 0 ? repos[0] : null;
    }
    
    public static Repository__c createRepository(String name, String extId)
    {
        Repository__c r = new Repository__c
        (
            Name = name,
            External_Id__c = extId
        );
        
        insert r;
        return r;
	}
}