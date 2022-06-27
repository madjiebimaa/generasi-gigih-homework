## Names

def getflggdcll
  list1 = []
  list.each do |c|
    if c[0] == 4
      list1.add(c)
    end
  end
  list1
end

class EmployeesController
  def create
  end

  def fetch
  end
end

class LocationsManager
  def create
  end

  def get
  end
end

class Calculate
  def distance(location1, location2)
  end
end

## Distinction

def reg_usr(params)
  a = Data.new(params)
  a.role = "admin"

  if a.password.blank?
    a.gen_pass
  end

  a.sendmailcnfrm
end

## Formatting

def register_user(params)
  user = User.new(params)
  user.role = "admin"
  if user.password.blank?
    user.generate_password
  end
  raise Error::InvalidUserError if user.email.blank? || user.username.blank? || user.phone.blank? || !(user.email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)) || !(user.phone.match(/\A\+?[\d\s\-\.\(\)]+\z/))
  raise Error::DuplicateUser if User.query("select count(1) from users where phone=#{user.phone} or email=#{user.email}") > 0

  user.save
  user.send_email_confirmation
  user
end

## Specific Job

def email_clients(clients)
  clients.each do |client|
    client_record = database.lookup(client)
    email(client) if client_record.active?
  end
end
