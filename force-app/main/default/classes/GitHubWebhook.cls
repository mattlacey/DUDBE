public class GitHubWebhook
{
    public class User
    {
        public String login {get; set;}
        public String avatar_url {get; set;}
	}

    public class Repository
    {
        public String id {get; set;}
        public String name {get; set;}
    }
    
   	public class Comment
    {
        public String id {get; set;}
        public String body {get; set;}
        public User user {get; set;}
    }

    public String action {get; set;}    
    public Repository repository {get; set;}
    public Comment comment {get; set;}
}