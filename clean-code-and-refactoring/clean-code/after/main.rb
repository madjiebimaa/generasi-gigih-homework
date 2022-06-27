## Names

def get_flagged_cells
  flagged_cells = []

  game_board.each do |cell|
    if cell.is_flagged?
      flagged_cells.add(cell)
    end
  end

  flagged_cells
end

class EmployeesController
  def create
  end

  def get
  end
end

class LocationsController
  def create
  end

  def get
  end
end

class Location
  def calculate_distance(other_location)
  end
end

## Distinction

def register_user(params)
  user = User.new(params)
  user.role = "admin"

  if user.password.blank?
    user.generate_password
  end

  user.send_email_confirmation
end

## Formatting

def register_user(params)
  user = User.new(params)
  user.role = "admin"

  if user.password.blank?
    user.generate_password
  end

  if user.email.blank? or
     user.username.blank? or
     user.phone.blank? or
     !(user.email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)) or
     !(user.phone.match(/\A\+?[\d\s\-\.\(\)]+\z/))
    raise Error::InvalidUserError
  end

  if User.query("select count(1) from users where phone=#{a.phone} or email=#{user.email}") > 0
    raise Error::DuplicateUser

    user.save
    user.send_email_confirmation
    user
  end
end

## Specific Job

def email_active_clients(clients)
  clients.each do |client|
    email(client) if client.active?
  end
end

def active?
  client_record = database.lookup(client)
  client_record.active?
end
