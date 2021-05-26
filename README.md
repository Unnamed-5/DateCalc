Some simple functions to calculate dates.
Supports non-gregorian calendars.

Includes some handy extensions.
For example, get the components of a date quickly:

'''
print(Date().year) //example output: 2021
'''

Get the next occurrence of a given date:

'''
//if today is 2020-5-15
print(NextDay(of: Date()) //output: 2021-5-15
'''

Of course, this supports 2-29, which appears every 4 years:

'''
if today is 2020-2-29
print(NextDay(of: Date()) //output: 2024-2-29
'''
