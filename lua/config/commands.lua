local user_command = require('utils.command_mapper').user_command

-- Case insensitive
user_command('Q', 'q')
user_command('W', 'w')
user_command('Wq', 'wq')
user_command('WQ', 'wq')
user_command('Qa', 'qa')
user_command('Wqa', 'wqa')
user_command('WQa', 'wqa')
