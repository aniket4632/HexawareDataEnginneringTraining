import json


json_str_dict = '{"name": "John", "age": 30, "city": "New York"}'

parsed_dict = json.loads(json_str_dict)

print(parsed_dict)


json_str_list = '[1, 2, 3, 4, 5]'


parsed_list = json.loads(json_str_list)


print(parsed_list)
