import sys
from dbhelper import Dbhelper

class Flipcart:
    def __init__(self):
        self.db = Dbhelper()
        self.menu()

    def menu(self):
        user_input = input("""
        1. Register
        2. Login
        3. Exit
                           """) 
        
        if user_input == "1":
            self.register()
        elif user_input == "2":
            self.login()
        else:
            sys.exit(1000)

    def register(self):
        name = input("Enter your name: ")
        email = input("Enter your email: ")
        password = input("Enter your password: ")
        response = self.db.register(name, email, password)

        if response:
            print("Registration successful")
            self.menu()
        else:
            print("Registration failed")

        self.menu()

    def login_menu(self):
        print('''
                1. See Profile
                2. Edit Profile
                3. Delete Profile
                4. Logout
            ''')

    def login(self):
        email = input("Enter your email: ")
        password = input("Enter your password: ")
        data = self.db.search(email, password)
        
        if len(data)==0:
            print("Incorrect Email, Password")
            self.login()
        else:
            print(f"Hello,",data[0][1])
            self.login_menu()


obj = Flipcart()
