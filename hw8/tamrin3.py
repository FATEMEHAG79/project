from datetime import datetime 
def log_calls(file_name): 
    def decorator(func): 
        def wrapper(*args, **kwargs): 
            with open(file_name, 'a') as log_file:
                 function_name = func.__name__ 
                 call_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                 log_entry = f"Function '{function_name}' called at {call_time}\n"
                 log_file.write(log_entry)
            return func(*args,**kwargs)
        return wrapper
    return decorator 
log_file_name = "function_calls.log"
@log_calls(log_file_name) 
def function_1(): 
    print(3+4) 
function_1()