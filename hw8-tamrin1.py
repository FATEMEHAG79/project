import re
def rules_registration_check(users):
    allowed_usernames = []
    for user in users:
        username = user['username']
        password = user['password']
        mobile_number = user['mobile_number']
        phone_number = user['phone_number']
        if username.lower() == 'maktab' or username.lower() == 'python':
            continue
        if len(username) < 4:
            continue
        if not re.search(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$', password):
            continue
        if not (re.match(r'^(\+98|0)?9\d{9}$', mobile_number) and re.match(r'^\d{8}$', phone_number)):
            continue
        allowed_usernames.append(username)
    return allowed_usernames
users = [
    {'username': 'john', 'password': 'Pass123!', 'mobile_number': '09123456789', 'phone_number': '12345678'},
    {'username': 'maktab', 'password': 'Password123!', 'mobile_number': '09123456789', 'phone_number': '123456789'},
    {'username': 'alice', 'password': 'pass', 'mobile_number': '09123456789', 'phone_number': '9123456789'},
    {'username': 'johndoe', 'password': 'Password123!', 'mobile_number': '09123456789', 'phone_number': '12345678'}
]

allowed_usernames = rules_registration_check(users)
print(allowed_usernames)
