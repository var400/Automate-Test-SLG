import time

time.sleep(5)
def custom_function(param1, param2):
    # Custom Python function that can be used in Robot Framework
    result = param1 + param2
    return result

# Input list of strings
input_list = [
    'Postpaid\nSubscriber Status 12\ncheckbox\nSubscriber Status 12\n1',
    'Prepaid\nSubscriber Type\nradio\nSubscriber Type\n2',
    'Prepaid\nDevice\ncheckbox\nDevice\n3\nSmartphone,WLAN Router',
    'Prepaid\nThai ID Card\ndropdown\nThai ID Card\n4',
    'Prepaid\nGrade\ntext\nGrade\n5',
    'Prepaid\nTurecard Type\nlistbox\nTurecard Type\n6\nGreen',
    'Prepaid\nTEST TEXT BOX\ntext\nTEST TEXT BOX\n8',
    'Prepaid\nSubscriber Status\nmulti_dropdown\nSubscriber Status\n9\nA,D',
    'Prepaid\ntest 2\ncheckbox\ntest 2\n13\ntest 2 ,test 3',
    'Prepaid\nTEST TEXT BOX4\ntext\nTEST TEXT BOX4\n20',
    'Prepaid Test Postgres\nTRUE CARD TYPE\nmulti_dropdown\nTEST TRUE CARD TYPE\n1\nGreen'
]

# Function to reformat the strings
def reformat_string(s):
    parts = s.split('\n')
    if len(parts) < 5:
        return None  # Not enough parts to reformat

    # Extract the necessary parts
    category = parts[0].strip()
    description = parts[1].strip()
    additional_info = parts[4].strip() if len(parts) > 4 else ''
    
    # Extract the number
    number = parts[-2].strip() if len(parts) > 2 else ''
    
    # Reformat into the desired format
    return f'{number},{category},{description}'

# Apply the function to each string in the list
reformatted_list = [reformat_string(item) for item in input_list if reformat_string(item) is not None]

# Print the reformatted list
for item in reformatted_list:
    print(item)