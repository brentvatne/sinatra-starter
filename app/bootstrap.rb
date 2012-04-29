require_relative 'core_ext/hash'

# Controllers
require_relative 'app'
require_relative 'controllers/authentication_controller'
require_relative 'controllers/home_controller'

# Models
require_relative '../config/data_mapper'
require_relative 'models/user'
require_relative 'models/token_pair'
DataMapper.finalize
DataMapper.auto_upgrade!
