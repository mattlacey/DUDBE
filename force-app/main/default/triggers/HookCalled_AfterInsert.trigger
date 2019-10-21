trigger HookCalled_AfterInsert on Hook_Called__e (after insert)
{
    RepositoryServices.handleEvents(trigger.new);
}