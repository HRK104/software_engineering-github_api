from github import Github

def main():
	
    tokenInput = input("Enter your User Token : \n")
    g = Github(tokenInput)
    user = g.get_user()

    print("")
    print("User_info:")
    print("Login : " + user.login)
    print("ID : " + str(user.id))
    print("Name : " + user.name)
    print("URL : " + user.url)
    print("Number of Public Repos : " + str(user.public_repos))

    print("")
    print("Repository:")
    for repo in g.get_user().get_repos():
        print(repo.name)

main()	