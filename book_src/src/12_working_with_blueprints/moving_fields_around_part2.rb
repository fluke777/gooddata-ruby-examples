employee_data_with_dep = [
    ['label.employee.id','label.employee.fname','label.employee.lname','dataset.department', 'label.department.region'],
    ['e1','Sheri','Nowmer','d1', 'North America'],
    ['e2','Derrick','Whelply','d2', 'Europe']
]
project.upload(employee_data_with_dep, blueprint, 'dataset.employee')
