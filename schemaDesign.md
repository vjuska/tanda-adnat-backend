# Models

**organisations**

org_id: varchar
org_name: varchar
hourly_rate: number

**organistion employees**

employee_id: varchar
org_id: varchar
user_id: varchar  // allows users to work for multiple orgs
hourly_rate: number  // allows for different wage rages per employee

**users**

user_id: varchar
first_name: varchar
last_name: varchar
email_address: varchar
password: varchar

**shifts**

shift_id: varchar
<s>org_id: varchar   // this allows duplicate employee id's</s>
employee_id: varchar
shift_start: datetime
shift_finish: datetime
break_length: number
hours_worked: number
shift_cost: number

**breaks**
break_id: varchar
shift_id: varchar
break_start: datetime
break_finish: datetime

# Required Caluculations

shiftLength = shift_finish - shift_start
hoursWorked = shift_length - break_length
shiftCost = hours_worked * hourly_rate

sameDayShift = shift_finsih.to_date() == shift_start.to_date()
isOvernightShift = shift_finish.to_date() - shift_start.to_date() == 1 (anything else is not valid as shift stretches over 24 hours)
